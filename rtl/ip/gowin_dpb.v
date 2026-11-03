//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-4 Education
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18
//Device Version: C
//Created Time: Fri Jun  7 18:51:48 2024

module Gowin_DPB (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [7:0] douta;
output [7:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [15:0] ada;
input [7:0] dina;
input [15:0] adb;
input [7:0] dinb;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire [14:0] dpb_inst_0_douta_w;
wire [0:0] dpb_inst_0_douta;
wire [14:0] dpb_inst_0_doutb_w;
wire [0:0] dpb_inst_0_doutb;
wire [14:0] dpb_inst_1_douta_w;
wire [0:0] dpb_inst_1_douta;
wire [14:0] dpb_inst_1_doutb_w;
wire [0:0] dpb_inst_1_doutb;
wire [14:0] dpb_inst_2_douta_w;
wire [1:1] dpb_inst_2_douta;
wire [14:0] dpb_inst_2_doutb_w;
wire [1:1] dpb_inst_2_doutb;
wire [14:0] dpb_inst_3_douta_w;
wire [1:1] dpb_inst_3_douta;
wire [14:0] dpb_inst_3_doutb_w;
wire [1:1] dpb_inst_3_doutb;
wire [14:0] dpb_inst_4_douta_w;
wire [2:2] dpb_inst_4_douta;
wire [14:0] dpb_inst_4_doutb_w;
wire [2:2] dpb_inst_4_doutb;
wire [14:0] dpb_inst_5_douta_w;
wire [2:2] dpb_inst_5_douta;
wire [14:0] dpb_inst_5_doutb_w;
wire [2:2] dpb_inst_5_doutb;
wire [14:0] dpb_inst_6_douta_w;
wire [3:3] dpb_inst_6_douta;
wire [14:0] dpb_inst_6_doutb_w;
wire [3:3] dpb_inst_6_doutb;
wire [14:0] dpb_inst_7_douta_w;
wire [3:3] dpb_inst_7_douta;
wire [14:0] dpb_inst_7_doutb_w;
wire [3:3] dpb_inst_7_doutb;
wire [14:0] dpb_inst_8_douta_w;
wire [4:4] dpb_inst_8_douta;
wire [14:0] dpb_inst_8_doutb_w;
wire [4:4] dpb_inst_8_doutb;
wire [14:0] dpb_inst_9_douta_w;
wire [4:4] dpb_inst_9_douta;
wire [14:0] dpb_inst_9_doutb_w;
wire [4:4] dpb_inst_9_doutb;
wire [14:0] dpb_inst_10_douta_w;
wire [5:5] dpb_inst_10_douta;
wire [14:0] dpb_inst_10_doutb_w;
wire [5:5] dpb_inst_10_doutb;
wire [14:0] dpb_inst_11_douta_w;
wire [5:5] dpb_inst_11_douta;
wire [14:0] dpb_inst_11_doutb_w;
wire [5:5] dpb_inst_11_doutb;
wire [14:0] dpb_inst_12_douta_w;
wire [6:6] dpb_inst_12_douta;
wire [14:0] dpb_inst_12_doutb_w;
wire [6:6] dpb_inst_12_doutb;
wire [14:0] dpb_inst_13_douta_w;
wire [6:6] dpb_inst_13_douta;
wire [14:0] dpb_inst_13_doutb_w;
wire [6:6] dpb_inst_13_doutb;
wire [14:0] dpb_inst_14_douta_w;
wire [7:7] dpb_inst_14_douta;
wire [14:0] dpb_inst_14_doutb_w;
wire [7:7] dpb_inst_14_doutb;
wire [14:0] dpb_inst_15_douta_w;
wire [7:7] dpb_inst_15_douta;
wire [14:0] dpb_inst_15_doutb_w;
wire [7:7] dpb_inst_15_doutb;
wire [11:0] dpb_inst_16_douta_w;
wire [3:0] dpb_inst_16_douta;
wire [11:0] dpb_inst_16_doutb_w;
wire [3:0] dpb_inst_16_doutb;
wire [11:0] dpb_inst_17_douta_w;
wire [7:4] dpb_inst_17_douta;
wire [11:0] dpb_inst_17_doutb_w;
wire [7:4] dpb_inst_17_doutb;
wire [7:0] dpb_inst_18_douta_w;
wire [7:0] dpb_inst_18_douta;
wire [7:0] dpb_inst_18_doutb_w;
wire [7:0] dpb_inst_18_doutb;
wire dff_q_0;
wire dff_q_1;
wire dff_q_3;
wire dff_q_4;
wire dff_q_6;
wire mux_o_6;
wire mux_o_10;
wire mux_o_19;
wire mux_o_23;
wire mux_o_32;
wire mux_o_36;
wire mux_o_45;
wire mux_o_49;
wire mux_o_58;
wire mux_o_62;
wire mux_o_71;
wire mux_o_75;
wire mux_o_84;
wire mux_o_88;
wire mux_o_97;
wire mux_o_101;
wire mux_o_110;
wire mux_o_114;
wire mux_o_123;
wire mux_o_127;
wire mux_o_136;
wire mux_o_140;
wire mux_o_149;
wire mux_o_153;
wire mux_o_162;
wire mux_o_166;
wire mux_o_175;
wire mux_o_179;
wire mux_o_188;
wire mux_o_192;
wire mux_o_201;
wire mux_o_205;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_0.INIT = 16'h0100;
LUT5 lut_inst_1 (
  .F(lut_f_1),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14]),
  .I4(ada[15])
);
defparam lut_inst_1.INIT = 32'h00040000;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_2.INIT = 16'h0100;
LUT5 lut_inst_3 (
  .F(lut_f_3),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14]),
  .I4(adb[15])
);
defparam lut_inst_3.INIT = 32'h00040000;
DPB dpb_inst_0 (
    .DOA({dpb_inst_0_douta_w[14:0],dpb_inst_0_douta[0]}),
    .DOB({dpb_inst_0_doutb_w[14:0],dpb_inst_0_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_0.READ_MODE0 = 1'b0;
defparam dpb_inst_0.READ_MODE1 = 1'b0;
defparam dpb_inst_0.WRITE_MODE0 = 2'b00;
defparam dpb_inst_0.WRITE_MODE1 = 2'b00;
defparam dpb_inst_0.BIT_WIDTH_0 = 1;
defparam dpb_inst_0.BIT_WIDTH_1 = 1;
defparam dpb_inst_0.BLK_SEL_0 = 3'b000;
defparam dpb_inst_0.BLK_SEL_1 = 3'b000;
defparam dpb_inst_0.RESET_MODE = "ASYNC";

DPB dpb_inst_1 (
    .DOA({dpb_inst_1_douta_w[14:0],dpb_inst_1_douta[0]}),
    .DOB({dpb_inst_1_doutb_w[14:0],dpb_inst_1_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_1.READ_MODE0 = 1'b0;
defparam dpb_inst_1.READ_MODE1 = 1'b0;
defparam dpb_inst_1.WRITE_MODE0 = 2'b00;
defparam dpb_inst_1.WRITE_MODE1 = 2'b00;
defparam dpb_inst_1.BIT_WIDTH_0 = 1;
defparam dpb_inst_1.BIT_WIDTH_1 = 1;
defparam dpb_inst_1.BLK_SEL_0 = 3'b001;
defparam dpb_inst_1.BLK_SEL_1 = 3'b001;
defparam dpb_inst_1.RESET_MODE = "ASYNC";

DPB dpb_inst_2 (
    .DOA({dpb_inst_2_douta_w[14:0],dpb_inst_2_douta[1]}),
    .DOB({dpb_inst_2_doutb_w[14:0],dpb_inst_2_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_2.READ_MODE0 = 1'b0;
defparam dpb_inst_2.READ_MODE1 = 1'b0;
defparam dpb_inst_2.WRITE_MODE0 = 2'b00;
defparam dpb_inst_2.WRITE_MODE1 = 2'b00;
defparam dpb_inst_2.BIT_WIDTH_0 = 1;
defparam dpb_inst_2.BIT_WIDTH_1 = 1;
defparam dpb_inst_2.BLK_SEL_0 = 3'b000;
defparam dpb_inst_2.BLK_SEL_1 = 3'b000;
defparam dpb_inst_2.RESET_MODE = "ASYNC";

DPB dpb_inst_3 (
    .DOA({dpb_inst_3_douta_w[14:0],dpb_inst_3_douta[1]}),
    .DOB({dpb_inst_3_doutb_w[14:0],dpb_inst_3_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_3.READ_MODE0 = 1'b0;
defparam dpb_inst_3.READ_MODE1 = 1'b0;
defparam dpb_inst_3.WRITE_MODE0 = 2'b00;
defparam dpb_inst_3.WRITE_MODE1 = 2'b00;
defparam dpb_inst_3.BIT_WIDTH_0 = 1;
defparam dpb_inst_3.BIT_WIDTH_1 = 1;
defparam dpb_inst_3.BLK_SEL_0 = 3'b001;
defparam dpb_inst_3.BLK_SEL_1 = 3'b001;
defparam dpb_inst_3.RESET_MODE = "ASYNC";

DPB dpb_inst_4 (
    .DOA({dpb_inst_4_douta_w[14:0],dpb_inst_4_douta[2]}),
    .DOB({dpb_inst_4_doutb_w[14:0],dpb_inst_4_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_4.READ_MODE0 = 1'b0;
defparam dpb_inst_4.READ_MODE1 = 1'b0;
defparam dpb_inst_4.WRITE_MODE0 = 2'b00;
defparam dpb_inst_4.WRITE_MODE1 = 2'b00;
defparam dpb_inst_4.BIT_WIDTH_0 = 1;
defparam dpb_inst_4.BIT_WIDTH_1 = 1;
defparam dpb_inst_4.BLK_SEL_0 = 3'b000;
defparam dpb_inst_4.BLK_SEL_1 = 3'b000;
defparam dpb_inst_4.RESET_MODE = "ASYNC";

DPB dpb_inst_5 (
    .DOA({dpb_inst_5_douta_w[14:0],dpb_inst_5_douta[2]}),
    .DOB({dpb_inst_5_doutb_w[14:0],dpb_inst_5_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_5.READ_MODE0 = 1'b0;
defparam dpb_inst_5.READ_MODE1 = 1'b0;
defparam dpb_inst_5.WRITE_MODE0 = 2'b00;
defparam dpb_inst_5.WRITE_MODE1 = 2'b00;
defparam dpb_inst_5.BIT_WIDTH_0 = 1;
defparam dpb_inst_5.BIT_WIDTH_1 = 1;
defparam dpb_inst_5.BLK_SEL_0 = 3'b001;
defparam dpb_inst_5.BLK_SEL_1 = 3'b001;
defparam dpb_inst_5.RESET_MODE = "ASYNC";

DPB dpb_inst_6 (
    .DOA({dpb_inst_6_douta_w[14:0],dpb_inst_6_douta[3]}),
    .DOB({dpb_inst_6_doutb_w[14:0],dpb_inst_6_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_6.READ_MODE0 = 1'b0;
defparam dpb_inst_6.READ_MODE1 = 1'b0;
defparam dpb_inst_6.WRITE_MODE0 = 2'b00;
defparam dpb_inst_6.WRITE_MODE1 = 2'b00;
defparam dpb_inst_6.BIT_WIDTH_0 = 1;
defparam dpb_inst_6.BIT_WIDTH_1 = 1;
defparam dpb_inst_6.BLK_SEL_0 = 3'b000;
defparam dpb_inst_6.BLK_SEL_1 = 3'b000;
defparam dpb_inst_6.RESET_MODE = "ASYNC";

DPB dpb_inst_7 (
    .DOA({dpb_inst_7_douta_w[14:0],dpb_inst_7_douta[3]}),
    .DOB({dpb_inst_7_doutb_w[14:0],dpb_inst_7_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_7.READ_MODE0 = 1'b0;
defparam dpb_inst_7.READ_MODE1 = 1'b0;
defparam dpb_inst_7.WRITE_MODE0 = 2'b00;
defparam dpb_inst_7.WRITE_MODE1 = 2'b00;
defparam dpb_inst_7.BIT_WIDTH_0 = 1;
defparam dpb_inst_7.BIT_WIDTH_1 = 1;
defparam dpb_inst_7.BLK_SEL_0 = 3'b001;
defparam dpb_inst_7.BLK_SEL_1 = 3'b001;
defparam dpb_inst_7.RESET_MODE = "ASYNC";

DPB dpb_inst_8 (
    .DOA({dpb_inst_8_douta_w[14:0],dpb_inst_8_douta[4]}),
    .DOB({dpb_inst_8_doutb_w[14:0],dpb_inst_8_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_8.READ_MODE0 = 1'b0;
defparam dpb_inst_8.READ_MODE1 = 1'b0;
defparam dpb_inst_8.WRITE_MODE0 = 2'b00;
defparam dpb_inst_8.WRITE_MODE1 = 2'b00;
defparam dpb_inst_8.BIT_WIDTH_0 = 1;
defparam dpb_inst_8.BIT_WIDTH_1 = 1;
defparam dpb_inst_8.BLK_SEL_0 = 3'b000;
defparam dpb_inst_8.BLK_SEL_1 = 3'b000;
defparam dpb_inst_8.RESET_MODE = "ASYNC";

DPB dpb_inst_9 (
    .DOA({dpb_inst_9_douta_w[14:0],dpb_inst_9_douta[4]}),
    .DOB({dpb_inst_9_doutb_w[14:0],dpb_inst_9_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_9.READ_MODE0 = 1'b0;
defparam dpb_inst_9.READ_MODE1 = 1'b0;
defparam dpb_inst_9.WRITE_MODE0 = 2'b00;
defparam dpb_inst_9.WRITE_MODE1 = 2'b00;
defparam dpb_inst_9.BIT_WIDTH_0 = 1;
defparam dpb_inst_9.BIT_WIDTH_1 = 1;
defparam dpb_inst_9.BLK_SEL_0 = 3'b001;
defparam dpb_inst_9.BLK_SEL_1 = 3'b001;
defparam dpb_inst_9.RESET_MODE = "ASYNC";

DPB dpb_inst_10 (
    .DOA({dpb_inst_10_douta_w[14:0],dpb_inst_10_douta[5]}),
    .DOB({dpb_inst_10_doutb_w[14:0],dpb_inst_10_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_10.READ_MODE0 = 1'b0;
defparam dpb_inst_10.READ_MODE1 = 1'b0;
defparam dpb_inst_10.WRITE_MODE0 = 2'b00;
defparam dpb_inst_10.WRITE_MODE1 = 2'b00;
defparam dpb_inst_10.BIT_WIDTH_0 = 1;
defparam dpb_inst_10.BIT_WIDTH_1 = 1;
defparam dpb_inst_10.BLK_SEL_0 = 3'b000;
defparam dpb_inst_10.BLK_SEL_1 = 3'b000;
defparam dpb_inst_10.RESET_MODE = "ASYNC";

DPB dpb_inst_11 (
    .DOA({dpb_inst_11_douta_w[14:0],dpb_inst_11_douta[5]}),
    .DOB({dpb_inst_11_doutb_w[14:0],dpb_inst_11_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_11.READ_MODE0 = 1'b0;
defparam dpb_inst_11.READ_MODE1 = 1'b0;
defparam dpb_inst_11.WRITE_MODE0 = 2'b00;
defparam dpb_inst_11.WRITE_MODE1 = 2'b00;
defparam dpb_inst_11.BIT_WIDTH_0 = 1;
defparam dpb_inst_11.BIT_WIDTH_1 = 1;
defparam dpb_inst_11.BLK_SEL_0 = 3'b001;
defparam dpb_inst_11.BLK_SEL_1 = 3'b001;
defparam dpb_inst_11.RESET_MODE = "ASYNC";

DPB dpb_inst_12 (
    .DOA({dpb_inst_12_douta_w[14:0],dpb_inst_12_douta[6]}),
    .DOB({dpb_inst_12_doutb_w[14:0],dpb_inst_12_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_12.READ_MODE0 = 1'b0;
defparam dpb_inst_12.READ_MODE1 = 1'b0;
defparam dpb_inst_12.WRITE_MODE0 = 2'b00;
defparam dpb_inst_12.WRITE_MODE1 = 2'b00;
defparam dpb_inst_12.BIT_WIDTH_0 = 1;
defparam dpb_inst_12.BIT_WIDTH_1 = 1;
defparam dpb_inst_12.BLK_SEL_0 = 3'b000;
defparam dpb_inst_12.BLK_SEL_1 = 3'b000;
defparam dpb_inst_12.RESET_MODE = "ASYNC";

DPB dpb_inst_13 (
    .DOA({dpb_inst_13_douta_w[14:0],dpb_inst_13_douta[6]}),
    .DOB({dpb_inst_13_doutb_w[14:0],dpb_inst_13_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_13.READ_MODE0 = 1'b0;
defparam dpb_inst_13.READ_MODE1 = 1'b0;
defparam dpb_inst_13.WRITE_MODE0 = 2'b00;
defparam dpb_inst_13.WRITE_MODE1 = 2'b00;
defparam dpb_inst_13.BIT_WIDTH_0 = 1;
defparam dpb_inst_13.BIT_WIDTH_1 = 1;
defparam dpb_inst_13.BLK_SEL_0 = 3'b001;
defparam dpb_inst_13.BLK_SEL_1 = 3'b001;
defparam dpb_inst_13.RESET_MODE = "ASYNC";

DPB dpb_inst_14 (
    .DOA({dpb_inst_14_douta_w[14:0],dpb_inst_14_douta[7]}),
    .DOB({dpb_inst_14_doutb_w[14:0],dpb_inst_14_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_14.READ_MODE0 = 1'b0;
defparam dpb_inst_14.READ_MODE1 = 1'b0;
defparam dpb_inst_14.WRITE_MODE0 = 2'b00;
defparam dpb_inst_14.WRITE_MODE1 = 2'b00;
defparam dpb_inst_14.BIT_WIDTH_0 = 1;
defparam dpb_inst_14.BIT_WIDTH_1 = 1;
defparam dpb_inst_14.BLK_SEL_0 = 3'b000;
defparam dpb_inst_14.BLK_SEL_1 = 3'b000;
defparam dpb_inst_14.RESET_MODE = "ASYNC";

DPB dpb_inst_15 (
    .DOA({dpb_inst_15_douta_w[14:0],dpb_inst_15_douta[7]}),
    .DOB({dpb_inst_15_doutb_w[14:0],dpb_inst_15_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_15.READ_MODE0 = 1'b0;
defparam dpb_inst_15.READ_MODE1 = 1'b0;
defparam dpb_inst_15.WRITE_MODE0 = 2'b00;
defparam dpb_inst_15.WRITE_MODE1 = 2'b00;
defparam dpb_inst_15.BIT_WIDTH_0 = 1;
defparam dpb_inst_15.BIT_WIDTH_1 = 1;
defparam dpb_inst_15.BLK_SEL_0 = 3'b001;
defparam dpb_inst_15.BLK_SEL_1 = 3'b001;
defparam dpb_inst_15.RESET_MODE = "ASYNC";

DPB dpb_inst_16 (
    .DOA({dpb_inst_16_douta_w[11:0],dpb_inst_16_douta[3:0]}),
    .DOB({dpb_inst_16_doutb_w[11:0],dpb_inst_16_doutb[3:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:0]})
);

defparam dpb_inst_16.READ_MODE0 = 1'b0;
defparam dpb_inst_16.READ_MODE1 = 1'b0;
defparam dpb_inst_16.WRITE_MODE0 = 2'b00;
defparam dpb_inst_16.WRITE_MODE1 = 2'b00;
defparam dpb_inst_16.BIT_WIDTH_0 = 4;
defparam dpb_inst_16.BIT_WIDTH_1 = 4;
defparam dpb_inst_16.BLK_SEL_0 = 3'b001;
defparam dpb_inst_16.BLK_SEL_1 = 3'b001;
defparam dpb_inst_16.RESET_MODE = "ASYNC";

DPB dpb_inst_17 (
    .DOA({dpb_inst_17_douta_w[11:0],dpb_inst_17_douta[7:4]}),
    .DOB({dpb_inst_17_doutb_w[11:0],dpb_inst_17_doutb[7:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:4]})
);

defparam dpb_inst_17.READ_MODE0 = 1'b0;
defparam dpb_inst_17.READ_MODE1 = 1'b0;
defparam dpb_inst_17.WRITE_MODE0 = 2'b00;
defparam dpb_inst_17.WRITE_MODE1 = 2'b00;
defparam dpb_inst_17.BIT_WIDTH_0 = 4;
defparam dpb_inst_17.BIT_WIDTH_1 = 4;
defparam dpb_inst_17.BLK_SEL_0 = 3'b001;
defparam dpb_inst_17.BLK_SEL_1 = 3'b001;
defparam dpb_inst_17.RESET_MODE = "ASYNC";

DPB dpb_inst_18 (
    .DOA({dpb_inst_18_douta_w[7:0],dpb_inst_18_douta[7:0]}),
    .DOB({dpb_inst_18_doutb_w[7:0],dpb_inst_18_doutb[7:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_3}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:0]})
);

defparam dpb_inst_18.READ_MODE0 = 1'b0;
defparam dpb_inst_18.READ_MODE1 = 1'b0;
defparam dpb_inst_18.WRITE_MODE0 = 2'b00;
defparam dpb_inst_18.WRITE_MODE1 = 2'b00;
defparam dpb_inst_18.BIT_WIDTH_0 = 8;
defparam dpb_inst_18.BIT_WIDTH_1 = 8;
defparam dpb_inst_18.BLK_SEL_0 = 3'b001;
defparam dpb_inst_18.BLK_SEL_1 = 3'b001;
defparam dpb_inst_18.RESET_MODE = "ASYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[15]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ada[14]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ada[12]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(adb[15]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_4 (
  .Q(dff_q_4),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_6 (
  .Q(dff_q_6),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb_w)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(dpb_inst_16_douta[0]),
  .I1(dpb_inst_18_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(dpb_inst_0_douta[0]),
  .I1(dpb_inst_1_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_12 (
  .O(douta[0]),
  .I0(mux_o_10),
  .I1(mux_o_6),
  .S0(dff_q_0)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(dpb_inst_16_douta[1]),
  .I1(dpb_inst_18_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(dpb_inst_2_douta[1]),
  .I1(dpb_inst_3_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_25 (
  .O(douta[1]),
  .I0(mux_o_23),
  .I1(mux_o_19),
  .S0(dff_q_0)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(dpb_inst_16_douta[2]),
  .I1(dpb_inst_18_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(dpb_inst_4_douta[2]),
  .I1(dpb_inst_5_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_38 (
  .O(douta[2]),
  .I0(mux_o_36),
  .I1(mux_o_32),
  .S0(dff_q_0)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(dpb_inst_16_douta[3]),
  .I1(dpb_inst_18_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(dpb_inst_6_douta[3]),
  .I1(dpb_inst_7_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_51 (
  .O(douta[3]),
  .I0(mux_o_49),
  .I1(mux_o_45),
  .S0(dff_q_0)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(dpb_inst_17_douta[4]),
  .I1(dpb_inst_18_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_62 (
  .O(mux_o_62),
  .I0(dpb_inst_8_douta[4]),
  .I1(dpb_inst_9_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_64 (
  .O(douta[4]),
  .I0(mux_o_62),
  .I1(mux_o_58),
  .S0(dff_q_0)
);
MUX2 mux_inst_71 (
  .O(mux_o_71),
  .I0(dpb_inst_17_douta[5]),
  .I1(dpb_inst_18_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(dpb_inst_10_douta[5]),
  .I1(dpb_inst_11_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_77 (
  .O(douta[5]),
  .I0(mux_o_75),
  .I1(mux_o_71),
  .S0(dff_q_0)
);
MUX2 mux_inst_84 (
  .O(mux_o_84),
  .I0(dpb_inst_17_douta[6]),
  .I1(dpb_inst_18_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_88 (
  .O(mux_o_88),
  .I0(dpb_inst_12_douta[6]),
  .I1(dpb_inst_13_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_90 (
  .O(douta[6]),
  .I0(mux_o_88),
  .I1(mux_o_84),
  .S0(dff_q_0)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(dpb_inst_17_douta[7]),
  .I1(dpb_inst_18_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_101 (
  .O(mux_o_101),
  .I0(dpb_inst_14_douta[7]),
  .I1(dpb_inst_15_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_103 (
  .O(douta[7]),
  .I0(mux_o_101),
  .I1(mux_o_97),
  .S0(dff_q_0)
);
MUX2 mux_inst_110 (
  .O(mux_o_110),
  .I0(dpb_inst_16_doutb[0]),
  .I1(dpb_inst_18_doutb[0]),
  .S0(dff_q_6)
);
MUX2 mux_inst_114 (
  .O(mux_o_114),
  .I0(dpb_inst_0_doutb[0]),
  .I1(dpb_inst_1_doutb[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_116 (
  .O(doutb[0]),
  .I0(mux_o_114),
  .I1(mux_o_110),
  .S0(dff_q_3)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(dpb_inst_16_doutb[1]),
  .I1(dpb_inst_18_doutb[1]),
  .S0(dff_q_6)
);
MUX2 mux_inst_127 (
  .O(mux_o_127),
  .I0(dpb_inst_2_doutb[1]),
  .I1(dpb_inst_3_doutb[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_129 (
  .O(doutb[1]),
  .I0(mux_o_127),
  .I1(mux_o_123),
  .S0(dff_q_3)
);
MUX2 mux_inst_136 (
  .O(mux_o_136),
  .I0(dpb_inst_16_doutb[2]),
  .I1(dpb_inst_18_doutb[2]),
  .S0(dff_q_6)
);
MUX2 mux_inst_140 (
  .O(mux_o_140),
  .I0(dpb_inst_4_doutb[2]),
  .I1(dpb_inst_5_doutb[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_142 (
  .O(doutb[2]),
  .I0(mux_o_140),
  .I1(mux_o_136),
  .S0(dff_q_3)
);
MUX2 mux_inst_149 (
  .O(mux_o_149),
  .I0(dpb_inst_16_doutb[3]),
  .I1(dpb_inst_18_doutb[3]),
  .S0(dff_q_6)
);
MUX2 mux_inst_153 (
  .O(mux_o_153),
  .I0(dpb_inst_6_doutb[3]),
  .I1(dpb_inst_7_doutb[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_155 (
  .O(doutb[3]),
  .I0(mux_o_153),
  .I1(mux_o_149),
  .S0(dff_q_3)
);
MUX2 mux_inst_162 (
  .O(mux_o_162),
  .I0(dpb_inst_17_doutb[4]),
  .I1(dpb_inst_18_doutb[4]),
  .S0(dff_q_6)
);
MUX2 mux_inst_166 (
  .O(mux_o_166),
  .I0(dpb_inst_8_doutb[4]),
  .I1(dpb_inst_9_doutb[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_168 (
  .O(doutb[4]),
  .I0(mux_o_166),
  .I1(mux_o_162),
  .S0(dff_q_3)
);
MUX2 mux_inst_175 (
  .O(mux_o_175),
  .I0(dpb_inst_17_doutb[5]),
  .I1(dpb_inst_18_doutb[5]),
  .S0(dff_q_6)
);
MUX2 mux_inst_179 (
  .O(mux_o_179),
  .I0(dpb_inst_10_doutb[5]),
  .I1(dpb_inst_11_doutb[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_181 (
  .O(doutb[5]),
  .I0(mux_o_179),
  .I1(mux_o_175),
  .S0(dff_q_3)
);
MUX2 mux_inst_188 (
  .O(mux_o_188),
  .I0(dpb_inst_17_doutb[6]),
  .I1(dpb_inst_18_doutb[6]),
  .S0(dff_q_6)
);
MUX2 mux_inst_192 (
  .O(mux_o_192),
  .I0(dpb_inst_12_doutb[6]),
  .I1(dpb_inst_13_doutb[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_194 (
  .O(doutb[6]),
  .I0(mux_o_192),
  .I1(mux_o_188),
  .S0(dff_q_3)
);
MUX2 mux_inst_201 (
  .O(mux_o_201),
  .I0(dpb_inst_17_doutb[7]),
  .I1(dpb_inst_18_doutb[7]),
  .S0(dff_q_6)
);
MUX2 mux_inst_205 (
  .O(mux_o_205),
  .I0(dpb_inst_14_doutb[7]),
  .I1(dpb_inst_15_doutb[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_207 (
  .O(doutb[7]),
  .I0(mux_o_205),
  .I1(mux_o_201),
  .S0(dff_q_3)
);
endmodule //Gowin_DPB
