----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2022 02:14:38 PM
-- Design Name: 
-- Module Name: arithmetic_system_top_tb - Behavioral
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

--Entity name for all top
entity arithmetic_system_top_tb is
end arithmetic_system_top_tb;

architecture Behavioral of arithmetic_system_top_tb is
--System signals to show on simulation
signal A,B  : STD_LOGIC_VECTOR (3 downto 0);    --inputs
signal SEL  : STD_LOGIC;                        --input
signal SEG_7: STD_LOGIC_VECTOR (6 downto 0);    --outputs


begin
--system (module)
uut:
entity work.arithmetic_system_top port map(A=>A,B=>B,SEL=>SEL,SEG_7=>SEG_7);
--process definition for simulation.
stimulus:
process
begin
    --test comparator
    A <= "0000";
    B <= "0101";
    SEL <= '0';
    wait for 10 ns;
    a <= "1111";
    b <= "0001";
    wait for 10 ns;
    a <= "0001";
    b <= "0001";
    wait for 10 ns;
    --test adder
    A <= "0011";
    B <= "0101";
    SEL <= '1';
    wait for 10 ns;
    a <= "1001";
    b <= "0001";
    wait for 10 ns;
end process;
end Behavioral;
