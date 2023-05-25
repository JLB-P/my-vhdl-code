--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Wed May 24 19:43:19 2023
--Host        : jlbpacheco running 64-bit major release  (build 9200)
--Command     : generate_target rom_640x480.bd
--Design      : rom_640x480
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rom_640x480 is
  port (
    M : out STD_LOGIC_VECTOR ( 7 downto 0 );
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mclk : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of rom_640x480 : entity is "rom_640x480,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rom_640x480,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of rom_640x480 : entity is "rom_640x480.hwdef";
end rom_640x480;

architecture STRUCTURE of rom_640x480 is
  component rom_640x480_dist_mem_gen_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component rom_640x480_dist_mem_gen_0_0;
  signal a_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal dist_mem_gen_0_qspo : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  M(7 downto 0) <= dist_mem_gen_0_qspo(7 downto 0);
  a_0_1(15 downto 0) <= addr(15 downto 0);
  clk_0_1 <= mclk;
dist_mem_gen_0: component rom_640x480_dist_mem_gen_0_0
     port map (
      a(15 downto 0) => a_0_1(15 downto 0),
      clk => clk_0_1,
      qspo(7 downto 0) => dist_mem_gen_0_qspo(7 downto 0)
    );
end STRUCTURE;
