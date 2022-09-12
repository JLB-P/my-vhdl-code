----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2022 03:39:22 PM
-- Design Name: 
-- Module Name: mealy_moore_fsm_tb - Behavioral
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

entity mealy_moore_fsm_tb is
--  Port ( );
end mealy_moore_fsm_tb;

architecture Behavioral of mealy_moore_fsm_tb is
component top_mealy_moore_fsm is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           INPUT : in STD_LOGIC;
           O_mealy : out STD_LOGIC;
           O_moore : out STD_LOGIC);
end component;
signal CLK: std_logic:='0';
signal RESET: std_logic:='1';
signal INPUT: std_logic:='1';
signal O_mealy,O_moore: std_logic;
begin
uut: top_mealy_moore_fsm port map(CLK,RESET,INPUT,O_mealy,O_moore);
stimulus: process begin --input 11101111100
        wait for 10ns;
        CLK<='1';
        RESET<='0';
        INPUT<='1';
        wait for 10ns;
        CLK<='0';
        INPUT<='1';
        wait for 10ns;
        CLK<='1';
        INPUT<='1';
        wait for 10ns;
        CLK<='0';
        INPUT<='0';
        wait for 10ns;
        CLK<='1';
        INPUT<='1';
        wait for 10ns;
        CLK<='0';
        INPUT<='1';
        wait for 10ns;
        CLK<='1';
        INPUT<='1';
        wait for 10ns;
        CLK<='0';
        INPUT<='1';
        wait for 10ns;
        CLK<='1';
        INPUT<='1';
        wait for 10ns;
        CLK<='0';
        INPUT<='0';
        wait for 10ns;
        CLK<='1';
        INPUT<='0';
    end process stimulus;
end Behavioral;
