library ieee;
use ieee.std_logic_1164.all;

entity ZL is 
	port (I: in std_logic_vector(7 downto 0);
			O: out std_logic_vector(15 downto 0));

end entity;

architecture struct of ZL is 

begin 

O <= I & "00000000";

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity ZH is 
	port (I: in std_logic_vector(7 downto 0);
			O: out std_logic_vector(15 downto 0));

end entity;

architecture struct of ZH is 

begin 

O <= "00000000" & I;

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity SE_15_to_6 is 
	port (I: in std_logic_vector(5 downto 0);
			O: out std_logic_vector(15 downto 0));

end entity;

architecture struct of SE_15_to_6 is 

signal MSB:std_logic;

begin 

MSB <= I(5);

O <= MSB & MSB & MSB & MSB & MSB & MSB & MSB & MSB & MSB & MSB & I;

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity SE_15_to_9 is 
	port (I: in std_logic_vector(8 downto 0);
			O: out std_logic_vector(15 downto 0));

end entity;

architecture struct of SE_15_to_9 is 

signal MSB:std_logic;

begin 

MSB <= I(8);

O <= MSB & MSB & MSB & MSB & MSB & MSB & MSB & I;

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity shift1 is 

	port (I: in std_logic_vector(15 downto 0);
			O: out std_logic_vector(15 downto 0));

end entity;

architecture struct of shift1 is 

begin 

O <= I(14 downto 0) & '0'; 


end architecture;
