----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2022 03:27:46 PM
-- Design Name: 
-- Module Name: top_mealy_moore_fsm - Behavioral
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

entity top_mealy_moore_fsm is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           INPUT : in STD_LOGIC;
           O_mealy : out STD_LOGIC;
           O_moore : out STD_LOGIC);
end top_mealy_moore_fsm;

architecture Behavioral of top_mealy_moore_fsm is

begin
    U1: entity work.fsm_moore port map(
        clk=>CLK,
        reset=>RESET,
        input=>INPUT,
        output=>O_moore
    );
    
    U2: entity work.fsm_mealy port map(
        clk=>CLK,
        reset=>RESET,
        input=>INPUT,
        output=>O_mealy
    );
end Behavioral;