library ieee;
use ieee.std_logic_1164.all;

entity register_16bit is
	port (p_in: in std_logic_vector(15 downto 0);
			p_out: out std_logic_vector(15 downto 0);
			clk: in std_logic);
end entity;

architecture arch of register_16bit is

component dflip is
	port (d, clock, set, reset: in std_logic;
			q: out std_logic);
end component;

begin
	dflip0: dflip port map(d => p_in(0), set => '0', reset => '0', clock => clk, q => p_out(0));
	dflip1: dflip port map(d => p_in(1), set => '0', reset => '0', clock => clk, q => p_out(1));
	dflip2: dflip port map(d => p_in(2), set => '0', reset => '0', clock => clk, q => p_out(2));
	dflip3: dflip port map(d => p_in(3), set => '0', reset => '0', clock => clk, q => p_out(3));
	dflip4: dflip port map(d => p_in(4), set => '0', reset => '0', clock => clk, q => p_out(4));
	dflip5: dflip port map(d => p_in(5), set => '0', reset => '0', clock => clk, q => p_out(5));
	dflip6: dflip port map(d => p_in(6), set => '0', reset => '0', clock => clk, q => p_out(6));
	dflip7: dflip port map(d => p_in(7), set => '0', reset => '0', clock => clk, q => p_out(7));
	dflip8: dflip port map(d => p_in(8), set => '0', reset => '0', clock => clk, q => p_out(8));
	dflip9: dflip port map(d => p_in(9), set => '0', reset => '0', clock => clk, q => p_out(9));
	dflip10: dflip port map(d => p_in(10), set => '0', reset => '0', clock => clk, q => p_out(10));
	dflip11: dflip port map(d => p_in(11), set => '0', reset => '0', clock => clk, q => p_out(11));
	dflip12: dflip port map(d => p_in(12), set => '0', reset => '0', clock => clk, q => p_out(12));
	dflip13: dflip port map(d => p_in(13), set => '0', reset => '0', clock => clk, q => p_out(13));
	dflip14: dflip port map(d => p_in(14), set => '0', reset => '0', clock => clk, q => p_out(14));
	dflip15: dflip port map(d => p_in(15), set => '0', reset => '0', clock => clk, q => p_out(15));
end architecture;