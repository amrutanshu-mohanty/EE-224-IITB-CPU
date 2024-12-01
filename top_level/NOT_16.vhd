library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity NOT_16 is
	port (A: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
end entity;

architecture struct of NOT_16 is
begin
	inst1: for i in 0 to 15 generate
		b2: INVERTER port map(A(i), C(i));
	end generate;
end architecture;