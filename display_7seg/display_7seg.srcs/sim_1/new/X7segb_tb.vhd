----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2022 11:10:32 AM
-- Design Name: 
-- Module Name: X7segb_tb - Behavioral
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
entity X7segb_tb is
end X7segb_tb;

architecture Behavioral of X7segb_tb is
--Señales de la entidad, que se quieren mostrar en la simulación.
signal x: std_logic_vector(15 downto 0);	--entradas
signal cclk, clr: std_logic;
signal an : std_logic_vector (3 downto 0);	--salidas
signal a_to_g: std_logic_vector(6 downto 0);

begin
--instancia a simular(módulo)
uut: entity work.X7segb port map (x,cclk,clr,a_to_g,an);
--definición del proceso para la señal de reloj.
clock_process :process
				begin
					 cclk <= '0';
					 wait for 10 ns;
					 cclk <= '1';
					 wait for 10 ns;
				end process clock_process;
--definición del proceso de stimulos.
stim_proc: process
	begin        
  	 -- mantiene la señal clr por 20 ns.
		clr <= '1';
	   	x <= X"0000"; --inicia mostrando 0000 en los display
		wait for 20 ns;    
		-- desactiva clr
		-- comienza conteo ascendente por 300 ns.
		clr <= '0';
	  	wait for 300 ns;    
	  	-- muestra valores
	  	x <= X"0001";
	   	wait;
	end process stim_proc;

end Behavioral;
