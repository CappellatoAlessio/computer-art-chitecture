// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Jun 14 09:27:10 2018
// Host        : DESKTOP-JVB0SPP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Giuliano/Desktop/BRAMtoVGA/BRAMtoVGA.srcs/sources_1/bd/BRAMRW/ip/BRAMRW_blk_mem_gen_0_0/BRAMRW_blk_mem_gen_0_0_stub.v
// Design      : BRAMRW_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module BRAMRW_blk_mem_gen_0_0(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[18:0],dina[11:0],douta[11:0],clkb,web[0:0],addrb[18:0],dinb[11:0],doutb[11:0]" */;
  input clka;
  input [0:0]wea;
  input [18:0]addra;
  input [11:0]dina;
  output [11:0]douta;
  input clkb;
  input [0:0]web;
  input [18:0]addrb;
  input [11:0]dinb;
  output [11:0]doutb;
endmodule
