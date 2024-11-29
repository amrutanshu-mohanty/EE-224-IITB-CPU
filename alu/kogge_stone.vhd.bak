library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;

entity full_adder_2 is
	port(a1,b1,d1: in std_logic;
			sum, carry: out std_logic);
end entity full_adder_2;

architecture boom of full_adder_2 is
	signal s1, s2, s3, s4, s5: std_logic;
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
end boom;