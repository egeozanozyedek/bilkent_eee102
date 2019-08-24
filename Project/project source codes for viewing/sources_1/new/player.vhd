library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.isSomething.all;
use work.arrays.all;

entity player is
    Port ( buttons : in STD_LOGIC_VECTOR (4 downto 0);
    clock, reset, difficulty : in std_logic;
    inx, iny, hcurrent, vcurrent: in integer;
    rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
    cxpos, cypos : out integer;
    direction: out std_logic_vector (3 downto 0);
    action: out std_logic);
end player;

architecture Behavioral of player is

component clock_divider is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
end component;

signal xpos : integer range 0 to 1904;
signal ypos : integer range 0 to 932;
signal clk_out, slow_clock: std_logic;
signal reachable: std_logic_vector (3 downto 0);
signal count: integer;
signal speed: integer:= 4;

begin

divider0 : clock_divider port map (clock, '0', 1000000, clk_out);

isReachable(clock, xpos, ypos, hcurrent, vcurrent, rgb_sig, play_rgb, reachable);

movement: process (count, reset, clk_out) begin
    if rising_edge(clk_out) then
    
        if count = 0 then
        xpos <= inx;
        ypos <= iny;
        count <= count + 1;
        end if;
        
        if (reset  = '1') then
            xpos <= inx;
            ypos <= iny;
        end if;

        if (difficulty = '0') then
            speed <= 4;
        else
            speed <= 2;
        end if;
        
        if (buttons(0) = '1' and reachable(0) = '1')then
            ypos <= ypos - speed;
                direction(0) <= '1';
            else 
                direction(0) <= '0';
        end if;
        if (buttons(1) = '1' and reachable(1) = '1') then
            xpos <= xpos + speed;
            direction(1) <= '1';
        else 
            direction(1) <= '0';
        end if;
        if (buttons(2) = '1' and reachable(2) = '1') then
            ypos <= ypos + speed;
            direction(2) <= '1';
        else 
            direction(2) <= '0';
        end if;
        if (buttons(3) = '1' and reachable(3) = '1') then
            xpos <= xpos - speed;
            direction(3) <= '1';
        else 
            direction(3) <= '0';
        end if;
        if (buttons(4) = '1') then
                action <= '1';
            else
                action <= '0';
        end if;
    end if;
end process;

cxpos <= xpos;
cypos <= ypos;


end Behavioral;
