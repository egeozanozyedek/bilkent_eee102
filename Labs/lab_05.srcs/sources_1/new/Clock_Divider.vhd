library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Divider is
    Port ( enabler : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : out STD_LOGIC);
end Clock_Divider;

architecture Behavioral of Clock_Divider is

signal out_signal: STD_LOGIC;
signal counter : integer range 0 to 9999:= 0;

begin

process( enabler, reset)
begin

    if (reset = '1') then
        out_signal <= '0';
        counter <= 0;
        
    elsif rising_edge(enabler) then
        if (counter = 9999) then
            out_signal <= not out_signal;
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
     end if;
end process;
    
clock <= out_signal;
    
end Behavioral;
