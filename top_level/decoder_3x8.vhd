library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8 is
	port (i: in std_logic_vector(2 downto 0);
			y: out std_logic_vector(7 downto 0));
end entity;

architecture arch of decoder_3x8 is

begin
	y(0) <= (not i(2)) and (not i(1)) and (not i(0));
	y(1) <= (not i(2)) and (not i(1)) and i(0);
	y(2) <= (not i(2)) and i(1) and (not i(0));
	y(3) <= (not i(2)) and i(1) and i(0);
	y(4) <= i(2) and (not i(1)) and (not i(0));
	y(5) <= i(2) and (not i(1)) and i(0);
	y(6) <= i(2) and i(1) and (not i(0));
	y(7) <= i(2) and i(1) and i(0);
end architecture;