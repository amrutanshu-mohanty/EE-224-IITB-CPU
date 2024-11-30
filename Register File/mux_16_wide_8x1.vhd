library ieee;
use ieee.std_logic_1164.all;

entity mux_16_wide_8x1 is
	Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC_VECTOR (15 downto 0);
          s : in STD_LOGIC_VECTOR(2 downto 0);
          y : out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of mux_16_wide_8x1 is

signal t: std_logic_vector(7 downto 0) := "00000000";

begin
	t(0) <= (not s(2)) and (not s(1)) and (not s(0));
	t(1) <= (not s(2)) and (not s(1)) and s(0);
	t(2) <= (not s(2)) and s(1) and (not s(0));
	t(3) <= (not s(2)) and s(1) and s(0);
	t(4) <= s(2) and (not s(1)) and (not s(0));
	t(5) <= s(2) and (not s(1)) and s(0);
	t(6) <= s(2) and s(1) and (not s(0));
	t(7) <= s(2) and s(1) and s(0);
	
	code: for i in 0 to 15 generate
				y(i) <= (t(0) and i0(i)) or (t(1) and i1(i)) or (t(2) and i2(i)) or (t(3) and i3(i)) or 
						  (t(4) and i4(i)) or (t(5) and i5(i)) or (t(6) and i6(i)) or (t(7) and i7(i));
			end generate;
end architecture;