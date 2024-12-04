library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity IMPLY_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
end entity;

architecture struct of IMPLY_16 is
	signal t: std_logic_vector(15 downto 0);
	
	component NOT_16 is
	port (A: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component OR_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;

begin
	inst1: NOT_16 port map(B, t);
	inst2: OR_16 port map(A, t, C);
end architecture;