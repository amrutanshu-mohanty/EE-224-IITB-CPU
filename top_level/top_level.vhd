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
		Reg_A: out std_logic(15 downto 0)
	);
end entity top_level;

architecture struct of top_level is


	---------------------------------------------------------
	---------------------components--------------------------
	component fsm is
		port(
			instruction: in std_logic_vector(15 downto 0);
			reset, clk: in std_logic;
			M: out std_logic_vector(10 downto 0);
			ALU_instr: out std_logic_vector(2 downto 0); 
			PC_en, Mem_read, Mem_write, IR_en, T1_en, T2_en, T3_en, RF_en: out std_logic
		);
	end fsm;
	
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
	end memory;
	
	------------------------------------------------------------
	------------------------------------------------------------
	
	-- add all sorts of muxes that are necessary
	-- currently 2x1, 4x1, 8x1 versions of 1 bit and 16 bit wide exist in this project
	
	
	-- write all the instructions into memory
	
	---------------------------------------------------------
	-----------------------signals---------------------------
	
	
	
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
	
	PC: register_16bit port map(p_in => , clk => clk, en => PC_en, p_out => );
	IR: register_16bit port map(p_in => , clk => clk, en => IR_en, p_out => );
	T1: register_16bit port map(p_in => , clk => clk, en => T1_en, p_out => );
	T2: register_16bit port map(p_in => , clk => clk, en => T2_en, p_out => );
	T3: register_16bit port map(p_in => , clk => clk, en => T3_en, p_out => );
	
	mem: memory port map(
			  clk => clk,
			  Mem_read => ,
			  Mem_write => ,
			  Mem_A_in => ,
			  Mem_D_in => ,
			  Mem_D_out => 
			);
	
	alu_one: alu port map(A => , B => , S => , C => , zero => , carry => );
	
	reg_file: register_file port map(
						a1 => ,
						a2 => ,
						a3 => ,
						d3 => ,
						d1 => , 
						d2 => ,
						en => RF_en, 
						clk => clk
				);
				
	controller: fsm port map(
				instruction => ,
				reset => '0',
				clk => clk,
				M => ,
				ALU_instr => ,
				PC_en => ,
				Mem_read => , 
				Mem_write => ,
				IR_en => ,
				T1_en => ,
				T2_en => , 
				T3_en => , 
				RF_en => 
			);
	
end struct;