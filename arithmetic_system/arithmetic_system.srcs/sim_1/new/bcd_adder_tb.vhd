----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2022 11:53:52 PM
-- Design Name: 
-- Module Name: bcd_adder_tb - Behavioral
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

entity bcd_adder_tb is
end bcd_adder_tb;

architecture Behavioral of bcd_adder_tb is
    signal a,b : STD_LOGIC_VECTOR (3 downto 0); --inputs
    signal s : STD_LOGIC_VECTOR (4 downto 0); --outputs
begin
uut:
entity work.bcd_adder port map(a,b,s);
stimulus:
process
begin
    a <= "0101";
    b <= "0101";
    wait for 10 ns;
    a <= "1001";
    b <= "1000";
    wait for 10 ns;
    a <= "0011";
    b <= "0101";
    wait for 10 ns;
end process;
end Behavioral;
