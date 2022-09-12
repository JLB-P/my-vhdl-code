----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2022 03:14:53 PM
-- Design Name: 
-- Module Name: fsm_moore - Behavioral
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

entity fsm_moore is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC);
end fsm_moore;

architecture Behavioral of fsm_moore is
type state_type is (s0,s1,s2,s3,s4);
signal present_state,next_state: state_type;

begin
state_register: process (clk,reset) begin
    if (reset='1') then
        present_state<=s0;
    elsif (rising_edge(clk)) then
        present_state<=next_state;
    end if;
end process state_register;
C1: process (present_state,input) begin
    case present_state is
        when s0=>
            if(input='1') then
                next_state<=s1;
            else
                next_state<=s0;
            end if;
        when s1 =>
            if(input='1') then
                next_state<=s2;
            else
                next_state<=s0;
            end if;
        when s2 =>
            if(input='0') then
                next_state<=s3;
            else
                next_state<=s2;
            end if;
        when s3 =>
            if(input='1') then
                next_state<=s4;
            else
                next_state<=s0;
            end if;
        when s4 =>
            if(input='0') then
                next_state<=s0;
            else
                next_state<=s2;
            end if;
        when others =>
            null;
    end case;
end process C1;
C2: process (present_state) begin
    if(present_state = s4) then
        output <= '1';
    else
        output<='0';
    end if;
end process C2;
end Behavioral;