library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.draw.all;


entity vga_draw is
    Port ( clk : in STD_LOGIC;
           hcurrent, vcurrent : in integer;
           r,g,b : out STD_LOGIC_VECTOR (3 downto 0);
           buttons: in std_logic_vector(3 downto 0));
end vga_draw;

architecture Behavioral of vga_draw is

component movement is
Port ( buttons : in STD_LOGIC_VECTOR (3 downto 0);
           cposx : out integer range 0 to 1904;
           cposy : out integer range 0 to 932);
end component;

signal draw : std_logic_vector (6 downto 0);
signal cposx : integer range 0 to 1904;
signal cposy : integer range 0 to 932;
type RGB is array (6 downto 0) of std_logic_vector (3 downto 0);
signal r_o,g_o,b_o : RGB;


begin

mov: movement port map ( buttons, cposx, cposy);

rectangle( 1200, 660, hcurrent, vcurrent, 584, 152, "1111", "0000", "0011", r_o(0), g_o(0), b_o(0), draw(0));
rectangle( 1120, 600, hcurrent, vcurrent, 624, 182, "0011", "1111", "0000", r_o(1), g_o(1), b_o(1), draw(1));
rectangle( 20, 20, hcurrent, vcurrent, cposx, cposy, "0110", "1000", "1111", r_o(2), g_o(2), b_o(2), draw(2));
rectangle( 511, 400, hcurrent, vcurrent, 724, 282, "1111", "0000", "0011", r_o(3), g_o(3), b_o(3), draw(3));
rectangle( 510, 200, hcurrent, vcurrent, 1234, 482, "1111", "0000", "0011", r_o(4), g_o(4), b_o(4), draw(4));
rectangle( 201, 100, hcurrent, vcurrent, 1334, 282, "1111", "0000", "0011", r_o(5), g_o(5), b_o(5), draw(5));
rectangle( 210, 51, hcurrent, vcurrent, 1534, 282, "1111", "0000", "0011", r_o(6), g_o(6), b_o(6), draw(6));


process (clk) begin

    if rising_edge(clk) then
    
        if (draw(6) = '1') then
            r <= r_o(6);
            g <= g_o(6);
            b <= b_o(6);
                    
        elsif (draw(5) = '1') then
            r <= r_o(5);
            g <= g_o(5);
            b <= b_o(5);
                    
        elsif (draw(4) = '1') then
            r <= r_o(4);
            g <= g_o(4);
            b <= b_o(4);
                    
        elsif (draw(3) = '1') then
            r <= r_o(3);
            g <= g_o(3);
            b <= b_o(3);
    
    
        elsif (draw(2) = '1') then
            r <= r_o(2);
            g <= g_o(2);
            b <= b_o(2);
        
        elsif (draw(1) = '1') then
            r <= r_o(1);
            g <= g_o(1);
            b <= b_o(1);
        
        elsif (draw(0) = '1') then
            r <= r_o(0);
            g <= g_o(0);
            b <= b_o(0);

        else 
            r <= (others => '0');
            g <= (others => '0');
            b <= (others => '0');
        end if;
    end if;
    
end process;

end Behavioral;