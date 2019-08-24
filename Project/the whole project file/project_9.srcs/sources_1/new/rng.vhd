library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rng is
Port ( clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       en : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (15 downto 0);
       check: out STD_LOGIC);
end rng;

architecture Behavioral of rng is

signal Qt: STD_LOGIC_VECTOR(15 downto 0) := x"0001";

begin

PROCESS(clock)
variable tmp : STD_LOGIC := '0';
BEGIN

IF rising_edge(clock) THEN
   IF (reset='1') THEN
      Qt <= x"0001"; 
   ELSIF en = '1' THEN
      tmp := Qt(3) XOR Qt(2) XOR Qt(1) XOR Qt(0);
      Qt <= tmp & Qt(15 downto 1);
   END IF;

END IF;
END PROCESS;
check <= Qt(15);
Q <= Qt;

end Behavioral;