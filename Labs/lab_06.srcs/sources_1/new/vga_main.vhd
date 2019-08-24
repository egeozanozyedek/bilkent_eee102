library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity vga_main is
  Port ( clk : in std_logic;
  buttons : in std_logic_vector (3 downto 0);
  hsync, vsync : out std_logic;
  r, g, b : out std_logic_vector (3 downto 0));
end vga_main;

architecture Behavioral of vga_main is

component vga_controller is
    Port ( clk : in STD_LOGIC;
    hsync, vsync : out STD_LOGIC;
    hcurrent, vcurrent : out integer);
end component;

component vga_draw is 
    Port ( clk : in STD_LOGIC;
           hcurrent, vcurrent : in integer;
           r,g,b : out STD_LOGIC_VECTOR (3 downto 0);
           buttons : in std_logic_vector (3 downto 0));
end component;
signal hcurrent: integer range 0 to 1904:= 0;
signal vcurrent: integer range 0 to 932:= 0;

begin

controller : vga_controller port map (clk, hsync, vsync, hcurrent, vcurrent);
drawer : vga_draw port map (clk, hcurrent, vcurrent, r, g, b, buttons);

end Behavioral;
