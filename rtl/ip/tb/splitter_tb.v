`include "splitter.v"
`timescale 1ns / 1ps

module register_splitter_tb;

    reg clk;
    reg [31:0] data_in;
    wire [7:0] data_out;
    wire [15:0] address;
    wire write_enable;

    // Instantiate the register_splitter module
    register_splitter dut (
        .clk(clk),
        .data_in_32(data_in),
        .data_out_8(data_out),
        .address(address),
        .write_enable(write_enable)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (5ns high, 5ns low)
    end

    // Test data generation
    initial begin
        // Initialize signals
        clk = 0;
        data_in = 0;

        // Test case 1: Single data input
        //data_in = 32'h12345678; // Example data
        #40; // Wait for data to be processed

        // Test case 2: Multiple data inputs
//        data_in = 32'h87654321;
//        #10;
//        data_in = 32'hABCDEF01;
//        #10;
//        data_in = 32'h2468ACE0;
//        #10;

        // Test case 3: No data input (check for extra address increments)
//        data_in_32 = 0;
//        #40; // Wait for a few cycles to observe behavior

        // Test case 4: Data input after a pause
        data_in = 32'h0C1E3333;

        #150 $finish;             
    end

    // Display outputs
    initial begin
        $monitor("Time=%t, data_out=%h, address=%h, write_enable=%b", 
                 $time, data_out, address, write_enable);
    end

    // GTKWave dump
    initial begin
        $dumpfile("splitter.vcd");
        $dumpvars(0, register_splitter_tb);
    end  
endmodule