----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2022 07:18:03 PM
-- Design Name: 
-- Module Name: binToLetter - Behavioral
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

entity binToLetter is
    Port ( bin_data : in STD_LOGIC_VECTOR (2 downto 0);
           seg_7letter : out STD_LOGIC_VECTOR (6 downto 0));
end binToLetter;

architecture Behavioral of binToLetter is

begin

--segment is on when low level logic
with bin_data select
   seg_7letter <= "0100000" when "001",   --G
         "1110001" when "010",   --L
         "0110000" when "100",   --E
         "1111111" when others;   --off
end Behavioral;
