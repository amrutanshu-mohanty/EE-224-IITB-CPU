library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

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
    type memory_array is array(0 to 65535) of std_logic_vector(7 downto 0);
    signal Mem : memory_array := (others => (others => '0'));
    signal addr: integer;
begin
    addr <= to_integer(unsigned(Mem_A_in));

    process(clk, Mem_D_in, Mem_write, Mem_read)
    begin
        if rising_edge(clk) then
            if Mem_write = '1' then
                Mem(addr) <= Mem_D_in(15 downto 8);
                Mem(addr + 1) <= Mem_D_in(7 downto 0);
            elsif Mem_read = '1' then
                Mem_D_out(15 downto 8) <= Mem(addr);
                Mem_D_out(7 downto 0) <= Mem(addr + 1);
            end if;
        end if;
    end process;
end Behavioral;
