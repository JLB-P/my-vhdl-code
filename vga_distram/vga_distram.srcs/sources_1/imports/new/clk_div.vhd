----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2022 09:28:45 AM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_div is
        Port ( 	mclk : in  STD_LOGIC;
				clr : in  STD_LOGIC;
				clk25 : out std_logic);
end clk_div;

architecture Behavioral of clk_div is
    signal q: std_logic_vector(1 downto 0);

begin
	process (mclk, clr)
	begin
		if (clr = '1') then
			q <= "00";
		elsif (rising_edge(mclk)) then
			q <= q+1;
		end if;
	end process;
	clk25 <= q(1);		--25 Mhz
end Behavioral;