//`include "splitter.v"
//`include "gowin_dpb.v"
//`include "prim_sim.v"
//`include "hdmi.v"

module top_module (
    input                   clk,
    input                   rst_n,
    input        [31:0]     io_pad_out,

    output                  V_sync,
    output                  H_sync,              
    output       [23:0]     hdmi_data_out
);


//define a 32-bit register for operating your module
reg     [31:0]  io_value_reg;

// Test DPB RAM
wire    [15:0]  r_add_ram;
wire    [7:0]   data_out_dpb;
wire    [15:0]  w_add_ram;
wire    [7:0]   data_in_ram;
wire            w_enable;

// ----------------------------------------------------------------------------
// Instance for register splitter
// ----------------------------------------------------------------------------

register_splitter my_reg_splitter (
    .clk(clk),
    .data_in_32(io_pad_out),
    .data_out_8(data_in_ram),
    .address(w_add_ram),
    .write_enable(w_enable)
);

// ----------------------------------------------------------------------------
// Instance for dbp ram
// ----------------------------------------------------------------------------

Gowin_DPB your_instance_name(
    .douta(),               //output [7:0] douta
    .doutb(data_out_dpb),   //output [7:0] doutb
    .clka(clk),             //input clka
    .ocea(1'b1),                //input ocea
    .cea(1'b1),         //input cea
    .reseta(1'b0),         //input reseta
    .wrea(1'b1),            //input wrea
    .clkb(clk),             //input clkb
    .oceb(1'b1),                //input oceb
    .ceb(1'b1),             //input ceb
    .resetb(1'b0),         //input resetb
    .wreb(1'b0),            //input wreb
    .ada(w_add_ram),        //input [15:0] ada
    .dina(data_in_ram),     //input [7:0] dina
    .adb(r_add_ram),        //input [15:0] adb
    .dinb()                 //input [7:0] dinb
    );

// ----------------------------------------------------------------------------
// Instance for hdmi module
// ----------------------------------------------------------------------------

hdmi my_hdmi(
    .clk(clk),
    .rst_n(rst_n),
    .ram_data(data_out_dpb),
    .address_read_dbp(r_add_ram),
    .hsync(H_sync),
    .vsync(V_sync),
    .de(de_temp),
    .hdmi_data(hdmi_data_out)
);

/*always @(posedge clk) begin
            $display("Time: %t   Address write = %d   Data out split = %h  Address read = %d   Data out ram = %d    Hdmi data out = %b",
                     $time, w_add_ram, data_in_ram, r_add_ram, data_out_dpb, hdmi_data);
    end
*/
endmodule