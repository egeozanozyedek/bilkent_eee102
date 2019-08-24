library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.draw.all;
use work.arrays.all;
use work.IsSomething.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity level_draw is
    Port ( input_code: in std_logic_vector (15 downto 0);
           clk : in STD_LOGIC;
           hcurrent, vcurrent : in integer;
           r,g,b : out STD_LOGIC_VECTOR (3 downto 0);
           buttons: in std_logic_vector(4 downto 0);
           random: out std_logic_vector (15 downto 0));
end level_draw;

architecture Behavioral of level_draw is

component player is
Port ( buttons : in STD_LOGIC_VECTOR (4 downto 0);
    clock, reset, difficulty : in std_logic;
    inx, iny, hcurrent, vcurrent: in integer;
    rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
    cxpos, cypos : out integer;
    direction: out std_logic_vector (3 downto 0);
    action: out std_logic);
end component;

component rng is
Port ( clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       en : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (15 downto 0);
       check: out STD_LOGIC);
       end component;

component enemy is
Port ( clock, reset, enemy_type, difficulty : in std_logic;
           inx, iny, hcurrent, vcurrent, cposx, cposy, hostility_range : in integer;
           rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
           eposx, eposy : out integer);
end component;

component projectile is
  Port ( clock: in std_logic;
  cposx, cposy, hcurrent, vcurrent: in integer;
  rgb_sig, play_rgb: in std_logic_vector (11 downto 0);
  direction: in std_logic_vector( 3 downto 0);
  pposx, pposy: out integer;
  enable: in std_logic;
  expired: out std_logic;
  reset: in std_logic );
end component;

component clock_divider is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
end component;


--signals
signal level, prev_level: std_logic_vector(1 downto 0):= "00";
signal restart_level: std_logic_vector (1 downto 0);
signal draw : std_logic_vector (20 downto 0);
signal incx, cposx, doorx, tposx, pposx, points, eposx, inex : integer range 0 to 1904;
signal incy, cposy, doory, tposy, pposy, eposy, iney : integer range 0 to 932;
signal rgb_o : RGB;
signal rgb_sig, rgb_change : std_logic_vector (11 downto 0);
signal reset_p, indicator, reset_e, action, enable_prj, expired, reset_prj, enemy_type, difficulty, clk_out, draw_enemy, draw_treasure: std_logic;
signal rng_enable: std_logic:= '1';
signal enemy_hp: std_logic_vector (2 downto 0);
signal direction: std_logic_vector(3 downto 0);
signal dir_of_prj: std_logic_vector (3 downto 0);
signal rng_random: std_logic_vector (15 downto 0);

--constants
constant outside_rgb: std_logic_vector(11 downto 0):= "100000100000";
constant inside_rgb: std_logic_vector(11 downto 0):= "100000110000";
constant character_rgb: std_logic_vector(11 downto 0):= "111111111111";
constant door_rgb: std_logic_vector(11 downto 0):= "100000100000";
constant enemy_rgb: std_logic_vector(11 downto 0):= "000000000000";
constant treasure_rgb: std_logic_vector(11 downto 0):= "111111110000";

begin


divider: clock_divider port map (clk, '0', 100000000, clk_out);
rdm : rng port map (clk, '0', rng_enable, rng_random);
ply: player port map (buttons, clk, reset_p, difficulty, incx, incy, hcurrent, vcurrent, rgb_sig, inside_rgb, cposx, cposy, direction, action);
enm1: enemy port map (clk, reset_e, enemy_type, difficulty ,inex, iney, hcurrent, vcurrent, cposx, cposy, 200, rgb_sig, inside_rgb, eposx, eposy);

prj: projectile port map (clk, cposx, cposy, hcurrent, vcurrent, rgb_sig, inside_rgb, dir_of_prj, pposx, pposy, enable_prj, expired, reset_prj);
--enemy_prj: projectile port map (clk, cposx, cposy, hcurrent, vcurrent, rgb_sig, inside_rgb, dir_of_prj, pposx, pposy, enable_prj, expired, reset_prj);

r <= rgb_sig(11 downto 8);
g <= rgb_sig(7 downto 4);
b <= rgb_sig(3 downto 0);

level_process : process (hcurrent, vcurrent, clk, clk_out) begin
    
