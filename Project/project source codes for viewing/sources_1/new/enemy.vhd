library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library work;
use work.isSomething.all;

entity enemy is
    Port ( clock, reset, enemy_type, difficulty : in std_logic;
           inx, iny, hcurrent, vcurrent, cposx, cposy, hostility_range : in integer;
           rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
           eposx, eposy : out integer);
end enemy;

architecture Behavioral of enemy is

component clock_divider is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
end component;

signal xpos: integer;
signal ypos: integer;
signal clk_out: std_logic;
signal reachable: std_logic_vector (3 downto 0);
signal count: integer;
signal speed: integer:= 2;

begin

    divider : clock_divider port map (clock, '0', 1000000, clk_out);
    
    isReachable(clock, xpos, ypos, hcurrent, vcurrent, rgb_sig, play_rgb, reachable);

    movement: process(clk_out) begin
    if rising_edge(clk_out) then
        if count = 0 then
        xpos <= inx;
        ypos <= iny;
        count <= count + 1;
        end if;
    
        if (reset = '1') then
            xpos <= inx;
            ypos <= iny;
        end if;
        
        if (difficulty = '0') then
            speed <= 2;
        else
            speed <= 4;
        end if;
        
        if (enemy_type = '0') then
            if (((xpos - cposx) ** 2) + ((ypos - cposy) ** 2) < (hostility_range ** 2)) then
                if (xpos < cposx) then
                    if (reachable(3) = '1') then
                        xpos <= xpos + speed;
                    elsif (reachable(3) = '0' and reachable(1) = '1') then
                        xpos <= xpos - speed;
                    end if;
                elsif (xpos > cposx) then
                    if (reachable(1) = '1') then
                        xpos <= xpos - speed;
                    elsif (reachable(1) = '0' and reachable(3) = '1') then
                            xpos <= xpos + speed;
                    end if;
                end if;
                if (ypos < cposy) then
                    if (reachable(2) = '1') then
                        ypos <= ypos + speed;
                    elsif (reachable(2) = '0' and reachable(0) = '1') then
                        ypos <= ypos - speed;
                    end if;
                elsif (ypos > cposy) then
                    if (reachable(0) = '1') then
                        ypos <= ypos - speed;
                    elsif (reachable(0) = '0' and reachable(2) = '1') then
                        ypos <= ypos + speed;
                    end if;
                end if;
            end if;
        end if;
    end if;
    end process;
    
eposx <= xpos;
eposy <= ypos;
    
end Behavioral;
