--simple module whioch converts 4-bit binary signals into 7-bit signals which will be used to show 
--a particular digit on the 7-segment-display

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decoder is
    Port ( input : in std_logic_vector (3 downto 0);
           digit : out std_logic_vector (6 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
process (input) begin
case input is
    when "0000" => digit <= "0000001"; -- "0"     
    when "0001" => digit <= "1001111"; -- "1" 
    when "0010" => digit <= "0010010"; -- "2" 
    when "0011" => digit <= "0000110"; -- "3" 
    when "0100" => digit <= "1001100"; -- "4" 
    when "0101" => digit <= "0100100"; -- "5" 
    when "0110" => digit <= "0100000"; -- "6" 
    when "0111" => digit <= "0001111"; -- "7" 
    when "1000" => digit <= "0000000"; -- "8"     
    when "1001" => digit <= "0000100"; -- "9" 
    when "1010" => digit <= "0000010"; -- a
    when "1011" => digit <= "1100000"; -- b
    when "1100" => digit <= "0110001"; -- C
    when "1101" => digit <= "1000010"; -- d
    when "1110" => digit <= "0110000"; -- E
    when "1111" => digit <= "0111000"; -- F
    end case;
end process;
end Behavioral;
