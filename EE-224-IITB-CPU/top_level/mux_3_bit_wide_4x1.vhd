library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3_bit_wide_4x1 is
    Port (
        I0, I1, I2, I3 : in  STD_LOGIC_VECTOR(2 downto 0); 
        S              : in  STD_LOGIC_VECTOR(1 downto 0); 
        Y              : out STD_LOGIC_VECTOR(2 downto 0)  
    );
end entity mux_3_bit_wide_4x1;

architecture Behavioral of mux_3_bit_wide_4x1 is
begin
    process(I0, I1, I2, I3, S)
    begin
        case S is
            when "00" =>
                Y <= I0; 
            when "01" =>
                Y <= I1; 
            when "10" =>
                Y <= I2; 
            when "11" =>
                Y <= I3; 
            when others =>
                Y <= (others => '0'); 
        end case;
    end process;
end architecture Behavioral;

