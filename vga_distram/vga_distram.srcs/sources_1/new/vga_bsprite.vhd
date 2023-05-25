----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 09:06:49 PM
-- Design Name: 
-- Module Name: vga_bsprite - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_bsprite is
    Port (vidon : in std_logic;
        hc: in std_logic_vector(9 downto 0);
        vc: in std_logic_vector(9 downto 0);
        M: in std_logic_vector(7 downto 0);
        sw: in std_logic_vector(7 downto 0);
        rom_addr16: out std_logic_vector(15 downto 0);
        red: out std_logic_vector(2 downto 0);
        green: out std_logic_vector(2 downto 0);
        blue: out std_logic_vector(1 downto 0)
    );
end vga_bsprite;

architecture Behavioral of vga_bsprite is
constant hbp: std_logic_vector(9 downto 0):= "0010010000";
constant vbp: std_logic_vector(9 downto 0):= "0000100011";
constant w: integer := 240;
constant h: integer := 160;
signal xpix, ypix: std_logic_vector(9 downto 0);
signal rom_addr : std_logic_vector(16 downto 0);
signal C1, R1: std_logic_vector(9 downto 0);
signal spriteon, R, G, B: std_logic;
begin
    --select C1 and R1 using switches
    C1 <= '0' & sw(3 downto 0) & "00001";
    R1 <= '0' & sw(7 downto 4) & "00001";
    ypix <= vc - vbp - R1;
    xpix <= hc - hbp - C1;
    --Enable sprite video out when within the sprite region
    spriteon <= '1' when (((hc >= C1 + hbp) and (hc < C1 + hbp + w))
                and ((vc >= R1 + vbp) and (vc < R1 + vbp + h))) else '0';
    
    process(xpix,ypix)
    variable rom_addr1, rom_addr2: std_logic_vector(16 downto 0);     
    begin
        rom_addr1 := (ypix & "0000000") + ('0' & ypix & "000000")
        + ("00" & ypix & "00000") + ("000" & ypix & "0000"); --y*(128)
        rom_addr2 := rom_addr1 + ("0000000" & xpix); --y*240+x
        rom_addr16 <= rom_addr2(15 downto 0);
    end process;
    process(spriteon,vidon,M)
        variable j: integer;
    begin    
        red <= "000";
        green <= "000";
        blue <= "00";
        if spriteon = '1' and vidon = '1' then
            red <= M(7 downto 5);
            green <= M(4 downto 2);
            blue <= M(1 downto 0);
        end if;
    end process;

end Behavioral;
