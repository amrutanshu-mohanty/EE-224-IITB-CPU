library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    type memory_array is array(0 to 128) of std_logic_vector(7 downto 0);
    signal Mem : memory_array := (
						0 => "10100000",
						1 => "01010000",     --Load binary Reg B + 16 th memory address onto Reg A
						16 => "10010010",
						17 => "00000011",
						others => (others => '0'));
    signal addr: integer;
	 signal mem_out: std_logic_vector(15 downto 0);
begin
    addr <= to_integer(unsigned(Mem_A_in));
	 --mem_out <= Mem(addr) & Mem(addr+1);
--    process(clk, Mem_D_in, Mem_write, Mem_read, Mem)
--    begin
--			
--        if rising_edge(clk) then
--            if Mem_write = '1' then
--                Mem(addr) <= Mem_D_in(15 downto 8);
--                Mem(addr + 1) <= Mem_D_in(7 downto 0);
--				else
--					Mem(addr) <= Mem(addr);
--				end if;
--			elsif falling_edge(clk) then
--				if Mem_read = '1' then
--					Mem_D_out(15 downto 8) <= Mem(addr);
--					Mem_D_out(7 downto 0) <= Mem(addr + 1);
--			  --else
--				  --Mem_D_out <= mem_out;
--				end if;
--			else
--				Mem_D_out <= Mem(addr) & Mem(addr+1);
--		  end if;
--
--    end process;

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
