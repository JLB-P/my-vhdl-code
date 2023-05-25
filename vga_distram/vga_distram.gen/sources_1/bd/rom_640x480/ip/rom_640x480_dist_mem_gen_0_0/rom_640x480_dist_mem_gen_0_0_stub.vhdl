-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Wed May 24 19:48:44 2023
-- Host        : jlbpacheco running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/repo/my-vhdl-code/vga_distram/vga_distram.gen/sources_1/bd/rom_640x480/ip/rom_640x480_dist_mem_gen_0_0/rom_640x480_dist_mem_gen_0_0_stub.vhdl
-- Design      : rom_640x480_dist_mem_gen_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_640x480_dist_mem_gen_0_0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end rom_640x480_dist_mem_gen_0_0;

architecture stub of rom_640x480_dist_mem_gen_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[15:0],clk,qspo[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_13,Vivado 2021.2";
begin
end;
