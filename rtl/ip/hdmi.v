module hdmi (
    input wire              clk,                // System clock (25.2 MHz)
    input wire              rst_n,              // Asynchronous reset (active low)

    input wire     [7:0]    ram_data,           // Response data from dpbram
    output reg    [15:0]    address_read_dbp,   // Read address for dpb ram

    output reg              hsync, vsync, de,   // Video timing signals
    output wire   [23:0]    hdmi_data           // Pixel data to display
);

// ----------------------------------------------------------------------------
// Parameters for video timing and character size
// ----------------------------------------------------------------------------

parameter H_ACTIVE          = 640;          // Horizontal active video area (pixels)
parameter H_FRONT_PORCH     = 16;           // Horizontal front porch (pixels)
parameter H_SYNC_PULSE      = 96;           // Horizontal sync pulse width (pixels)
parameter H_BACK_PORCH      = 48;           // Horizontal back porch (pixels)
parameter H_TOTAL           = 800;          // Total horizontal pixels per line

parameter V_ACTIVE          = 480;          // Vertical active video area (lines)
parameter V_FRONT_PORCH     = 10;           // Vertical front porch (lines)
parameter V_SYNC_PULSE      = 2;            // Vertical sync pulse width (lines)
parameter V_BACK_PORCH      = 33;           // Vertical back porch (lines)
parameter V_TOTAL           = 525;          // Total vertical lines per frame

parameter COLOR_BAR_TIME    = 3;            // Color bar display time in seconds
parameter CLK_FREQ          = 385200;       // System clock frequency (Hz)

// ----------------------------------------------------------------------------
// Registers and Wires
// ----------------------------------------------------------------------------

reg  [11:0] h_count;                        // Horizontal pixel counter
reg  [11:0] v_count;                        // Vertical line counter
reg  [21:0] color_bar_timer;                // Timer for displaying color bars

wire [7:0]  color_bar_data_r;               //Register for color bar data red
wire [7:0]  color_bar_data_g;               //Register for color bar data green
wire [7:0]  color_bar_data_b;               //Register for color bar data blue

reg  [18:0] rd_addr_reg;                    // Registered read address for DPB RAM

// ----------------------------------------------------------------------------
// Video Timing Generation
// ----------------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset counters and timing signals
        h_count <= 0;
        v_count <= 0;
        hsync <= 1'b1;                          // Start in horizontal sync
        vsync <= 1'b1;                          // Start in vertical sync
        de <= 1'b0;                             // Data enable initially inactive
        color_bar_timer <= 22'b0;
        show_color_bars <= 1'b1;                // Start by showing color bars
    end else begin
        // Increment counters
        if (h_count == H_TOTAL - 1) begin 
            h_count <= 0;
            if (v_count == V_TOTAL - 1) begin
                v_count <= 0;                   // Reset vertical counter at end of frame
            end else begin
                v_count <= v_count + 1;         // Increment vertical counter
            end
        end else begin
            h_count <= h_count + 1;             // Increment horizontal counter
        end
                                                // Generate timing signals based on counters and parameters
        hsync <= (h_count <= (H_BACK_PORCH + H_ACTIVE + H_FRONT_PORCH)) ? 1'b1 : 1'b0;      // Low during sync pulse
        vsync <= (v_count <= (V_BACK_PORCH + V_ACTIVE + V_FRONT_PORCH)) ? 1'b1 : 1'b0;      // Low during sync pulse
        de    <= ((h_count >= H_BACK_PORCH) && (h_count <= (H_BACK_PORCH + H_ACTIVE))) && ((v_count >= V_BACK_PORCH) && (v_count <= (V_BACK_PORCH + V_ACTIVE))) ? 1'b1 : 1'b0;// High during active video

                                                // Update Color Bar Timer and show_color_bars
        if (color_bar_timer < (140000/*425000*/ * COLOR_BAR_TIME)) begin
            color_bar_timer <= color_bar_timer + 1;
        end else begin
            show_color_bars <= 1'b0;            // Disable color bars after 5 seconds
            color_bar_timer <= 0;               // Reset the timer
            show_image <= 1'b1;                 // Set flag for output character
        end
    end
