library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Operator is
    Port ( input_1 : in STD_LOGIC_VECTOR (5 downto 0);
           input_2 : in STD_LOGIC_VECTOR (5 downto 0);
           s : in STD_LOGIC;
           clock : in STD_LOGIC;
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0));
end Operator;

architecture Behavioral of Operator is

component Decoder is port ( input : in STD_LOGIC_VECTOR (2 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0));
           end component;

component Arithmetic_Operator is port ( input_1 : in STD_LOGIC_VECTOR (5 downto 0);
           input_2 : in STD_LOGIC_VECTOR (5 downto 0);
           s : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (8 downto 0);
           sign : out STD_LOGIC);
           end component;

signal sign: std_logic;
signal d_0: std_logic_vector (6 downto 0);
signal d_1: std_logic_vector (6 downto 0);
signal d_2: std_logic_vector (6 downto 0);
signal d_2s: std_logic_vector (6 downto 0);
signal d_3: std_logic_vector (6 downto 0);
signal output: std_logic_vector (8 downto 0);
signal count: integer range 0 to 4;

begin

arit : arithmetic_operator port map (input_1, input_2, s, output, sign);
dec0 : decoder port map ( output(2 downto 0) ,d_0);
dec1 : decoder port map ( output(5 downto 3) ,d_1);
dec2 : decoder port map ( output(8 downto 6) ,d_2s);
dec3 : decoder port map ( "000" ,d_3);

process (sign)
begin
    if (sign = '1') then
        d_2 <= "1111110";
        else
        d_2 <= d_2s;
    end if;
end process;

process( clock)
begin

if (rising_edge(clock)) then
    
    case count is
        when 0 => anode <= "1110";
                  cathode <= d_0;
        when 1 => anode <= "1101";
                  cathode <= d_1;
        when 2 => anode <= "1011";
                  cathode <= d_2;
        when 3 => anode <= "0111";
                  cathode <= d_3;
        when others => anode <= "1111";
                       cathode <= "1111111";                        
    end case;
    
    count <= count + 1;
    if (count = 4) then
    
        count <= 0;
        
     end if;
    
end if;
end process;

end Behavioral;
