library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;

architecture arch of Testbench is
--signal alu_z, alu_car,  pc_en, ir_en, rf_en, rst_sync: std_logic := '0';
signal clk, rst: std_logic := '0';
--signal d1, d2, pc, alu_a, alu_b, alu_c, ir_out, t3_out, t1_out, t2_out: std_logic_vector(15 downto 0) := "0000000000000000";
--signal alu_sel: std_logic_vector(2 downto 0) := "000";

component top_level is
	port(reset, clk: in std_logic);
--		sync_reset: out std_logic
--		rf_d1, rf_d2: out std_logic_vector(15 downto 0);
--		zero_v, carry_v,
--		alu_1, alu_2, alu_result: out std_logic_vector(15 downto 0);
--		alu_sel: out std_logic_vector(2 downto 0);
--		p_ctr, ir_outp, t3_outp, t1_outp, t2_outp: out std_logic_vector(15 downto 0); 
--		pc_en, rf_en, ir_en: out std_LOGIC);
end component;

begin
	
	clock: process is
	begin
		wait for 10 ns;
		clk <= not clk;
	end process;
	
--	reset: process is
--	begin
--		wait for 75 ns;
--		rst <= '1';
--		wait for 20 ns;
--		rst <= '0';
--		wait;
--	end process;
	
	uut: top_level
		port map(clk => clk, 
--					rf_d1 => d1, rf_d2 => d2, zero_v => alu_z, carry_v => alu_car, alu_1 => alu_a, alu_2 => alu_b, alu_result => alu_c, alu_sel => alu_sel, p_ctr => pc,
--					ir_en => ir_en, rf_en => rf_en, pc_en => pc_en, ir_outp => ir_out, t3_outp => t3_out, t2_outp => t2_out, t1_outp => t1_out, 
					reset => rst
--					sync_reset => rst_sync
					);
	
end architecture;
	