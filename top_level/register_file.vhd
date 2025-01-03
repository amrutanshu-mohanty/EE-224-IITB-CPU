library ieee;
use ieee.std_logic_1164.all;

entity register_file is
	port (a1, a2, a3: in std_logic_vector(2 downto 0);
			d3: in std_logic_vector(15 downto 0);
			d1, d2: out std_logic_vector(15 downto 0);
			en, clk, reset: in std_logic);
end entity;

architecture arch of register_file is

component register_16bit is
	port (p_in: in std_logic_vector(15 downto 0);
			p_out: out std_logic_vector(15 downto 0);
			clk, en, reset: in std_logic);
end component;

component mux_16_wide_8x1 is
	Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC_VECTOR (15 downto 0);
          s : in STD_LOGIC_VECTOR(2 downto 0);
          y : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component demux_16_wide_8x1 is
	Port ( i : in STD_LOGIC_VECTOR(15 downto 0);
			 y0, y1, y2, y3, y4, y5, y6, y7 : out STD_LOGIC_VECTOR (15 downto 0);
          s : in STD_LOGIC_VECTOR(2 downto 0));
end component;

component decoder_3x8 is
	port (i: in std_logic_vector(2 downto 0);
			y: out std_logic_vector(7 downto 0));
end component;

signal out0, out1, out2, out3, out4, out5, out6, out7: std_logic_vector(15 downto 0) := "0000000000000000";
signal decoded, reg_ctrl: std_logic_vector(7 downto 0) := "00000000";

begin


	decoder: decoder_3x8 port map(i => a3, y => decoded);
	
	loop1:for i in 0 to 7 generate
				reg_ctrl(i) <= decoded(i) and en;
	end generate;
	
	reg0: register_16bit port map(p_in => d3, p_out => out0, clk => clk, en => reg_ctrl(0), reset => reset);
	reg1: register_16bit port map(p_in => d3, p_out => out1, clk => clk, en => reg_ctrl(1), reset => reset);
	reg2: register_16bit port map(p_in => d3, p_out => out2, clk => clk, en => reg_ctrl(2), reset => reset);
	reg3: register_16bit port map(p_in => d3, p_out => out3, clk => clk, en => reg_ctrl(3), reset => reset);
	reg4: register_16bit port map(p_in => d3, p_out => out4, clk => clk, en => reg_ctrl(4), reset => reset);
	reg5: register_16bit port map(p_in => d3, p_out => out5, clk => clk, en => reg_ctrl(5), reset => reset);
	reg6: register_16bit port map(p_in => d3, p_out => out6, clk => clk, en => reg_ctrl(6), reset => reset);
	reg7: register_16bit port map(p_in => d3, p_out => out7, clk => clk, en => reg_ctrl(7), reset => reset);
	
	mux1: mux_16_wide_8x1 port map(s => a1, i0 => out0, i1 => out1, i2 => out2, i3 => out3, i4 => out4, i5 => out5, i6 => out6, i7 => out7, y => d1);
	mux2: mux_16_wide_8x1 port map(s => a2, i0 => out0, i1 => out1, i2 => out2, i3 => out3, i4 => out4, i5 => out5, i6 => out6, i7 => out7, y => d2);
end architecture;