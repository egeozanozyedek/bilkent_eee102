library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is

component Main is
  Port ( input_1, input_2 : in STD_LOGIC_VECTOR (5 downto 0);
         s : in STD_LOGIC;
         clock : in STD_LOGIC;
         anode : out STD_LOGIC_VECTOR (3 downto 0);
         cathode : out STD_LOGIC_VECTOR (6 downto 0));
         end component;

signal input_1: STD_LOGIC_VECTOR (5 downto 0):= "000000";
signal input_2: STD_LOGIC_VECTOR (5 downto 0):= "000000";
signal anode: STD_LOGIC_VECTOR (3 downto 0):= "0000";
signal cathode: STD_LOGIC_VECTOR (6 downto 0):= "0000000";
signal clock: STD_LOGIC;
signal s: STD_LOGIC;
constant clock_period: time:= 10ns;


begin

uut: Main port map ( input_1, input_2, s, clock, anode, cathode);

clock_process :process begin

clock <= '0';
wait for clock_period/2; 
clock <= '1';
wait for clock_period/2; 
end process;

stimulus_process: process
begin

input_1 <= "000001";
input_2 <= "111111";
wait for clock_period*10;
input_1 <= "001001";
input_2 <= "110110";
wait for clock_period*10;
input_1 <= "111111";
input_2 <= "111111";
wait for clock_period*10;
input_1 <= "011001";
input_2 <= "110111";
wait for clock_period*10;
input_1 <= "001111";
input_2 <= "110011";
wait for clock_period*10;
input_1 <= "111111";
input_2 <= "111100";
wait for clock_period*10;


input_1 <= "000001";
input_2 <= "111111";
wait for clock_period*10;
input_1 <= "001001";
input_2 <= "110110";
wait for clock_period*10;
input_1 <= "111111";
input_2 <= "111111";
wait for clock_period*10;
input_1 <= "011001";
input_2 <= "110111";
wait for clock_period*10;
input_1 <= "001111";
input_2 <= "110011";
wait for clock_period*10;
input_1 <= "111111";
input_2 <= "111100";
wait for clock_period*10;

end process;

end Behavioral;
