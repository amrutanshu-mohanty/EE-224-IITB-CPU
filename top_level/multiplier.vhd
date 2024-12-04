library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
	port(A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0)
	);
end entity multiplier;

architecture struct of multiplier is
	signal b0, b1, b2, b3, t0, t1, t2, t3, s1, s2, c0, c1, c2, c3: std_logic_vector(15 downto 0);
	signal c01, c02, c03: std_logic;
	
	component kogge_stone is
    port(A, B: in std_logic_vector(15 downto 0);
            c_in: in std_logic;
            sum : out std_logic_vector(15 downto 0);
            carry: out std_logic);
	end component;
	
	component AND_16 is
	port (A, B: in std_logic_vector(15 downto 0);
			C: out std_logic_vector(15 downto 0));
	end component;
	
begin

	b0 <= (others => B(0));
	b1 <= (others => B(1));
	b2 <= (others => B(2));
	b3 <= (others => B(3));
	and0: AND_16 port map(A, b0, t0);
	and1: AND_16 port map(A, b1, t1);
	and2: AND_16 port map(A, b2, t2);
	and3: AND_16 port map(A, b3, t3);
	
	inst2: for i in 0 to 3 generate
		c0(i) <= t0(i);
		c1(i+1) <= t1(i);
		c2(i+2) <= t2(i);
		c3(i+3) <= t3(i);
	end generate;
	c0(15 downto 4) <= (others => '0');
	c1(15 downto 5) <= (others => '0');
	c2(15 downto 6) <= (others => '0');
	c3(15 downto 7) <= (others => '0');
	c1(0) <= '0';
	c2(1 downto 0) <= "00";
	c3(2 downto 0) <= "000";
	
	-- now that all shifted and sign extended things have been created, we can simply add all these
	
	kogge1: kogge_stone port map(c0, c1, '0', s1, c01);
	kogge2: kogge_stone port map(s1, c2, '0', s2, c02);
	kogge3: kogge_stone port map(s2, c3, '0', C, c03);
end struct;