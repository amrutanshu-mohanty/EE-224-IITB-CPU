library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity memory is
    port (
        clk       : in  std_logic;
        Mem_read  : in  std_logic;
        Mem_write : in  std_logic;
        Mem_A_in  : in  std_logic_vector(15 downto 0);
        Mem_D_in  : in  std_logic_vector(15 downto 0);
        Mem_D_out : out std_logic_vector(15 downto 0)
    );
end memory;

architecture Behavioral of memory is
    type memory_array is array(0 to 511) of std_logic_vector(7 downto 0);
	 impure function init_memory return memory_array is
		file textfile : text open read_mode is "D:\IITB\Year2\Semester3\EE214\EE-224-IITB-CPU_v10\EE-224-IITB-CPU\Testbench\MEM_INITIALIZATION.txt";
		variable textline : line;
		variable mem_content : memory_array;
		begin
			for i in 0 to 511 loop
				readline(textfile, textline);
				read(textline, mem_content(i));
			end loop;
		return mem_content;
	 end function;
    signal Mem : memory_array := init_memory;
    signal addr: integer;
	 signal mem_out: std_logic_vector(15 downto 0);

begin

    addr <= to_integer(unsigned(Mem_A_in));
	 

    process(clk)
    begin
        if rising_edge(clk) then
            if Mem_write = '1' then
                Mem(addr) <= Mem_D_in(15 downto 8);
                Mem(addr + 1) <= Mem_D_in(7 downto 0);
            end if;
        end if;
    end process;

    process(Mem_read, Mem_A_in, addr)
    begin
        if Mem_read = '1' then
            Mem_D_out(15 downto 8) <= Mem(addr);
            Mem_D_out(7 downto 0) <= Mem(addr + 1);
        else
            Mem_D_out <= (others => '0');
        end if;
    end process;

end Behavioral;
