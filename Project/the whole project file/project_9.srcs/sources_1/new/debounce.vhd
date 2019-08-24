library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity debounce is
Port (buttons: in std_logic_vector (4 downto 0);
      clk : in std_logic;
      buttons_out : out std_logic_vector (4 downto 0));
end debounce;
architecture Behavioral of debounce is
signal pass_1, pass_2, pass_3: std_logic_vector( 4 downto 0);
begin
    process(clk) begin
        if rising_edge(clk) then
            for i in 0 to 4 loop
                pass_1(i) <= buttons(i);
                pass_2(i) <= pass_1(i);
                pass_3(i) <= pass_2(i) ;
                end loop;
        end if;
    end process;
    process(pass_1, pass_2, pass_3) begin
        for i in 0 to 4 loop
            buttons_out(i) <= pass_1(i)  and pass_2(i)  and pass_3(i) ;
        end loop;
    end process;
end Behavioral;
