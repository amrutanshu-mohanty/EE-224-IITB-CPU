library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Gates.all;

entity mux_16_bit_wide_8x1 is
    Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR(2 downto 0);
           Y : out STD_LOGIC_VECTOR(15 downto 0));
end entity mux_16_bit_wide_8x1;

architecture struct of mux_16_bit_wide_8x1 is
   component eight_to_one_mux is
		port(I: in std_logic_vector(7 downto 0);
				S: in std_logic_vector(2 downto 0);
				y: out std_logic);
	end component eight_to_one_mux;

begin
    U1: for i in 0 to 15 generate
	 signal input1: std_logic_vector(7 downto 0);
		begin
		input1(0) <= I0(i);
		input1(1) <= I1(i);
		input1(2) <= I2(i);
		input1(3) <= I3(i);
		input1(4) <= I4(i);
		input1(5) <= I5(i);
		input1(6) <= I6(i);
		input1(7) <= I7(i);
		
		mux1: eight_to_one_mux port map(input1, S, Y(i));
	 end generate;
end architecture;
