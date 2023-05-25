--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Wed May 24 19:43:19 2023
--Host        : jlbpacheco running 64-bit major release  (build 9200)
--Command     : generate_target rom_640x480_wrapper.bd
--Design      : rom_640x480_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rom_640x480_wrapper is
  port (
    M : out STD_LOGIC_VECTOR ( 7 downto 0 );
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mclk : in STD_LOGIC
  );
end rom_640x480_wrapper;

architecture STRUCTURE of rom_640x480_wrapper is
  component rom_640x480 is
  port (
    addr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mclk : in STD_LOGIC;
    M : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component rom_640x480;
begin
rom_640x480_i: component rom_640x480
     port map (
      M(7 downto 0) => M(7 downto 0),
      addr(15 downto 0) => addr(15 downto 0),
      mclk => mclk
    );
end STRUCTURE;
