library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
    Port ( input_code : in STD_LOGIC_VECTOR (15 downto 0);
           buttons : in STD_LOGIC_VECTOR (4 downto 0);
           led_code : out STD_LOGIC_VECTOR (15 downto 0);
           digit : out STD_LOGIC_VECTOR (6 downto 0);
           display : out STD_LOGIC_vector (3 downto 0);
           hsync, vsync : out std_logic;
           r, g, b : out std_logic_vector (3 downto 0);
           clock : in STD_LOGIC);
end main;

architecture Behavioral of main is

component vga_main is
  Port ( input_code: in std_logic_vector (15 downto 0);
  clk : in std_logic;
  buttons : in std_logic_vector (4 downto 0);
  hsync, vsync : out std_logic;
  r, g, b : out std_logic_vector (3 downto 0);
  random: out std_logic_vector (15 downto 0));
end component;

component clock_divider is 
Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
           end component;

component decoder is
Port ( input : in std_logic_vector (3 downto 0);
       digit : out std_logic_vector (6 downto 0));
end component;

component ssd_sync is
Port ( clock : in STD_LOGIC;
           code_0 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_1 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_2 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_3 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           digit : out STD_LOGIC_VECTOR (6 downto 0); 
           display : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component debounce is
Port (buttons: in std_logic_vector (4 downto 0);
      clk : in std_logic;
      buttons_out : out std_logic_vector (4 downto 0));
end component;

signal buttons_out: std_logic_vector(4 downto 0);
signal code_0 : STD_LOGIC_VECTOR (6 downto 0);
signal code_1 : STD_LOGIC_VECTOR (6 downto 0);
signal code_2 : STD_LOGIC_VECTOR (6 downto 0);
signal code_3 : STD_LOGIC_VECTOR (6 downto 0);
signal clk_out : std_logic;
signal random : std_logic_vector (15 downto 0);

begin

bounce : debounce port map ( buttons, clock, buttons_out);
vga : vga_main port map (input_code, clock, buttons_out, hsync, vsync, r, g, b, random);
clk : clock_divider port map (clock, '0', 9999 , clk_out);
d_0 : decoder port map (random (3 downto 0), code_0);
d_1 : decoder port map (random (7 downto 4), code_1);
d_2 : decoder port map (random (11 downto 8), code_2);
d_3 : decoder port map (random (15 downto 12), code_3);
sync : ssd_sync port map (clk_out, code_0, code_1, code_2, code_3, digit, display);

led_code  <= input_code;

end Behavioral;
