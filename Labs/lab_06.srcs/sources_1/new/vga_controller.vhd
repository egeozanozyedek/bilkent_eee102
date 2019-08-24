library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_controller is
    Port ( clk : in STD_LOGIC;
           hsync, vsync : out STD_LOGIC;
           hcurrent : out integer range 0 to 1904:= 0;
            vcurrent : out integer range 0 to 932:= 0);
end vga_controller;

architecture Behavioral of vga_controller is

signal hpos: integer range 0 to 1904:= 0;
signal vpos: integer range 0 to 932:= 0;

begin


process(clk) begin

    if rising_edge(clk) then
        if (hpos < 1904) then
            hpos <= hpos + 1;
        else
            hpos <= 0;
            if (vpos < 932) then
                vpos <= vpos + 1;
                else
                vpos <= 0;
            end if;
        end if;
        if (hpos > 80 and hpos < 232) then
            hsync <= '0';
        else
            hsync <= '1';
        end if;
        if (vpos > 1 and vpos < 4) then
            vsync <= '0';
        else
            vsync <= '1';
        end if;

        hcurrent <= hpos;
        vcurrent <= vpos;
        
    end if;
end process;



end Behavioral;