reset_prj <= '0';
reset_e <= '0';
reset_p <= '0';

    if rising_edge(clk) then

        if level = "00" then
        inex <= 664;
        iney <= 732;
        name( LETMEGO, hcurrent, vcurrent, "111111111111", rgb_o(0), draw(0));
        start (ST, hcurrent, vcurrent, "111111111111", rgb_o(1), draw(1));
            if action = '1' then
                level <= "01";
            end if;
        end if;
            
        if level = "01" then
            doorx <= 1384;
            doory <= 277;
            incx <= 1694;
            incy <= 732;
            inex <= 664;
            iney <= 732;
            
            --draw level

            rectangle( 1200, 660, hcurrent, vcurrent, 584, 152, outside_rgb, rgb_o(0), draw(0)); -- outside constraints
            rectangle( 1120, 600, hcurrent, vcurrent, 624, 182, inside_rgb, rgb_o(1), draw(1)); -- inside
            rectangle( 20, 20, hcurrent, vcurrent, cposx, cposy, character_rgb, rgb_o(20), draw(20));
            rectangle( 511, 400, hcurrent, vcurrent, 724, 282, outside_rgb, rgb_o(2), draw(2));
            rectangle( 510, 200, hcurrent, vcurrent, 1234, 482, outside_rgb, rgb_o(3), draw(3));
            rectangle( 201, 100, hcurrent, vcurrent, 1334, 282, outside_rgb, rgb_o(4), draw(4));
            rectangle( 210, 50, hcurrent, vcurrent, 1534, 282, outside_rgb, rgb_o(5), draw(5));
            rectangle( 100, 10, hcurrent, vcurrent, doorx, doory, door_rgb , rgb_o(6), draw(6));
            --numbers(digits, points, hcurrent, vcurrent, "111111111111", rgb_o(7), draw(7));

        -- reset condition when player dies
        if (((cposx - eposx + 3) ** 2 + (cposy - eposx + 3) ** 2 <= 20 ** 2) and enemy_hp(0) = '0') then
            reset_p <= '1';
            reset_e <= '1';
        end if;
        
        -- enemy draw condition
        if (enemy_hp(0) = '0') then
            rectangle( 14, 14, hcurrent, vcurrent, eposx, eposy, enemy_rgb, rgb_o(8), draw(8));
            tposx <= eposx + 5;
            tposy <= eposy + 5;
        end if;
         --projectile conditions                                   
         if (action = '1' and indicator = '0') then
           reset_prj <= '1';
           dir_of_prj <= direction;
           enable_prj <= '1';
           indicator <= '1';
        end if;
           
        if (expired = '1')  then
           enable_prj <= '0';
           reset_prj <= '1';
           indicator <= '0';
        end if;  
           
           -- enemy death/ treasure draw condition
           if ( isInRange(pposx + 5, pposy + 2, eposx + 10, eposy + 10, 30) = '1' and draw(19) = '1') then
               enemy_hp(0) <= '1';
               draw_treasure <= '1';
               points <= points + 1;
           end if;
           
           -- Level transition
            if ( isInRange(cposx + 10, cposy + 10, doorx , doory, 30) = '1'  and rng_random = input_code ) then
               random <= x"0000";
               rng_enable <= '1';
               enemy_hp <= "000";
               level <= "11";
           end if;        
           
                               
           --draws treasure upon enemy death
           if draw_treasure = '1' then
               rectangle( 10, 10, hcurrent, vcurrent, tposx, tposy, treasure_rgb, rgb_o(8), draw(8));
            end if;
            
            --obtains the randomly generated number
            if ( isInRange(cposx + 10, cposy + 10, tposx +5 , tposy + 5, 15) = '1' and action = '1') then
                rng_enable <= '0';
                random <= rng_random;
                draw_treasure <= '0';
            end if;
            
            --enables projectile draw
            if (enable_prj = '1') then
               rectangle( 8, 8, hcurrent, vcurrent, pposx, pposy, "111100000000" , rgb_o(19), draw(19)); -- projectile
            end if;
        end if;
            
            if level = "11" then
            won (wonA, hcurrent, vcurrent, "111111111111", rgb_o(15), draw(15));
                --rectangle( 1200, 660, hcurrent, vcurrent, 584, 152, "111100000000", rgb_o(0), draw(0));
                if action = '1' then 
                
                    level <= "01";     
                end if;
            end if;

            if (draw(20) = '1') then
                rgb_sig <= rgb_o(20);
            elsif (draw(19) = '1') then
                rgb_sig <= rgb_o(19);   
            elsif (draw(18) = '1') then
               rgb_sig <= rgb_o(18);    
            elsif (draw(17) = '1') then
               rgb_sig <= rgb_o(17);
            elsif (draw(16) = '1') then
                rgb_sig <= rgb_o(16);      
            elsif (draw(15) = '1') then
                rgb_sig <= rgb_o(15); 
            elsif (draw(14) = '1') then
                rgb_sig <= rgb_o(14);                
            elsif (draw(13) = '1') then
                rgb_sig <= rgb_o(13);
            elsif (draw(12) = '1') then
                rgb_sig <= rgb_o(12);
            elsif (draw(11) = '1') then
                rgb_sig <= rgb_o(11);   
            elsif (draw(10) = '1') then
                rgb_sig <= rgb_o(10);       
            elsif (draw(9) = '1') then
                rgb_sig <= rgb_o(9);   
            elsif draw(8) = '1' then
               rgb_sig <= rgb_o(8);    
            elsif (draw(7) = '1') then
               rgb_sig <= rgb_o(7);
            elsif (draw(6) = '1') then
                rgb_sig <= rgb_o(6);      
            elsif (draw(5) = '1') then
                rgb_sig <= rgb_o(5); 
            elsif (draw(4) = '1') then
                rgb_sig <= rgb_o(4);                
            elsif (draw(3) = '1') then
                rgb_sig <= rgb_o(3);
            elsif (draw(2) = '1') then
                rgb_sig <= rgb_o(2);
            elsif (draw(1) = '1') then
                rgb_sig <= rgb_o(1); 
            elsif (draw(0) = '1') then
                rgb_sig <= rgb_o(0);  
            else 
                rgb_sig <= (others => '0');
            end if;

    end if;
end process;
end Behavioral;