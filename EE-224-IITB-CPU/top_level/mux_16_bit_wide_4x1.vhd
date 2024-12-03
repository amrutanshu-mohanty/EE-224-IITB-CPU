library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Gates.all;

entity mux_16_bit_wide_4x1 is
    Port ( I0, I1, I2, I3 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Y : out STD_LOGIC_VECTOR(15 downto 0));
end entity mux_16_bit_wide_4x1;

architecture struct of mux_16_bit_wide_4x1 is
	signal input1: std_logic_vector(3 downto 0);
   component four_to_one_mux is
	port(I: in std_logic_vector(3 downto 0);
			S: in std_logic_vector(1 downto 0);
			y: out std_logic);
	end component four_to_one_mux;

begin
    U1: for i in 0 to 15 generate
	 signal input1: std_logic_vector(3 downto 0);
		begin
		input1(0) <= I0(i);
		input1(1) <= I1(i);
		input1(2) <= I2(i);
		input1(3) <= I3(i);
		
		mux1: four_to_one_mux port map(input1, S, Y(i));
	 end generate;
end architecture;