library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
--use IEEE.Numeric_std.ALL;


entity Arithmetic_Operator is
    Port ( input_1 : in STD_LOGIC_VECTOR (5 downto 0);
           input_2 : in STD_LOGIC_VECTOR (5 downto 0);
           s : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (8 downto 0);
           sign : out STD_LOGIC);
end Arithmetic_Operator;

architecture Behavioral of Arithmetic_Operator is

begin

process (input_1, input_2, s)
begin
    if ( s = '0') then
        sign <= '0';
        output <= "000" & unsigned( input_1) + unsigned( input_2);
    else
        if ( unsigned(input_1) < unsigned(input_2)) then
            sign <= '1';
            output <= "000" & unsigned( input_2) - unsigned( input_1);
        else
        sign <= '0';
            output <= "000" & unsigned( input_1) - unsigned( input_2);
        end if;
    end if;
end process;

end Behavioral;
