library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;

architecture arch of Testbench is
signal clk1: std_logic := '0';
signal inp, outp: std_logic_vector(15 downto 0) := "0000000000000000";
signal zero: std_logic_vector(15 downto 0) := "0000000000000000";

component register_16bit is
	port (p_in: in std_logic_vector(15 downto 0);
			p_out: out std_logic_vector(15 downto 0);
			clk: in std_logic);
end component;
begin
	
	clock: process is
	begin
		clk1 <= not clk1;
		wait for 10 ns;
	end process;
	
	input: process is
	begin
		inp(0) <= '1';
		wait for 15 ns;
		inp(13 downto 10) <= "1111";
		wait for 15 ns;
		inp(8) <= '1';
		wait for 15 ns;
		inp(0) <= '0';
		wait for 5 ns;
		inp(7 downto 4) <= "1001";
		wait for 15 ns;
		inp(15) <= '1';
		wait for 10 ns;
	end process;
	
	uut: register_16bit
		port map(clk => clk1, p_in => inp, p_out => outp);
	
end architecture;
	