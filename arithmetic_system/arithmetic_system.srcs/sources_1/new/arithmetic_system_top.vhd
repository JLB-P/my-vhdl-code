----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/05/2022 02:00:18 PM
-- Design Name: 
-- Module Name: arithmetic_system_top - Behavioral
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

entity arithmetic_system_top is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEG_7 : out STD_LOGIC_VECTOR (6 downto 0));
end arithmetic_system_top;

architecture Behavioral of arithmetic_system_top is
signal yellow_wire : std_logic_vector(2 downto 0);
begin

U1: entity work.comparator port map (
                a => A, 
                b => B, 
                greater => yellow_wire(2),
                less => yellow_wire(1),
                equal => yellow_wire(0)
                );    
U2: entity work.binToLetter port map (
                bin_data => yellow_wire,
                seg_7letter => SEG_7
);

end Behavioral;
