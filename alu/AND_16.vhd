library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity kogge_stone_adder is
	port (A, B: in std_logic_vector(15 downto 0);
			C0: in std_logic;
			output: out std_logic_vector(15 downto 0);
			C_out: out std_logic);
end entity;

architecture struct of shift_reg is


end architecture;