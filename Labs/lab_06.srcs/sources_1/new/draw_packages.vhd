library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package draw is
    procedure rectangle( xside, yside: in integer;
     hcurrent, vcurrent, xpos, ypos: in integer;
     r, g, b: in std_logic_vector (3 downto 0);
    signal r_o, g_o, b_o: out std_logic_vector (3 downto 0);
    signal draw: out std_logic);
    
    
end draw;

package body draw is

    procedure rectangle( xside, yside: in integer;
     hcurrent, vcurrent, xpos, ypos: in integer;
    r, g, b: in std_logic_vector (3 downto 0);
    signal r_o, g_o, b_o: out std_logic_vector (3 downto 0);
    signal draw: out std_logic) is 
    begin
        if ((hcurrent > xpos and hcurrent < (xpos + xside)) and (vcurrent > ypos and vcurrent < (ypos + yside))) then
            r_o <= r;
            g_o <= g;
            b_o <= b;
            draw <= '1';
        else
            draw <= '0';
        end if;
    end rectangle;
    
end draw;