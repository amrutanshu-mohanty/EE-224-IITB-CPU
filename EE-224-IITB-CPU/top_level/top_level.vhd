library work;
 use work.Gates.all;
library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;


entity top_level is

	-----------------------------------------------------
	-----------------------------------------------------
	--here have to decide how to write things in memory
	--how to give instructions
	--what instructions to give for demonstration
	
	--what outputs to get
	--how exactly testbench is to be visualized
	-----------------------------------------------------
	-----------------------------------------------------
	
	port(clk: in std_logic;
--		rf_a1, rf_a2: in std_logic_vector(2 downto 0);
		rf_d1, rf_d2: out std_logic_vector(15 downto 0);
		zero_v, carry_v: out std_logic;
		alu_1, alu_2, alu_result: out std_logic_vector(15 downto 0);
		alu_sel: out std_logic_vector(2 downto 0);
		p_ctr, ir_outp, t3_outp: out std_logic_vector(15 downto 0); 
		pc_en, rf_en, ir_en: out std_LOGIC);
--		reset: in std_logic);

end entity top_level;

architecture struct of top_level is


	---------------------------------------------------------
	---------------------components--------------------------
	component fsm is
	port(
		instruction: in std_logic_vector(15 downto 0);
		z: in std_logic;
		reset, clk: in std_logic;
		M0,M2,M3,M5,M6,M7,M8: out std_logic_vector(1 downto 0);
		M1,M4,M9: out std_logic;
		ALU_instr: out std_logic_vector(2 downto 0); 
		PC_en, Mem_read, Mem_write, IR_en, T1_en, T2_en, T3_en, RF_en: out std_logic
	);
 end component;
 	
	component register_16bit is
		port (p_in: in std_logic_vector(15 downto 0);
				p_out: out std_logic_vector(15 downto 0);
				clk, en: in std_logic);
	end component;
	
	component register_file is
		port (a1, a2, a3: in std_logic_vector(2 downto 0);
				d3: in std_logic_vector(15 downto 0);
				d1, d2: out std_logic_vector(15 downto 0);
				en, clk: in std_logic);
	end component;
	
	component alu is
		port(A, B: in std_logic_vector(15 downto 0);
				S: in std_logic_vector(2 downto 0);
				C: out std_logic_vector(15 downto 0);
				zero, carry: out std_logic
		);
	end component alu;
	
	component memory is
		 port (
			  clk       : in  std_logic;
			  Mem_read  : in  std_logic;
			  Mem_write : in  std_logic;
			  Mem_A_in  : in  std_logic_vector(15 downto 0);
			  Mem_D_in  : in  std_logic_vector(15 downto 0);
			  Mem_D_out : out std_logic_vector(15 downto 0)
		 );
	end component memory;
	
	component mux_16_bit_wide_2x1 is
    Port ( I0, I1 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(15 downto 0));
	end component mux_16_bit_wide_2x1;
	
	component mux_16_bit_wide_4x1 is
    Port ( I0, I1, I2, I3 : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Y : out STD_LOGIC_VECTOR(15 downto 0));
	end component mux_16_bit_wide_4x1;
	
	component ZL is 
		port (I:in std_logic_vector(7 downto 0);
				O:out std_logic_vector(15 downto 0));

	end component;
	
	component ZH is 
		port (I:in std_logic_vector(7 downto 0);
				O:out std_logic_vector(15 downto 0));

	end component;
	
	component shift1 is 

		port (I:in std_logic_vector(15 downto 0);
				O:out std_logic_vector(15 downto 0));

	end component;
	
	component SE_15_to_6 is 
		port (I:in std_logic_vector(5 downto 0);
				O:out std_logic_vector(15 downto 0));

	end component;
	
	component SE_15_to_9 is 
		port (I:in std_logic_vector(8 downto 0);
				O:out std_logic_vector(15 downto 0));

	end component;
	
	component mux_3_bit_wide_4x1 is
    Port ( I0, I1, I2, I3 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Y : out STD_LOGIC_VECTOR(2 downto 0));
	end component mux_3_bit_wide_4x1;


	
	


	
	


	
	------------------------------------------------------------
	------------------------------------------------------------
	
	-- add all sorts of muxes that are necessary
	-- currently 2x1, 4x1, 8x1 versions of 1 bit and 16 bit wide exist in this project
	
	
	-- write all the instructions into memory
	
	---------------------------------------------------------
	-----------------------signals---------------------------
	signal PC_in, PC_out: std_logic_vector(15 downto 0) := "0000000000000000";
	
	signal IR_in,IR_out:std_logic_vector(15 downto 0);
	
	signal Mem_a,Mem_d: std_logic_vector(15 downto 0);
	
	signal M4_out, M5_out, M8_out: std_logic_vector(15 downto 0);
	
	signal RF_A3:std_logic_vector(2 downto 0);
	signal RF_D3: std_logic_vector(15 downto 0);
	
	signal D1_out,D2_out: std_logic_vector(15 downto 0);
	
	signal T1_out, T2_out, T3_out, T3_in: std_logic_vector(15 downto 0);
	
	signal ALU_A_in, ALU_B_in, ALU_C_out: std_logic_vector(15 downto 0);
	
	signal ZL_out,ZH_out,SE_out1,SE_out2,SL1_out, SL2_out: std_logic_vector(15 downto 0);
	
	signal zr: std_logic;
	signal cy: std_logic;
	
	signal M0_s,M2_s,M3_s,M5_s,M6_s,M7_s,M8_s: std_logic_vector(1 downto 0);
	signal M1_s,M4_s,M9_s: std_logic;
	
	signal ALU_instr_s: std_logic_vector(2 downto 0); 
	signal PC_en_s, Mem_read_s, Mem_write_s, IR_en_s, T1_en_s, T2_en_s, T3_en_s, RF_en_s: std_logic;
	
	
	
	
	
	---------------------------------------------------------
	---------------------------------------------------------
	
