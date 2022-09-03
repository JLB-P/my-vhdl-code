----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/31/2022 01:54:14 PM
-- Design Name: 
-- Module Name: binToLetter_tb - Behavioral
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

entity binToLetter_tb is
end binToLetter_tb;

architecture Behavioral of binToLetter_tb is
signal bin_data : std_logic_vector(2 downto 0); --inputs
signal seg_7letter: std_logic_vector(6 downto 0);

begin
uut:
entity work.binToLetter port map (bin_data=>bin_data,seg_7letter=>seg_7letter);
stimulus:
process
begin
    bin_data <= "001";
    wait for 10ns;
    bin_data <= "010";
    wait for 10ns;
    bin_data <= "100";
    wait for 10ns;
    bin_data <= "111";
    wait for 10ns;
end process;


end Behavioral;
