----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/31/2022 01:17:18 AM
-- Design Name: 
-- Module Name: comparator_tb - Behavioral
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

--Entity name.
entity comparator_tb is
end comparator_tb;

architecture Behavioral of comparator_tb is
--Entity signals to show on simulation.
signal a,b: std_logic_vector(3 downto 0); --inputs
signal greater,less,equal: std_logic;   --outputs
begin
--instance (module)
uut:
entity work.comparator port map(a,b, greater, less, equal);

--process definition for simulation.
stimulus:
process
begin
    a <= "0000";
    b <= "0101";
    wait for 10 ns;
    a <= "1111";
    b <= "0001";
    wait for 10 ns;
    a <= "0001";
    b <= "0001";
    wait for 10 ns;
end process;
end Behavioral;
