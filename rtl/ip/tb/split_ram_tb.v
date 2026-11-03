`include "splitter.v"
`include "hdmi.v"
`include "gowin_dpb.v"
`include "prim_sim.v"
`timescale 1ns / 1ps

module split_ram_tb;

    // Clock and reset signals
    reg clk;
    reg rst_n;

    // Input signals
    reg     [31:0]  data_in_32;

    // Test DPB RAM
    reg     [15:0]  r_add_ram;

    wire    [15:0]  w_add_ram;
    wire    [7:0]   data_in_ram;
    wire    [7:0]   data_out_dpb;

    // HDMI output signals
    wire            hsync, vsync, de;
    wire    [23:0]  hdmi_data;
    wire            hdmi_clk;


// ----------------------------------------------------------------------------
// Instance for register splitter
// ----------------------------------------------------------------------------

register_splitter my_reg_splitter (
    .clk(clk),
    .data_in_32(data_in_32),
    .data_out_8(data_in_ram),
    .address(w_add_ram),
    .write_enable()
);

// ----------------------------------------------------------------------------
// Instance for dbp ram
// ----------------------------------------------------------------------------

Gowin_DPB your_instance_name(
        .douta(),               //output [7:0] douta
        .doutb(data_out_dpb),   //output [7:0] doutb
        .clka(clk),             //input clka
        .ocea(1'b1),                //input ocea
        .cea(1'b1),             //input cea
        .reseta(1'b0),         //input reseta
        .wrea(1'b1),            //input wrea
        .clkb(clk),             //input clkb
        .oceb(1'b1),            //input oceb
        .ceb(1'b1),                 //input ceb
        .resetb(1'b0),         //input resetb
        .wreb(1'b0),            //input wreb
        .ada(w_add_ram),        //input [15:0] ada
        .dina(data_in_ram),     //input [7:0] dina
        .adb(r_add_ram),        //input [15:0] adb
        .dinb(8'b00000000)      //input [7:0] dinb
    );

// ----------------------------------------------------------------------------
// Instance for hdmi module
// ----------------------------------------------------------------------------

    // Instantiate the HDMI module
    hdmi my_hdmi(
    .clk(clk),
    .rst_n(rst_n),
    .ram_data(),
    .address_read_dbp(),
    .hsync(hsync_temp),
    .vsync(v_sync_temp),
    .de(de_temp),
    .hdmi_data()
//   .hdmi_clk()
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
        #5;     

    end

// Test data generation
    initial begin
        // Initialize signals
        clk = 0;
        data_in_32 = 0;

        // Test case 1: Single data input
        //data_in_32 = 32'h12345678; // Example data
        #10; // Wait for data to be processed

        // Test case 2: Multiple data inputs
        data_in_32 = 32'h87654321;
        #10;
        data_in_32 = 32'hABCDEF01;
        #10;
        data_in_32 = 32'h2468ACE0;
        #10;

        // Test case 3: No data input (check for extra address increments)
        data_in_32 = 0;
        #40; // Wait for a few cycles to observe behavior

        // Test case 4: Data input after a pause
        data_in_32 = 32'h98765432;
        #10;

        r_add_ram = 16'h00000005;
        #50;
        r_add_ram = 16'h00000006;
        #50;
        r_add_ram = 16'h00000007;
        #50;
        r_add_ram = 16'h00000008;
        #50;
        r_add_ram = 16'h00000009;
        #50;
        r_add_ram = 16'h0000000A;

        #100 $finish;             
    end

    // GTKWave dump
    initial begin
        $dumpfile("split_ram_tb.vcd");
        $dumpvars(0, split_ram_tb);
    end

    always @(posedge clk) begin
            $display("Time: %t   Address write = %d   Data out split = %h  Address_read = %d   Data out ram = %d",
                     $time, w_add_ram, data_in_ram, r_add_ram, data_out_dpb);
    end

endmodule
