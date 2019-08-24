library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           divider : in integer;
           clk_out : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal out_signal: STD_LOGIC;
signal counter : integer range 0 to 10**7 := 0;

begin

process( clk_in, reset) begin
    if (reset = '1') then
        out_signal <= '0';
        counter <= 0;
        
    elsif rising_edge(clk_in) then
        if (counter = divider) then
            out_signal <= not out_signal;
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
     end if;
end process;
    
clk_out <= out_signal;
    
end Behavioral;