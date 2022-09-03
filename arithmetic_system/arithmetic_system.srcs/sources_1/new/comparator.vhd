----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2022 03:13:39 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC;
           less : out STD_LOGIC;
           equal : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
begin
compare: 
    process (a,b)
    begin
        if (a > b)
            then
                greater <= '1';
                less <= '0';
                equal <= '0';
            elsif (a < b)
                then 
                    greater <= '0';
                    less <= '1';
                    equal <= '0';
            else
                greater <= '0';
                less <= '0';
                equal <= '1';
        end if;    
    end process;
end Behavioral;
