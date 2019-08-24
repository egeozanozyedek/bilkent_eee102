library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity movement is
    Port (
    buttons : in STD_LOGIC_VECTOR (3 downto 0);
           cposx : out integer range 0 to 1904;
           cposy : out integer range 0 to 932);
end movement;

architecture Behavioral of movement is

signal xpos : integer range 0 to 1904:= 1704;
signal ypos : integer range 0 to 932:= 742;

begin
process (buttons) begin
    if(  xpos > 624 and xpos < 1744 and ypos > 182 and ypos < 782) then
        if (buttons(0) = '1')then
        ypos <= ypos + 1;
        end if;
        if (buttons(1) = '1')then
        xpos <= xpos + 1;
        end if;
        if (buttons(2) = '1')then
        ypos <= ypos - 1;
        end if;
        if (buttons(3) = '1')then
        xpos <= xpos - 1;
        end if;
    end if;    
end process;

cposx <= xpos;
cposy <= ypos;  

end Behavioral;
