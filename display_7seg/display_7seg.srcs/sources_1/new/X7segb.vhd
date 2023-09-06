----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2022 10:35:53 AM
-- Design Name: 
-- Module Name: X7segb - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity X7segb is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
         cclk,clr : in STD_LOGIC;
         a_to_g : out STD_LOGIC_VECTOR (6 downto 0);
         an : out STD_LOGIC_VECTOR (3 downto 0));
end X7segb;
architecture Behavioral of X7segb is
    --señales intermedias para conexión interna
    signal digit : std_logic_vector (3 downto 0);
    signal count : std_logic_vector (1 downto 0);
    signal aen : std_logic_vector (3 downto 0);
    --señales para el divisor de frecuencia
    signal count_1 : std_logic_vector(17 downto 0);
    signal clk190 : std_logic;
    -----------------------------
begin
    --Divisor de frecuencia
    count_1 <= count_1+1 when rising_edge(cclk);
    clk190 <= count_1(17);
    --control de display en blanco
    aen(3) <= (x(15) or x(14) or x(13) or x(12)); --Activa 3er dígito
    --si hay datos a la entrada
    aen(2) <= (x(15) or x(14) or x(13) or x(12) or --Activa 3er dígito
                x(11) or x(10) or x(9) or x(8));--si hay datos a la entrada
    --o si hay datos para dígito 4
    aen(1) <= (x(15) or x(14) or x(13) or x(12) or --Activa 2o dígito
               x(11) or x(10) or x(9) or x(8)) or --si hay datos a la entrada
              x(7) or x(6) or x(5) or x(4); --o si hay datos para dígito 3 ó 4
    aen(0) <= '1'; --Primer dígito (de derecha a izquierda) siempre encendido
    --contador de 2 bits
    cont_2bit: process (clk190,clr)
    begin
        if (clr = '1') then
            count <= "00";
        elsif (rising_edge(clk190)) then
            count <= count + 1;
        end if;
    end process cont_2bit;
    --Multiplexor de 4x1
    --Selecciona (con la señal count) 1 de 4 entradas (de 4 bits cada una) 
    with count select
 digit <= x(3 downto 0) when "00",
        x(7 downto 4) when "01",
        x(11 downto 8) when "10",
        x(15 downto 12) when others;
    --seg7dec
    --Convierte un número binario de 4 bits a 7 segmentos
    with digit select
 a_to_g <= "1001111" when "0001", --1
        "0010010" when "0010", --2
        "0000110" when "0011", --3
        "1001100" when "0100", --4
        "0100100" when "0101", --5
        "0100000" when "0110", --6
        "0001111" when "0111", --7
        "0000000" when "1000", --8
        "0000100" when "1001", --9
        "0001000" when "1010", --A
        "1100000" when "1011", --B
        "0110001" when "1100", --C
        "1000010" when "1101", --D
        "0110000" when "1110", --E
        "0111000" when "1111", --F
        "0000001" when others; --0
    --selección del dígito
    ancode: process (count)
    begin
        if (aen(conv_integer(count)) = '1') then --convierte el valor de count(1:0) a entero
            an <= (others => '1'); --asigna '1s' a toda la señal an(3:0) = "1111"
            an(conv_integer(count)) <= '0';
        else
            an <= "1111";
        end if;
    end process ancode;
end Behavioral;
