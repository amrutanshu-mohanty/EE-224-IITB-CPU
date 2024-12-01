library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;

entity adder_subtractor is
	port(A, B: in std_logic_vector(15 downto 0);
			C_in: in std_logic;
			C: out std_logic_vector(15 downto 0);
			C_out: out std_logic
	);
end entity adder_subtractor;

architecture struct of adder_subtractor is

	component kogge_stone is
    port(A, B: in std_logic_vector(15 downto 0);
            c_in: in std_logic;
            sum : out std_logic_vector(15 downto 0);
            carry: out std_logic);
	end component kogge_stone;
	
	component NOT_16 is
	port (A: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component mux_16_bit_wide_2x1 is
    Port ( I0, I1 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(15 downto 0));
	end component mux_16_bit_wide_2x1;
	
	signal inv_b, b_out: std_logic_vector(15 downto 0);
	
begin
	not1: NOT_16 port map(B, inv_b);
	mux1: mux_16_bit_wide_2x1 port map(B, inv_b, C_in, b_out);
	kogge: kogge_stone port map(A, b_out, C_in, C, C_out);
end struct;