-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Wed Aug 31 01:57:08 2022
-- Host        : jlb running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/repo/my-vhdl-code/arithmetic_system/arithmetic_system.sim/sim_1/synth/func/xsim/comparator_tb_func_synth.vhd
-- Design      : binToLetter
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity binToLetter is
  port (
    bin_data : in STD_LOGIC_VECTOR ( 2 downto 0 );
    seg_7letter : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of binToLetter : entity is true;
end binToLetter;

architecture STRUCTURE of binToLetter is
  signal bin_data_IBUF : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal seg_7letter_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \seg_7letter_OBUF[2]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \seg_7letter_OBUF[5]_inst_i_1\ : label is "soft_lutpair0";
begin
\bin_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => bin_data(0),
      O => bin_data_IBUF(0)
    );
\bin_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => bin_data(1),
      O => bin_data_IBUF(1)
    );
\bin_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => bin_data(2),
      O => bin_data_IBUF(2)
    );
\seg_7letter_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(0),
      O => seg_7letter(0)
    );
\seg_7letter_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => seg_7letter(1)
    );
\seg_7letter_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(2),
      O => seg_7letter(2)
    );
\seg_7letter_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => bin_data_IBUF(2),
      I1 => bin_data_IBUF(0),
      I2 => bin_data_IBUF(1),
      O => seg_7letter_OBUF(2)
    );
\seg_7letter_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(3),
      O => seg_7letter(3)
    );
\seg_7letter_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(3),
      O => seg_7letter(4)
    );
\seg_7letter_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(3),
      O => seg_7letter(5)
    );
\seg_7letter_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => bin_data_IBUF(2),
      I1 => bin_data_IBUF(1),
      I2 => bin_data_IBUF(0),
      O => seg_7letter_OBUF(3)
    );
\seg_7letter_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => seg_7letter_OBUF(0),
      O => seg_7letter(6)
    );
\seg_7letter_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => bin_data_IBUF(2),
      I1 => bin_data_IBUF(0),
      O => seg_7letter_OBUF(0)
    );
end STRUCTURE;