begin
	-- one reg file
	-- one alu
	-- one memory
	-- 3 temporary reg
	-- one instruction reg
	-- one pc
	-- one fsm
	-- thousands of muxes
	
	--muxes level 
	carry_v <= cy;
	zero_v <= zr;
	M0: mux_16_bit_wide_4x1 port map (S => M0_s, I0 => D2_out, I1 => ALU_C_out, I2 => PC_out , I3 => D1_out, Y => PC_in);
	M1: mux_16_bit_wide_2x1 port map (S => M1_s, I0 => PC_out, I1 => T3_out, Y => Mem_a);
	M2: mux_3_bit_wide_4x1 port map (S => M2_s, I0 => IR_out(5 downto 3), I1 => IR_out(11 downto 9), I2 => IR_out(8 downto 6), I3 => "000", Y => RF_A3);
	M3: mux_16_bit_wide_4x1 port map (S => M3_s, I0 => "0000000000000000", I1 => T3_out, I2 => M4_out, I3 => T1_out, Y => RF_D3);
	M4: mux_16_bit_wide_2x1 port map (S => M4_s, I0 => ZL_out, I1 => ZH_out, Y => M4_out);
	M5: mux_16_bit_wide_4x1 port map (S => M5_s, I0 => "0000000000000000", I1 => PC_out, I2 => Mem_d, I3 => D1_out, Y => M5_out);
	M6: mux_16_bit_wide_4x1 port map (S => M6_s, I0 => T3_out, I1 => PC_out, I2 => T1_out, I3 => T2_out, Y => ALU_A_in);
	M7: mux_16_bit_wide_4x1 port map (S => M7_s, I0 => "0000000000000010", I1 => T2_out, I2 => "0000000000000000", I3 => M8_out, Y => ALU_B_in);
	M8: mux_16_bit_wide_4x1 port map (S => M8_s, I0 => SE_out1, I1 => SL1_out, I2 => SL2_out, I3 => "0000000000000000" , Y => M8_out);
	M9: mux_16_bit_wide_2x1 port map (S => M9_s, I0 => ALU_C_out, I1 =>PC_out , Y => T3_in);	
	
	PC: register_16bit port map(p_in => PC_in, clk => clk, en => PC_en_s, p_out => PC_out);
	IR: register_16bit port map(p_in => Mem_d, clk => clk, en => IR_en_s, p_out => IR_out);
	T1: register_16bit port map(p_in => M5_out, clk => clk, en => T1_en_s, p_out => T1_out);
	T2: register_16bit port map(p_in => D2_out, clk => clk, en => T2_en_s, p_out => T2_out);
	T3: register_16bit port map(p_in => T3_in , clk => clk, en => T3_en_s, p_out => T3_out);
	
	ZL0: ZL port map (I => IR_out(7 downto 0), O => ZL_out);
	ZH0: ZH port map (I => IR_out(7 downto 0), O => ZH_out);
	SE1: SE_15_to_6 port map (I => IR_out(5 downto 0), O => SE_out1);
	SE2: SE_15_to_9 port map (I => IR_out(8 downto 0), O => SE_out2);
	SL1: shift1 port map (I => SE_out1, O => SL1_out);
	SL2: shift1 port map (I => SE_out2, O => SL2_out);
	
	
	mem: memory port map(
			  clk => clk,
			  Mem_read => Mem_read_s,
			  Mem_write => Mem_write_s,
			  Mem_A_in => Mem_a,
			  Mem_D_in => T1_out,
			  Mem_D_out => Mem_d
			);
	
	alu_one: alu port map(A => ALU_A_in , B => ALU_B_in, S => ALU_instr_s, C => ALU_C_out , zero => zr, carry => cy);
	
	reg_file: register_file port map(
						a1 => IR_out(11 downto 9),
						a2 => IR_out(8 downto 6),
						a3 => RF_A3,
						d3 => RF_D3,
						d1 => D1_out, 
						d2 => D2_out,
						en => RF_en_s, 
						clk => clk
				);
				
	controller: fsm port map(
				instruction => IR_out,
				z => zr,
				reset => '0',
				clk => clk,
				M0=> M0_s ,
				M1=> M1_s,
				M2=>M2_s,
				M3=>M3_s,
				M4=>M4_s,
				M5=>M5_s,
				M6=>M6_s,
				M7=>M7_s,
				M8=>M8_s,
				M9=>M9_s,
				ALU_instr => ALU_instr_s,
				PC_en => PC_en_s,
				Mem_read => Mem_read_s, 
				Mem_write => Mem_write_s,
				IR_en => IR_en_s,
				T1_en => T1_en_s,
				T2_en => T2_en_s, 
				T3_en => T3_en_s, 
				RF_en => RF_en_s
			);
			
	alu_1 <= ALU_A_in;
	alu_2 <= ALU_B_in;
	alu_result <= ALU_C_out;
	alu_sel <= ALU_instr_s;
	zero_v <= zr;
	
	p_ctr <= PC_out;
	rf_d1 <= D1_out;
	rf_d2 <= D2_out;
	
	pc_en <= PC_en_s;
	ir_en <= IR_en_s;
	rf_en <= RF_en_s;
	
	ir_outp <= IR_out;
	t3_outp <= T3_out;
	
end struct;