library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.isSomething.all;

entity projectile is
  Port ( clock: in std_logic;
  cposx, cposy, hcurrent, vcurrent: in integer;
  rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
  direction: in std_logic_vector( 3 downto 0);
  pposx, pposy: out integer;
  expired: out std_logic;
  enable: in std_logic;
  reset: in std_logic);
end projectile;

architecture Behavioral of projectile is

component clock_divider is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
end component;

signal clk_out: std_logic;
signal exp: std_logic:= '0';
signal reachable: std_logic_vector (3 downto 0);
signal xpos: integer;
signal ypos: integer;
signal count: integer;
signal check: std_logic_vector (3 downto 0);
signal dir: std_logic_vector(3 downto 0);

begin

divider : clock_divider port map (clock, '0', 1000000, clk_out);

isReachable(clock, xpos, ypos, hcurrent, vcurrent, rgb_sig, play_rgb, reachable);


movement: process(clk_out, enable) begin

    if rising_edge(clk_out) then
    
    if (count = 0) then
        dir <= direction;
      if dir = "0000" then
              xpos <= (cposx - 10);
              ypos <= (cposy + 6);
          end if;
        
        if dir(0) = '1' then
            xpos <= (cposx + 6);
            ypos <= (cposy - 10);
        end if;
        
        if dir(1) = '1' then
            xpos <= (cposx + 22);
            ypos <= (cposy + 6);
        end if;
        
        if dir(2) = '1' then
            xpos <= (cposx + 6);
            ypos <= (cposy + 22);
        end if;
        
        if dir(3) = '1' then
            xpos <= (cposx - 10);
            ypos <= (cposy + 6);
        end if;
         count <= count + 1;
    end if;

    
    if reset = '1' then
        
        exp <= '0';
        dir <= direction;
       
        if dir(0) = '1' then
            xpos <= (cposx + 6);
            ypos <= (cposy - 10);
        end if;
        
        if dir(1) = '1' then
            xpos <= (cposx + 22);
            ypos <= (cposy + 6);
        end if;
        
        if dir(2) = '1' then
            xpos <= (cposx + 6);
            ypos <= (cposy + 22);
        end if;
        
        if dir(3) = '1' or dir = "0000" then
            xpos <= (cposx - 10);
            ypos <= (cposy + 6);
        end if;
        
    end if;
    
    if (enable = '1' and exp = '0') then

            if ( dir(0) = '1' and reachable(0) = '1')then
                ypos <= ypos - 10;
            end if;
            if (dir (0) = '1' and reachable(0) = '0') then
                    exp <= '1';
            end if;
            
            if ( dir(1) = '1' and reachable(1) = '1') then
                xpos <= xpos + 10;
            end if;
            if (dir (1) = '1' and reachable(1) = '0') then
                    exp <= '1';
            end if;
            
            if ( dir(2) = '1'and reachable(2) = '1') then
                ypos <= ypos + 10;
            end if;
            if (dir (2) = '1' and reachable(2) = '0') then
                    exp <= '1';
            end if;
            
            if ( (dir(3) = '1' or dir = "0000" ) and reachable(3) = '1') then
                xpos <= xpos - 10;
            end if;
            if ((dir (3) = '1' or dir = "0000" ) and reachable(3) = '0') then
                    exp <= '1';
            end if;
            
        end if;
    end if;
end process;

pposx <= xpos;
pposy <= ypos;
expired <= exp;

end Behavioral;
