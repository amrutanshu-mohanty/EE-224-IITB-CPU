library work;
use work.Gates.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kogge_stone is
    port(A, B: in std_logic_vector(15 downto 0);
            c_in: in std_logic;
            sum : out std_logic_vector(15 downto 0);
            carry: out std_logic);
end entity kogge_stone;

architecture struct of kogge_stone is
    signal q, g, p, g1, p1, t1, g2, p2, t2, g3, p3, t3, g4, p4, t4: std_logic_vector(15 downto 0);
    signal carry_temp: std_logic_vector(16 downto 0) := "00000000000000000";
    -- at each level (say nth level), 2^(n-1) circles won't be there
    component XOR_16 is
        port (A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0));
    end component XOR_16;
    
    component AND_16 is
        port (A, B: in std_logic_vector(15 downto 0);
            C: out std_logic_vector(15 downto 0));
    end component AND_16;
	 
	 component AND_2 is
		port (A, B: in std_logic; Y: out std_logic);
	 end component AND_2;

    component OR_2 is
		port (A, B: in std_logic; Y: out std_logic);
    end component OR_2;
begin
    -- pre-processing
    and_1: AND_16 port map(A, B, g);
    xor_1: XOR_16 port map(A, B, p);

    -- processing
	 
	 level1: for j in 15 downto 1 generate
			and_3: AND_2 port map(g(j-1), p(j), t1(j));
			and_4: AND_2 port map(p(j-1), p(j), p1(j));
			or_1: OR_2 port map(t1(j), g(j), g1(j));
	 end generate;
	 g1(0 downto 0) <= g(0 downto 0);
    p1(0 downto 0) <= p(0 downto 0);

	 level2: for j in 15 downto 2 generate
			and_5: AND_2 port map(g1(j-2), p1(j), t2(j));
			and_6: AND_2 port map(p1(j-2), p1(j), p2(j));
			or_2a: OR_2 port map(t2(j), g1(j), g2(j));
	 end generate;
	 g2(1 downto 0) <= g1(1 downto 0);
    p2(1 downto 0) <= p1(1 downto 0);
	 
	 level3: for j in 15 downto 4 generate
			and_7: AND_2 port map(g2(j-4), p2(j), t3(j));
			and_8: AND_2 port map(p2(j-4), p2(j), p3(j));
			or_3: OR_2 port map(t3(j), g2(j), g3(j));
	 end generate;
	 g3(3 downto 0) <= g2(3 downto 0);
    p3(3 downto 0) <= p2(3 downto 0);
	 
	 level4: for j in 15 downto 8 generate
			and_9: AND_2 port map(g3(j-8), p3(j), t4(j)); 
			and_10: AND_2 port map(p3(j-8), p3(j), p4(j));
			or_4: OR_2 port map(t4(j), g3(j), g4(j));
	 end generate;
	 g4(7 downto 0) <= g3(7 downto 0);
    p4(7 downto 0) <= p3(7 downto 0);
	 
	 
    -- post-processing
    carry_temp(0) <= c_in;
    post: for j in 0 to 15 generate
        xor_3 : XOR_2 port map(p(j), carry_temp(j), sum(j));
        and_11: AND_2 port map(p4(j), c_in, q(j));
		  or_5: OR_2 port map(q(j), g4(j), carry_temp(j+1));
    end generate;
    carry <= carry_temp(16);
end struct;
