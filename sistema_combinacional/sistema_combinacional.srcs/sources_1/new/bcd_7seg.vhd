----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2021 02:24:49 PM
-- Design Name: 
-- Module Name: bcd_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_7seg is
  Port (BCD_in : in std_logic_vector (3 downto 0);
        segment : out std_logic_vector (6 downto 0));
end bcd_7seg;

architecture Behavioral of bcd_7seg is

begin
 bcd_7seg: process(BCD_in)
 --los segmentos encienden con 0 lógico
 --en el orden abcdefg
    begin
        case BCD_in is
            when "0000" =>
            segment <= "0000001"; --0
            when "0001" =>
            segment <= "1001111"; --1
            when "0010" =>
            segment <= "0010010"; --2
            when "0011" =>
            segment <= "0000110"; --3
            when "0100" =>
            segment <= "1001100"; --4
            when "0101" =>
            segment <= "0100100"; --5
            when "0110" =>
            segment <= "0100000"; --6
            when "0111" =>
            segment <= "0001111"; --7
            when "1000" =>
            segment <= "0000000"; --8
            when "1001" =>
            segment <= "0000100"; --9
            when others =>
            segment <= "1111111"; --null
        end case;
    end process bcd_7seg;
end Behavioral;
