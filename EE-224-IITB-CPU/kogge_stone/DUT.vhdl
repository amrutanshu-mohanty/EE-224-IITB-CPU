-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(32 downto 0);
       	output_vector: out std_logic_vector(16 downto 0));
end entity;

architecture DutWrap of DUT is
   component kogge_stone is
	port(A, B: in std_logic_vector(15 downto 0);
			c_in: in std_logic;
			sum : out std_logic_vector(15 downto 0);
			carry: out std_logic);
	end component kogge_stone;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: kogge_stone
			port map (
					-- order of inputs B A
					A => input_vector(32 downto 17),
					B => input_vector(16 downto 1),
					c_in => input_vector(0),
               -- order of output OUTPUT
					sum => output_vector(15 downto 0),
					carry => output_vector(16));
end DutWrap;