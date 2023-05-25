// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed May 24 19:48:44 2023
// Host        : jlbpacheco running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/repo/my-vhdl-code/vga_distram/vga_distram.gen/sources_1/bd/rom_640x480/ip/rom_640x480_dist_mem_gen_0_0/rom_640x480_dist_mem_gen_0_0_stub.v
// Design      : rom_640x480_dist_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.2" *)
module rom_640x480_dist_mem_gen_0_0(a, clk, qspo)
/* synthesis syn_black_box black_box_pad_pin="a[15:0],clk,qspo[7:0]" */;
  input [15:0]a;
  input clk;
  output [7:0]qspo;
endmodule
