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
           SEL : in STD_LOGIC;
           SEG_7 : out STD_LOGIC_VECTOR (6 downto 0));
end arithmetic_system_top;

architecture Behavioral of arithmetic_system_top is
signal yellow_wire : std_logic_vector(2 downto 0);
signal s_bcd :std_logic_vector(3 downto 0);
signal s_bcd_nc :std_logic;
signal letter_mux :std_logic_vector(6 downto 0);
signal sum_mux :std_logic_vector(6 downto 0);
begin
s_bcd_nc <= '0';

U1: entity work.comparator port map (
                a => A, 
                b => B, 
                greater => yellow_wire(0),
                less => yellow_wire(1),
                equal => yellow_wire(2)
                );    
U2: entity work.binToLetter port map (
                bin_data => yellow_wire,
                seg_7letter => letter_mux
);
U3: entity work.bcd_adder port map (
                a => A,
                b => B,
                s(0) =>s_bcd(0),
                s(1) =>s_bcd(1),
                s(2) =>s_bcd(2),
                s(3) =>s_bcd(3),
                s(4) =>s_bcd_nc
);
U4: entity work.bcd_7seg port map (
                bcd => s_bcd,
                a_to_g => sum_mux
                );
U5: entity work.mux_2x1 port map (
                letter => letter_mux,
                sum => sum_mux,
                sel => SEL,
                seg_7 => SEG_7
                
);                
end Behavioral;
