----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2021 01:39:34 PM
-- Design Name: 
-- Module Name: top_sistema_combinacional - Behavioral
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

entity top_sistema_combinacional is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           SEGMENTS: out STD_LOGIC_VECTOR (6 downto 0));
end top_sistema_combinacional;

architecture Behavioral of top_sistema_combinacional is

begin
    inst_comparador: entity work.comparador_4b port map(
        x => X,
        y => Y);
    inst_codificador: entity work.bcd_7seg port map(
        BCD_in => x,
        segment => SEGMENTS);
end Behavioral;
