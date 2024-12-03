library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity two_to_one_mux is
	port(I0, I1, S: in std_logic;
			y: out std_logic);
end entity two_to_one_mux;


architecture struct of two_to_one_mux is
	signal s1, s2, s3 : std_logic;
begin
	not_gate: INVERTER port map(a=>S, y=>s1);
	and_gate_1: AND_2 port map(a=>I0, b=>s1, y=>s2);
	and_gate_2: AND_2 port map(a=>I1, b=>S, y=>s3);
	or_gate_1: OR_2 port map(a=>s2, b=>s3, y=>y);
end architecture;
