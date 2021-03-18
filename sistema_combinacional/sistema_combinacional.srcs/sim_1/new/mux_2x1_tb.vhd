----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2021 03:50:30 PM
-- Design Name: 
-- Module Name: mux_2x1_tb - Behavioral
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

entity mux_2x1_tb is
end mux_2x1_tb;

architecture Behavioral of mux_2x1_tb is
--Componente declaration for the Unit Under Test (UUT)
component mux_2x1 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0); 
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           out_mux : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--inputs
signal a,b : std_logic_vector(3 downto 0):= "0000"; 
signal sel : std_logic := '0';
--outputs
signal out_mux : STD_LOGIC_vector(3 downto 0);

begin
-- Instantiate the Unit Under Test (UUT)
uut: mux_2x1 port map(
a => a,
b => b,
sel => sel,
out_mux => out_mux);

--stimulus
stimulus: process
begin
    wait for 10 ns;
    a <= "1111";
    wait for 10 ns;
    sel <= '1';
    wait for 10 ns;
    b <= "1010";
end process stimulus;
end Behavioral;
