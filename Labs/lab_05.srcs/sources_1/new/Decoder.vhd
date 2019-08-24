library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin

with input select cathode  <=
    "0000001" when "000",
    "1001111" when "001",
    "0010010" when "010", 
    "0000110" when "011",
    "1001100" when "100", 
    "0100100" when "101", 
    "0100000" when "110", 
    "0001111" when "111",
    "0111000" when others;

end Behavioral;
