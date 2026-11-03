`include "top_module.v"
`timescale 1ns / 1ps

module top_module_tb;

    // Clock and reset signals
    reg clk;
    reg rst_n;

    // Input signals
    reg     [31:0]  data_in_32;
    reg     [7:0]   bit8_test;

    // Test DPB RAM
    reg     [15:0]  r_add_ram;

    wire    [15:0]  w_add_ram;
    wire    [7:0]   data_in_ram;
    wire    [7:0]   data_out_dpb;

    // HDMI output signals
    wire            hsync, vsync, de;
    wire    [23:0]  hdmi_data;
    wire            hdmi_clk;

    top_module my_top (
        .clk                (clk),
        .rst_n              (rst_n),
        .io_value_reg       (data_in_32),
        .io_interrupts_0_0  (io_interrupts_0_0),
//        .io_pad_out         (io_value_reg),
        .data_out_dpb       (data_out_dpb)
    );

    // Clock generation (25.2 MHz)
    initial begin
        clk = 1;
        forever begin
            #3.968 clk = ~clk;
        end
    end

    // Reset generation
    initial begin
        rst_n = 0;
        #5;                     // Hold reset low for a short duration
        rst_n = 1;
    end

// Test data generation
    initial begin
        // Initialize signals
        clk = 0;
        data_in_32 = 0;

        // Test case 1: Single data input
        data_in_32 = 32'h12345678; // Example data
        bit8_test = 8'b11110000;
        #40; // Wait for data to be processed

        // Test case 2: Multiple data inputs
        data_in_32 = 32'h87654321;
        #10;
        data_in_32 = 32'hABCDEF01;
        #10;
        data_in_32 = 32'h2468ACE0;
        #10;
    
// ICB command simulation (example) - ADJUSTED



        // Simulate color bar display for 0.05 milliseconds
        repeat (450000) @(posedge clk); 
        
        
        // Test case 2: Multiple data inputs
        data_in_32 = 32'h87654321;
        #10;
        data_in_32 = 32'hABCDEF01;
        #10;
        data_in_32 = 32'h2468ACE0;
        #10;
        $finish;      

        // Continue simulation for another 0.05 milliseconds to see characters
        repeat (400000) @(posedge clk); 

        $finish; // End simulation after 0.1 milliseconds
    end             
    
    // GTKWave dump
    initial begin
        $dumpfile("top_module_tb.vcd");
        $dumpvars(0, top_module_tb);
    end

    

endmodule
