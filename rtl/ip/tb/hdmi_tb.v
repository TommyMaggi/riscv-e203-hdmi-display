`include "hdmi.v"
`include "color_bar_hor.v"
module tb_hdmi;

    // Inputs
    reg clk;
    reg rst_n;
    reg [7:0] ram_data;

    // Outputs
    wire [15:0] address_read_dbp;
    wire hsync, vsync, de;
    wire [23:0] hdmi_data;

    // Instantiate the HDMI module
    hdmi uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .ram_data(ram_data), 
        .address_read_dbp(address_read_dbp), 
        .hsync(hsync), 
        .vsync(vsync), 
        .de(de), 
        .hdmi_data(hdmi_data)
    );

    // Clock generation
    always #10 clk = ~clk;  // 50 MHz clock

    // Test RAM data initialization
    reg [7:0] ram [0:35];

    initial begin
        // Initialize the clock and reset
        clk = 0;
        rst_n = 0;

        // Initialize RAM data (according to the pattern provided)
        ram[0]  = 8'b01111000; ram[1]  = 8'b11001100; ram[2]  = 8'b00001100; ram[3]  = 8'b00111000;
        ram[8]  = 8'b00110000; ram[9]  = 8'b01111000; ram[10] = 8'b11001100; ram[11] = 8'b11001100;
        ram[16] = 8'b01111000; ram[17] = 8'b11001100; ram[18] = 8'b00001100; ram[19] = 8'b00111000;
        ram[32] = 8'b11111100; ram[33] = 8'b11001100; ram[34] = 8'b00001100; ram[35] = 8'b00011000;

        // Reset sequence
        #10;
        rst_n = 1;
        
        // Wait for a few clock cycles to observe behavior
        #1000;
        $finish;
    end

    // Drive RAM data based on address from the DUT
    always @* begin
        if (de && show_image) begin  // Only update during active display and when showing image
            ram_data <= ram[address_read_dbp];
        end else begin
            ram_data <= 8'b0;
        end
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%t, hsync=%b, vsync=%b, de=%b, hdmi_data=%h, address_read_dbp=%h", 
                 $time, hsync, vsync, de, hdmi_data, address_read_dbp);
    end
endmodule

