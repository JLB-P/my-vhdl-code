----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2021 01:34:47 PM
-- Design Name: 
-- Module Name: comparador_4b_tb - Behavioral
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

--Nombre de la entidad a simular, no es necesario especificar los puertos.
entity comparador_4b_tb is
end comparador_4b_tb;

architecture Behavioral of comparador_4b_tb is
--Señales de la entidad, que se quieren mostrar en la simulación.
signal x,y : STD_LOGIC_VECTOR (3 downto 0);
signal x_may_y, igual, x_men_y : STD_LOGIC;

begin
--instancia(módulo)
uut: entity work.comparador_4b port map(x,y,x_may_y,igual,x_men_y);

--definición del proceso de simulación.
stimulus: process
    begin
        x <= "0000";
        y <= "0101";
        wait for 10 ns;
        x <= "1111";
        y <= "0001";
        wait for 10 ns;
        x <= "0001";
        y <= "1111";
        wait for 10 ns;
    end process stimulus;
end Behavioral;
