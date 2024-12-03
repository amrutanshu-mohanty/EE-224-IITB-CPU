-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(10 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component eight_to_one_mux is
	port(I: in std_logic_vector(7 downto 0);
			S: in std_logic_vector(2 downto 0);
			y: out std_logic);
	end component eight_to_one_mux;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: eight_to_one_mux
			port map (
			I => input_vector(10 downto 3),
			S => input_vector(2 downto 0),
			y => output_vector(0)
			);
end DutWrap;