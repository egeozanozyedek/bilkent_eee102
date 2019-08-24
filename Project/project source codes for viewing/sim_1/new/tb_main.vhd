library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is

component main is
    Port ( input_code : in STD_LOGIC_VECTOR (15 downto 0);
       buttons : in STD_LOGIC_VECTOR (4 downto 0);
       led_code : out STD_LOGIC_VECTOR (15 downto 0);
       digit : out STD_LOGIC_VECTOR (6 downto 0);
       display : out STD_LOGIC_vector (3 downto 0);
       clock : in STD_LOGIC);
         end component;

signal code, led: STD_LOGIC_VECTOR (15 downto 0);
signal btns: std_logic_vector (4 downto 0);
signal display: STD_LOGIC_VECTOR (3 downto 0);
signal digit: STD_LOGIC_VECTOR (6 downto 0);
signal clock: STD_LOGIC:= '0';
constant clock_period: time:= 10ns;


begin

uut: Main port map (code, btns, led, digit, display, clock);

clock_process :process 
begin

clock <= '0';
wait for clock_period/2; 
clock <= '1';
wait for clock_period/2; 
end process;

stimulus_process: process
begin

code <= "0101010101010101";
wait for clock_period*10;
code <= "0101000000110010";
wait for clock_period*10;
code <= "0101011000110010";
wait for clock_period*10;
code <= "0001010110011010";
wait for clock_period*10;
end process;

end Behavioral;
