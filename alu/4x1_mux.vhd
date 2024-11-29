library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four_to_one_mux is
	port(I: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			y: out std_logic);
end entity four_to_one_mux;


architecture struct of four_to_one_mux is
	signal s1, s2 : std_logic;
	
	component two_to_one_mux is
	port(I0, I1, S: in std_logic;
			y: out std_logic);
	end component two_to_one_mux;
begin
	two_to_one_mux_1: two_to_one_mux port map(I0=>I(2), I1=>I(3), S=>S(0), y=>s1);
	two_to_one_mux_2: two_to_one_mux port map(I0=>I(0), I1=>I(1), S=>S(0), y=>s2);
	two_to_one_mux_3: two_to_one_mux port map(I0=>s2, I1=>s1, S=>S(1), y=>y);
end architecture;