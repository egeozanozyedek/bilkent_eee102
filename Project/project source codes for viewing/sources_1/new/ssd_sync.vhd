library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssd_sync is
    Port ( clock : in STD_LOGIC;
           code_0 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_1 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_2 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           code_3 : in STD_LOGIC_VECTOR (6 downto 0); --decoder output
           digit : out STD_LOGIC_VECTOR (6 downto 0); 
           display : out STD_LOGIC_VECTOR (3 downto 0));
end ssd_sync;

architecture Behavioral of ssd_sync is

signal count : integer range 0 to 4;

begin

process( clock)
begin

if (rising_edge(clock)) then
    
    case count is
        when 0 => display <= "1110";
                  digit <= code_0;
        when 1 => display <= "1101";
                  digit <= code_1;
        when 2 => display <= "1011";
                  digit <= code_2;
        when 3 => display <= "0111";
                  digit <= code_3;
        when others => display <= "1111";
                       digit <= "1111111";                        
    end case;
    
    count <= count + 1;
    if (count = 4) then
    
        count <= 0;
        
     end if;
    
end if;
end process;


end Behavioral;
