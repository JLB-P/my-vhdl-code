----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2022 12:14:10 AM
-- Design Name: 
-- Module Name: mux_2x1 - Behavioral
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

entity mux_2x1 is
    Port ( letter : in STD_LOGIC_VECTOR (6 downto 0);
           sum : in STD_LOGIC_VECTOR (6 downto 0);
           sel : in STD_LOGIC;
           seg_7 : out STD_LOGIC_VECTOR (6 downto 0));
end mux_2x1;

architecture Behavioral of mux_2x1 is
    
begin
    seg_7 <= letter when (sel = '0') else sum;
end Behavioral;
