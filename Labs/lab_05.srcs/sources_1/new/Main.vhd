library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( input_1 : in STD_LOGIC_VECTOR (5 downto 0);
           input_2 : in STD_LOGIC_VECTOR (5 downto 0);
           led_1 : out STD_LOGIC_VECTOR (5 downto 0);
           led_2 : out STD_LOGIC_VECTOR (5 downto 0);
           s : in STD_LOGIC;
           clock : in STD_LOGIC;
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0));
end Main;

architecture Behavioral of Main is

component Operator is
Port ( input_1 : in STD_LOGIC_VECTOR (5 downto 0);
       input_2 : in STD_LOGIC_VECTOR (5 downto 0);
       s : in STD_LOGIC;
       clock : in STD_LOGIC;
       anode : out STD_LOGIC_VECTOR (3 downto 0);
       cathode : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Clock_Divider is
Port ( enabler : in STD_LOGIC;
       reset : in STD_LOGIC;
       clock : out STD_LOGIC);
end component;

signal clk_out : STD_LOGIC:= '0';

begin

clk: Clock_Divider port map (clock, '0', clk_out);
opr: Operator port map (input_1, input_2, s, clock, anode, cathode);

process (input_1, input_2) --process which enables me to set the led's above the switches to light up accordingly
begin
    for i in 0 to 5 loop
        led_1(i) <= input_1(i);
        led_2(i) <= input_2(i);
    end loop;
end process;

end Behavioral;
