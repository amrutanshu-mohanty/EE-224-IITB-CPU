library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Gates.all;

entity mux_16_bit_wide_2x1 is
    Port ( I0, I1 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(15 downto 0));
end entity mux_16_bit_wide_2x1;

architecture struct of mux_16_bit_wide_2x1 is
   component two_to_one_mux is
	port(I0, I1, S: in std_logic;
			y: out std_logic);
	end component two_to_one_mux;

begin
    U1: for i in 0 to 15 generate
		mux1: two_to_one_mux port map(I0(i), I1(i), S, Y(i));
	 end generate;
end architecture;
