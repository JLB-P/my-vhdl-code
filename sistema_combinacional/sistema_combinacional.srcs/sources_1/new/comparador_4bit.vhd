----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2021 01:32:04 PM
-- Design Name: 
-- Module Name: comparador_4bit - Behavioral
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

entity comparador_4b is
    Port ( x,y : in STD_LOGIC_VECTOR (3 downto 0);
           x_may_y, igual, x_men_y : out STD_LOGIC);
end comparador_4b;

architecture Behavioral of comparador_4b is

begin
    compara: process (x,y)
    begin
        if (x = y) then
            igual <= '1';
            x_may_y <= '0';
            x_men_y <= '0';
            elsif (x > y) then
                igual <= '0';
                x_may_y <= '1';
                x_men_y <= '0';
                else 
                    igual <= '0';
                    x_may_y <= '0';
                    x_men_y <= '1';
        end if;
    end process compara;
end Behavioral;
