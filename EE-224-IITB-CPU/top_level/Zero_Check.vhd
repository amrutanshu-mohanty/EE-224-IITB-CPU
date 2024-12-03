library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Gates.all;

entity Zero_Check is
    port(
        A : in std_logic_vector(15 downto 0); 
        y : out std_logic               
    );
end entity Zero_Check;

architecture struct of Zero_Check is
    signal temp : std_logic_vector(15 downto 0);
begin
    temp(0) <= A(0);
    inst1: for i in 1 to 15 generate
        begin
            or1: OR_2 port map(A(i), temp(i - 1), temp(i));
        end generate;
    inst2: INVERTER port map(temp(15), y); 
end struct;
