library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity eight_to_one_mux is
	port(I: in std_logic_vector(7 downto 0);
			S: in std_logic_vector(2 downto 0);
			y: out std_logic);
end entity eight_to_one_mux;

architecture struct of eight_to_one_mux is
	signal s1, s2 : std_logic;
	
	component two_to_one_mux is
	port(I0, I1, S: in std_logic;
			y: out std_logic);
	end component two_to_one_mux;
	
	component four_to_one_mux is
		port(I: in std_logic_vector(3 downto 0);
				S: in std_logic_vector(1 downto 0);
				y: out std_logic);
	end component four_to_one_mux;
	
begin
	four_to_one_mux_1: four_to_one_mux port map(I=>I(3 downto 0), S=>S(1 downto 0), y=>s1);
	four_to_one_mux_2: four_to_one_mux port map(I=>I(7 downto 4), S=>S(1 downto 0), y=>s2);
	two_to_one_mux_3: two_to_one_mux port map(I0=>s1, I1=>s2, S=>S(2), y=>y);
end architecture;