module color_bar_ver (
    input wire I_pxl_clk,   // Pixel clock
    input wire I_rst_n,     // Active-low reset
    input wire [9:0] I_h_total, // Total horizontal pixels per line
    input wire [9:0] I_h_sync,  // Horizontal sync pulse width (pixels)
    input wire [9:0] I_h_bporch, // Horizontal back porch (pixels)
    input wire [9:0] I_h_fporch, // Horizontal front porch (pixels)
    input wire [9:0] I_h_res,   // Horizontal active video area (pixels)
    input wire [9:0] I_v_total, // Total vertical lines per frame
    input wire [9:0] I_v_sync,  // Vertical sync pulse width (lines)
    input wire [9:0] I_v_bporch, // Vertical back porch (lines)
    input wire [9:0] I_v_fporch, // Vertical front porch (lines)
    input wire [9:0] I_v_res,   // Vertical active video area (lines)
    input      [11:0]I_h_count,
    input      [11:0]I_v_count,
    input wire I_hs_pol,     // HSYNC polarity (1 for active high)
    input wire I_vs_pol,     // VSYNC polarity (1 for active high)
    input wire I_de,           
    output reg [7:0] O_data_r, // Red color component
    output reg [7:0] O_data_g, // Green color component
    output reg [7:0] O_data_b  // Blue color component
);

reg [2:0] col_cnt;

// Color Definitions
localparam [23:0] WHITE   = 24'hFFFFFF;
localparam [23:0] YELLOW  = 24'hFFFF00;
localparam [23:0] CYAN    = 24'h00FFFF;
localparam [23:0] GREEN   = 24'h00FF00;
localparam [23:0] MAGENTA = 24'hFF00FF;
localparam [23:0] RED     = 24'hFF0000;
localparam [23:0] BLUE    = 24'h0000FF;
localparam [23:0] BLACK   = 24'h000000;

// Color Bar Pattern Generation
always @(posedge I_pxl_clk or negedge I_rst_n) begin
    if (!I_rst_n) begin
        // Initialize outputs on reset
        {O_data_r, O_data_g, O_data_b} <= BLACK;
        col_cnt <= 0; // Reset color counter on reset
    end else begin
        if (I_de) begin // Only update colors when data enable is active
            // Reset color counter at the beginning of each line
            if (I_h_count == I_h_fporch) begin 
                col_cnt <= 0;
            end else if (I_h_count > I_h_fporch && I_h_count < (I_h_res + I_h_fporch)) begin
                // Increment color counter for each new color bar segment
                if ((I_h_count - I_h_fporch) % (I_h_res / 8) == 0) begin
                    col_cnt <= col_cnt + 1;
                end

                // Select color based on the color counter
                case (col_cnt)
                    0: {O_data_r, O_data_g, O_data_b} <= WHITE;
                    1: {O_data_r, O_data_g, O_data_b} <= YELLOW;
                    2: {O_data_r, O_data_g, O_data_b} <= CYAN;
                    3: {O_data_r, O_data_g, O_data_b} <= GREEN;
                    4: {O_data_r, O_data_g, O_data_b} <= MAGENTA;
                    5: {O_data_r, O_data_g, O_data_b} <= RED;
                    6: {O_data_r, O_data_g, O_data_b} <= BLUE;
                    default: {O_data_r, O_data_g, O_data_b} <= BLACK;
                endcase
            end
        end else begin
            // Output black outside the active video area
            {O_data_r, O_data_g, O_data_b} <= BLACK;
        end
    end
end

endmodule
