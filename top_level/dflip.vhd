library ieee;
use ieee.std_logic_1164.all;

entity dflip is 
	port (d, clock, set, reset:in std_logic;
			q: out std_logic);
end entity;


architecture struct of dflip is 

signal q_int: std_logic := '0';
begin 
	clock_process: process(clock, reset, set) is
	begin
		if reset = '1' then 
			q_int <= '0';
		elsif set = '1' then 
			q_int <= '1';
		elsif rising_edge(clock) then 
			q_int <= d;
		end if;
	end process;

q <= q_int;
end architecture;
 