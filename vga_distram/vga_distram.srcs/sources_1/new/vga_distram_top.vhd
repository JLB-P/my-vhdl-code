----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 09:41:16 PM
-- Design Name: 
-- Module Name: vga_distram_top - Behavioral
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

entity vga_distram_top is
  Port (
        mclk : in std_logic;
        btn : in std_logic;
        sw : in std_logic_vector(7 downto 0);
        hsync : out std_logic;
        vsync : out std_logic;
        red : out std_logic_vector(3 downto 0);
        green : out std_logic_vector(3 downto 0);
        blue : out std_logic_vector(3 downto 0)
   );
end vga_distram_top;

architecture Behavioral of vga_distram_top is
signal clr, clk25, vidon: std_logic;
signal hc, vc: std_logic_vector(9 downto 0);
signal M: std_logic_vector(7 downto 0);
signal rom_addr16: std_logic_vector(15 downto 0);
begin
    clr <= btn;
    
U1 : entity work.clk_div
    port map(mclk => mclk, clr =>clr, clk25 => clk25);    
U2 : entity work.vga_640x480
    port map(clk => clk25, clr => clr, hsync => hsync,
    vsync => vsync, hc => hc, vc => vc, vidon => vidon);
U3 : entity work.vga_bsprite
    port map(vidon => vidon, hc => hc, vc => vc,
    M => M,sw => sw, rom_addr16 => rom_addr16,
    red => red(2 downto 0),
    green => green(2 downto 0),
    blue => blue(1 downto 0));
U4 : entity work.rom_640x480_wrapper
    port map(addr => rom_addr16, mclk => clk25, M => M);     
end Behavioral;