end

// ----------------------------------------------------------------------------
// Pixel Data Output
// ----------------------------------------------------------------------------

reg show_image;                                                                     // Flag to control when to display image data
reg show_color_bars;                                                                // Flag to control when to display color bars

// Create combinational logic for hdmi_data based on the state of show_image and show_color_bars
//assign hdmi_data = (show_color_bars && !show_image) ? {color_bar_data_r, color_bar_data_g, color_bar_data_b} : {24{ram_data[pixel_x[2:0]]}};
reg [23:0] hdmi_data_reg;

always @* begin
    if (show_color_bars) begin
        hdmi_data_reg = {color_bar_data_r, color_bar_data_g, color_bar_data_b};
    end else begin
        hdmi_data_reg = {24{ram_data[pixel_x[2:0]]}};
    end
end

assign hdmi_data = hdmi_data_reg;
// ----------------------------------------------------------------------------
// Color Bar Generator (Integrated from color_bar module)
// ----------------------------------------------------------------------------

color_bar_hor my_color_bar (
    .I_pxl_clk(clk),                        // Clock for color bar
    .I_rst_n(rst_n),
    .I_h_total(H_TOTAL),
    .I_h_sync(H_SYNC_PULSE),
    .I_h_bporch(H_BACK_PORCH),
    .I_h_fporch(H_FRONT_PORCH),
    .I_h_res(H_ACTIVE),
    .I_v_total(V_TOTAL),
    .I_v_sync(V_SYNC_PULSE),
    .I_v_bporch(V_BACK_PORCH),
    .I_v_fporch(V_FRONT_PORCH),
    .I_v_res(V_ACTIVE),
    .I_h_count(h_count),
    .I_v_count(v_count),
    .I_de(de),
    .O_data_r(color_bar_data_r),
    .O_data_g(color_bar_data_g),
    .O_data_b(color_bar_data_b)
);

// ----------------------------------------------------------------------------
// Read address generation logic
// ----------------------------------------------------------------------------

reg [15:0]  rd_addr;                                            // Read address for DPB RAM (16 bits for 64K addresses)
reg [6:0]   line_counter;
reg [6:0]   line_cnt_2;

always @(posedge clk) begin
    if (~(hsync | vsync)) begin
        rd_addr <= 16'd0;
        line_cnt_2 <= 7'b0;
        line_counter <= 7'b0;  // Reset address at the beginning of each frame (top-left corner)
    end else if(((pixel_x % 8) == 0) && (pixel_x != 640)) begin // Increment read address every 8 pixels
        rd_addr <= ((pixel_x + pixel_y) + ((line_counter * 640 - line_counter*8)));
        if ((v_count > 34) && (((v_count - 34) % 8) == 0) && (h_count == 30)) begin
            line_counter <= line_counter + 1;
        end
    end
end

assign address_read_dbp = rd_addr;                              // Output the read address to the DPB RAM

// ----------------------------------------------------------------------------
// Data output to HDMI
// ----------------------------------------------------------------------------

reg [9:0] pixel_x, pixel_y;                             // Pixel coordinates (10 bits for 640x480 resolution)

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pixel_x <= 10'd0;                               // Reset x coordinate
        pixel_y <= 10'd0;                               // Reset y coordinate
    end else begin
        if (de && show_image) begin                     // Only update during active display and when showing image
            pixel_x <= h_count - H_BACK_PORCH - 1;      // Subtract non-active pixels from h_count
            pixel_y <= v_count - V_BACK_PORCH - 1;      // Subtract non-active lines from v_count
        end else begin
            pixel_x <= 10'd0;                           // Reset x coordinate to 0 when not in active area
            pixel_y <= 10'd0;                           // Reset y coordinate to 0 when not in active area
        end
    end
end

endmodule