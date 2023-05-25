----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2022 09:58:22 AM
-- Design Name: 
-- Module Name: vga_640x480 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_640x480 is
    Port ( clk, clr : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           hc : out STD_LOGIC_VECTOR(9 downto 0);
           vc : out STD_LOGIC_VECTOR(9 downto 0);
           vidon : out STD_LOGIC);
end vga_640x480;

architecture Behavioral of vga_640x480 is
    --horizontal timig--
    constant hbp: std_logic_vector(9 downto 0) := "0010010000"; --HBP = SP+BP = 96+48 = 144
    constant hfp: std_logic_vector(9 downto 0) := "1100010000"; --HFP = HBP+HV = 144+640 = 784
    constant hpixels: std_logic_vector(9 downto 0) := "1100100000"; --quantity of pixels on horizontal line = SP+BP+HV+FP = 96+48+640+16 = 800
    
    --vertical timig--
    constant vbp: std_logic_vector(9 downto 0) := "0000100011"; --VBP = SP+BP = 2+33 = 35
    constant vfp: std_logic_vector(9 downto 0) := "1000000011"; --VFP = VBP+VV = 35+480 = 515
    constant vlines: std_logic_vector(9 downto 0) := "1000001101"; --quantity of vertical lines on display = SP+BP+VV+FP = 2+33+480+10= 521
    
    signal hcs, vcs: std_logic_vector(9 downto 0); --horizontal & vertical counters
    signal vsenable: std_logic; --vertical counter enable
begin
    --horizontal counter syncronization signal
    process (clk,clr)
    begin
        if (clr = '1') then
            hcs <= "0000000000";
        elsif (rising_edge(clk)) then
            if (hcs = hpixels - 1) then --counter has reached end of count ?
                hcs <= "0000000000";    --reset
                vsenable <= '1';    --set flag to go vertical counter
            else
                hcs <= hcs + 1; --increment horizontal counter
                vsenable <= '0';    --clear vertical counter flag
            end if;
        end if;
    end process;
    hsync <= '0' when (hcs < 96) else '1'; --SP=0 when hc<128 pixels 
    
     --vertical counter syncronization signal
    process (clk,clr,vsenable)
    begin
        if (clr = '1') then
            vcs <= "0000000000";
        elsif ((rising_edge(clk)) and (vsenable = '1')) then
            if (vcs = vlines - 1) then --counter has reached the end of count ?
                vcs <= "0000000000";    --reset
            else
                vcs <= vcs + 1; --increment vertical counter
            end if;
        end if;
    end process;
    vsync <= '0' when (vcs < 2) else '1'; --SP=0 when vc<2 lines
    vidon <= '1' when (((hcs < hfp) and (hcs >= hbp)) and ((vcs < vfp) and (vcs >= vbp))) else '0'; --set video on when visible area 
    
    --horizontal and vertical counters update 
    hc <= hcs;
    vc <= vcs; 

end Behavioral;
