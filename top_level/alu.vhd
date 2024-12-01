library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port(A, B: in std_logic_vector(15 downto 0);
			S: in std_logic_vector(2 downto 0);
			C: out std_logic_vector(15 downto 0);
			zero, carry: out std_logic
	);
end entity alu;

architecture struct of alu is
	
	component adder_subtractor is
		port(A, B: in std_logic_vector(15 downto 0);
				C_in: in std_logic;
				C: out std_logic_vector(15 downto 0);
				C_out: out std_logic
		);
	end component adder_subtractor;
		
	component AND_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component multiplier is
		port(A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0)
		);
	end component multiplier;
	
	component OR_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component IMPLY_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component NOT_16 is
	port (A: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
	component Zero_Check is
		port(A: in std_logic_vector(15 downto 0);
				y : out std_logic);
	end component Zero_Check;
	
	component mux_16_bit_wide_8x1 is
		 Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR (15 downto 0);
				  S : in STD_LOGIC_VECTOR(2 downto 0);
				  Y : out STD_LOGIC_VECTOR(15 downto 0));
	end component mux_16_bit_wide_8x1;
	
	signal I0, I2, I3, I4, I5, I6: std_logic_vector(15 downto 0);
	
begin
	-- 000 add
	-- 001 sub
	-- 010 mul
	-- 011 and
	-- 100 or
	-- 101 not
	-- 110 imp 
	-- 111 don't care
	
	add1: adder_subtractor port map(A, B, S(0), I0, carry);
	mul1: multiplier port map(A, B, I2);
	and1: AND_16 port map(A, B, I3);
	or1: OR_16 port map(A, B, I4);
	not1: NOT_16 port map(A, I5);
	imp1: IMPLY_16 port map(A, B, I6);
	
	check_zero: Zero_Check port map(I0, zero);
	mux1: mux_16_bit_wide_8x1 port map(
		I0 => I0,
		I1 => I0,
		I2 => I2,
		I3 => I3,
		I4 => I4,
		I5 => I5,
		I6 => I6,
		I7 => I6,
		S => S,
		Y => C
	);
	
	
end struct;