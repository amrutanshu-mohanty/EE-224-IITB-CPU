library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;

entity kogge_stone is
	port(A, B: in std_logic_vector(15 downto 0);
			sum : out std_logic_vector(15 downto 0);
			carry: out std_logic);
end entity kogge_stone;

architecture struct of kogge_stoneis
	signal g, p: std_logic_vector(15 downto 0);
	component half_adder_2 is
		port(a, b: in std_logic;
			s, c: out std_logic);
	end component;
	component or_from_nand is
		port(a, b: in std_logic;
			y: out std_logic);
	end component;
begin
	inst1: half_adder_2 port map(a=>a1, b=>b1, s=>s1, c=>s2);
	inst2: half_adder_2 port map(a=>d1, b=>s1, s=>s3, c=>s4);
	inst3: or_from_nand port map(a=>s4, b=>s2, y=>s5);
	sum<=s3;
	carry<=s5;
end struct;