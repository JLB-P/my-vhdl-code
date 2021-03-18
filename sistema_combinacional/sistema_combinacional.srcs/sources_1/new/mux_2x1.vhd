----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2021 03:23:38 PM
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
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0); 
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           out_mux : out STD_LOGIC_VECTOR (3 downto 0));
end mux_2x1;

architecture Behavioral of mux_2x1 is

begin
    out_mux <= a when (sel = '0') else
               b when (sel = '1') else
               "0000";
end Behavioral;
