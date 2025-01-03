library ieee;
use ieee.std_logic_1164.all;

entity demux_16_wide_8x1 is
	Port ( i : in STD_LOGIC_VECTOR(15 downto 0);
			 y0, y1, y2, y3, y4, y5, y6, y7 : out STD_LOGIC_VECTOR (15 downto 0);
          s : in STD_LOGIC_VECTOR(2 downto 0));
end entity;

architecture arch of demux_16_wide_8x1 is

component decoder_3x8 is
	port (i: in std_logic_vector(2 downto 0);
			y: out std_logic_vector(7 downto 0));
end component;

signal t: std_logic_vector(7 downto 0) := "00000000";
signal u0, u1, u2, u3, u4, u5, u6, u7: std_logic_vector(15 downto 0) := "0000000000000000";

begin
	decoder: decoder_3x8 port map(i => s, y => t);
	u_logic: for j in 0 to 15 generate
					u0(j) <= ((not t(0)) and u0(j)) or (t(0) and i(j));
					u1(j) <= ((not t(1)) and u1(j)) or (t(1) and i(j));
					u2(j) <= ((not t(2)) and u2(j)) or (t(2) and i(j));
					u3(j) <= ((not t(3)) and u3(j)) or (t(3) and i(j));
					u4(j) <= ((not t(4)) and u4(j)) or (t(4) and i(j));
					u5(j) <= ((not t(5)) and u5(j)) or (t(5) and i(j));
					u6(j) <= ((not t(6)) and u6(j)) or (t(6) and i(j));
					u7(j) <= ((not t(7)) and u7(j)) or (t(7) and i(j));
	end generate;
	
	y0 <= u0; y1 <= u1; y2 <= u2; y3 <= u3;
	y4 <= u4; y5 <= u5; y6 <= u6; y7 <= u7;
	
end architecture;
	
	