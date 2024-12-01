library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 
 entity fsm is
	port(
		instruction: in std_logic_vector(15 downto 0);
		reset, clk: in std_logic;
		M: out std_logic_vector(10 downto 0);
		ALU_instr: out std_logic_vector(2 downto 0); 
		PC_en, Mem_read, Mem_write, IR_en, T1_en, T2_en, T3_en, RF_en: out std_logic
	);
 end fsm;
 
 architecture bhv of fsm is
	type state is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21);

	signal y_present, y_next: state := s0;
	signal opcode: integer;
	
begin
	---------------clock process-----------------------
	---------------------------------------------------
	clock_proc : process(y_next, y_present, reset, clk)
	begin
		if(reset = '1') then
			y_present <= s0;
		else
			if falling_edge(clk) then
				y_present <= y_next;
			else
				y_present <= y_present;
			end if;
		end if;
	end process;
	
	
	-----converting opcode to integer
	opcode <= to_integer(unsigned(instruction(15 downto 12)));
	
	------------state transition process---------------
	---------------------------------------------------	
	state_transition_proc:process(y_present, opcode)
	begin
	case y_present is
	
		when s0 =>
			if((opcode < 7) or ((opcode > 8) and (opcode < 12))) then
				y_next <= s1;
			elsif(opcode = 7) then
				y_next <= s11;
			elsif(opcode = 8) then
				y_next <= s12;
			elsif((opcode = 12) or (opcode = 13)) then
				y_next <= s19;
			elsif(opcode = 14) then
				y_next <= s20;
			else
				y_next <= s0;
			end if;
		
		when s1 =>
			if(opcode = 0) then
				y_next <= s2;
			elsif(opcode = 1) then
				y_next <= s4;
			elsif(opcode = 2) then
				y_next <= s5;
			elsif(opcode = 3) then
				y_next <= s6;
			elsif(opcode = 4) then
				y_next <= s8;
			elsif(opcode = 5) then
				y_next <= s9;
			elsif(opcode = 6) then
				y_next <= s10;
			elsif((opcode = 9) or (opcode = 10)) then
				y_next <= s13;
			elsif(opcode = 11) then
				y_next <= s17;
			else
				y_next <= s0;
			end if;
		
		when s2 =>
			y_next <= s3;
		
		when s3 =>
			y_next <= s0;
		
		when s4 =>
			y_next <= s3;
		
		when s5 =>
			y_next <= s3;
		
		when s6 =>
			y_next <= s7;
		
		when s7 =>
			y_next <= s0;
		
		when s8 =>
			y_next <= s3;
		
		when s9 =>
			y_next <= s3;
		
		when s10 =>
			y_next <= s3;
		
		when s11 =>
			y_next <= s0;
		
		when s12 =>
			y_next <= s0;
		
		when s13 =>
			if(opcode = 9) then
				y_next <= s14;
			elsif(opcode = 10) then
				y_next <= s16;
			else
				y_next <= s0;
			end if;
		
		when s14 =>
			y_next <= s15;
		
		when s15 =>
			y_next <= s0;
		
		when s16 =>
			y_next <= s0;
		
		when s17 =>
			y_next <= s18;
		
		when s18 =>
			y_next <= s0;
		
		when s19 =>
			if(opcode = 12) then
				y_next <= s20;
			elsif(opcode = 13) then
				y_next <= s21;
			else
				y_next <= s0;
			end if;
		
		when s20 =>
			y_next <= s0;
		
		when s21 =>
			y_next <= s0;
		
		
		end case;
	end process;
	
	
	----------------output process---------------------
	---------------------------------------------------
	output_proc:process(y_present)
	begin
	-- moore machine
		case y_present is
		
			when s0 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s1 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s2 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s3 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s4 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
							
			when s5 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s6 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s7 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s8 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';

			when s9 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s10 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s11 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';

			when s12 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s13 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s14 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
	
			when s15 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s16 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';

			when s17 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s18 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s19 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
			when s20 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';

			when s21 => 
				M <= "00000000000";
				ALU_instr <= "000";
				PC_en <= '1';
				Mem_read <= '1';
				Mem_write <= '1';
				IR_en <= '1';
				T1_en <= '1';
				T2_en <= '1';
				T3_en <= '1';
				RF_en <= '1';
				
		end case;
		
	end process;
	
end architecture;