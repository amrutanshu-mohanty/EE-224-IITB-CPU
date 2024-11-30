library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;

architecture arch of Testbench is
signal clk1: std_logic := '0';
signal d1, d2, d3: std_logic_vector(15 downto 0) := "0000000000000000";
--signal i1: std_logic_vector(15 downto 0) := "0000000000000001";
--signal i2: std_logic_vector(15 downto 0) := "0000000000000010";
signal a1, a2, a3: std_logic_vector(2 downto 0);

component register_file is
	port (a1, a2, a3: in std_logic_vector(2 downto 0);
			d3: in std_logic_vector(15 downto 0);
			d1, d2: out std_logic_vector(15 downto 0);
			en, clk: in std_logic);
end component;
begin
	
	input: process is
	begin
		wait for 5 ns;
		a3 <= "000";
		d3 <= "0011001100110011";
		a1 <= "000";
		a2 <= "000";
		wait for 20 ns;
		a3 <= "001";
		d3 <= "0000111100001111";
		a1 <= "001";
		a2 <= "000";
		wait for 20 ns;
		a3 <= "010";
		d3 <= "0000000011111111";
		a1 <= "010";
		a2 <= "000";
		wait for 20 ns;
	end process;
	
	clock: process is
	begin
		clk1 <= not clk1;
		wait for 5 ns;
	end process;
	
	uut: register_file
		port map(a1 => a1, a2 => a2, a3 => a3, d1 => d1, d2 => d2, d3 => d3, clk => clk1, en => '1');
	
end architecture;
	