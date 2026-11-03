module color_bar_hor (
    input wire       I_pxl_clk,   // Pixel clock
    input wire       I_rst_n,     // Active-low reset
    input wire [31:0] I_h_total, // Total horizontal pixels per line
    input wire [31:0] I_h_sync,  // Horizontal sync pulse width (pixels)
    input wire [31:0] I_h_bporch, // Horizontal back porch (pixels)
    input wire [31:0] I_h_fporch, // Horizontal front porch (pixels)
    input wire [31:0] I_h_res,   // Horizontal active video area (pixels)
    input wire [31:0] I_v_total, // Total vertical lines per frame
    input wire [31:0] I_v_sync,  // Vertical sync pulse width (lines)
    input wire [31:0] I_v_bporch, // Vertical back porch (lines)
    input wire [31:0] I_v_fporch, // Vertical front porch (lines)
    input wire [31:0] I_v_res,   // Vertical active video area (lines)
    input wire [11:0]I_h_count,
    input wire [11:0]I_v_count,
    input wire       I_de,           
    output reg [7:0] O_data_r, // Red color component
    output reg [7:0] O_data_g, // Green color component
    output reg [7:0] O_data_b  // Blue color component
);

// Color Definitions
localparam [23:0] WHITE   = 24'hFFFFFF;
localparam [23:0] YELLOW  = 24'hFFFF00;
localparam [23:0] CYAN    = 24'h00FFFF;
localparam [23:0] GREEN   = 24'h00FF00;
localparam [23:0] MAGENTA = 24'hFF00FF;
localparam [23:0] RED     = 24'hFF0000;
localparam [23:0] BLUE    = 24'h0000FF;
localparam [23:0] BLACK   = 24'h000000;

// Calculate the height of each color bar segment
wire [9:0] segment_height = I_v_res / 8;

// Color Bar Pattern Generation
always @(posedge I_pxl_clk or negedge I_rst_n) begin
    if (!I_rst_n) begin
        // Initialize outputs on reset
        {O_data_r, O_data_g, O_data_b} <= BLACK; 
    end else if (I_de) begin // Only update colors when data enable is active
        // Determine which color to output based on the current vertical count
        case ((I_v_count-33) / segment_height)
            0: {O_data_r, O_data_g, O_data_b} <= WHITE;
            1: {O_data_r, O_data_g, O_data_b} <= YELLOW;
            2: {O_data_r, O_data_g, O_data_b} <= CYAN;
            3: {O_data_r, O_data_g, O_data_b} <= GREEN;
            4: {O_data_r, O_data_g, O_data_b} <= MAGENTA;
            5: {O_data_r, O_data_g, O_data_b} <= RED;
            6: {O_data_r, O_data_g, O_data_b} <= BLUE;
            7: {O_data_r, O_data_g, O_data_b} <= BLACK;
            default: {O_data_r, O_data_g, O_data_b} <= BLACK;
        endcase
    end else begin
        {O_data_r, O_data_g, O_data_b} <= BLACK; // Black during blanking intervals
    end
end

endmodule
/*
module color_bar_hor (
    input wire        I_pxl_clk,  // Pixel clock
    input wire        I_rst_n,    // Active-low reset
    input wire [31:0] I_h_total,  // Total horizontal pixels per line
    input wire [31:0] I_h_sync,   // Horizontal sync pulse width (pixels)
    input wire [31:0] I_h_bporch, // Horizontal back porch (pixels)
    input wire [31:0] I_h_fporch, // Horizontal front porch (pixels)
    input wire [31:0] I_h_res,    // Horizontal active video area (pixels)
    input wire [31:0] I_v_total,  // Total vertical lines per frame
    input wire [31:0] I_v_sync,   // Vertical sync pulse width (lines)
    input wire [31:0] I_v_bporch, // Vertical back porch (lines)
    input wire [31:0] I_v_fporch, // Vertical front porch (lines)
    input wire [31:0] I_v_res,    // Vertical active video area (lines)
    input wire [11:0] I_h_count,  // Horizontal count
    input wire [11:0] I_v_count,  // Vertical count
    input wire        I_de,       // Data enable
    output wire [7:0] O_data_r,   // Red color component
    output wire [7:0] O_data_g,   // Green color component
    output wire [7:0] O_data_b    // Blue color component
);

// Color Definitions
localparam [23:0] WHITE   = 24'hFFFFFF;
localparam [23:0] YELLOW  = 24'hFFFF00;
localparam [23:0] CYAN    = 24'h00FFFF;
localparam [23:0] GREEN   = 24'h00FF00;
localparam [23:0] MAGENTA = 24'hFF00FF;
localparam [23:0] RED     = 24'hFF0000;
localparam [23:0] BLUE    = 24'h0000FF;
localparam [23:0] BLACK   = 24'h000000;

// Calculate the height of each color bar segment
wire [9:0] segment_height = I_v_res / 8;

// Combinational logic to determine the color data
wire [23:0] color_data;

assign color_data = (I_de) ? (
    ((I_v_count-33) / segment_height == 0) ? WHITE :
    ((I_v_count-33) / segment_height == 1) ? YELLOW :
    ((I_v_count-33) / segment_height == 2) ? CYAN :
    ((I_v_count-33) / segment_height == 3) ? GREEN :
    ((I_v_count-33) / segment_height == 4) ? MAGENTA :
    ((I_v_count-33) / segment_height == 5) ? RED :
    ((I_v_count-33) / segment_height == 6) ? BLUE :
    ((I_v_count-33) / segment_height == 7) ? BLACK :
    BLACK
) : BLACK;

// Assign color components to output wires
assign O_data_r = color_data[23:16];
assign O_data_g = color_data[15:8];
assign O_data_b = color_data[7:0];

endmodule*/