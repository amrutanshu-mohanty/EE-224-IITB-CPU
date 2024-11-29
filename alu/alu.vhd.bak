library ieee;
use ieee.std_logic_1164.all;
 
entity alu_beh is
	port (
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		sel: in std_logic_vector(1 downto 0);
		op: out std_logic_vector(7 downto 0)
	);
end alu_beh;
 
architecture a1 of alu_beh is
 
	function sub(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
		return std_logic_vector is
			-- declaring and initializing variables using aggregates
			variable diff : std_logic_vector(7 downto 0):=(others =>'0');
			variable carry: std_logic_vector(7 downto 0):=(others =>'0');
		begin
			-- Hint: Use for loop to calculate value of "diff" and "carry" variable
			-- Use aggregates to assign values to multiple bits
			for i in 0 to 3 loop
            diff(i) := A(i) xor B(i) xor carry(i);
				carry(i+1) := ((not A(i)) and B(i)) or ((not (A(i) xor B(i))) and carry(i));
         end loop;
			if carry(4) = '1' then 
				diff(7 downto 4) := "1111";
			else 
				diff(7 downto 4) := "0000";
			end if;
			return diff;
	end sub;
	
	function shift(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
		return std_logic_vector is
			-- declaring and initializing variables using aggregates
			variable final_result : std_logic_vector(7 downto 0):=(others =>'0');
			variable result : std_logic_vector(3 downto 0):=(others =>'0');
		begin
			result := A;
			-- shift by 2 and shift by 1
			if B(3) = '1' then
				-- shifting to the right, so we use to instead of downto
				if B(1) = '1' then
					for i in 2 to 3 loop
						result(i-2) := result(i);
						result(i) := '0';
					end loop;
				end if;
				
				if B(0) = '1' then
					for i in 1 to 3 loop
						result(i-1) := result(i);
						result(i) := '0';
					end loop;
				end if;
			else
				if B(1) = '1' then
					for i in 1 downto 0 loop
						result(i+2) := result(i);
						result(i) := '0';
					end loop;
				end if;
				
				if B(0) = '1' then
					for i in 2 downto 0 loop
						result(i+1) := result(i);
						result(i) := '0';
					end loop;
				end if;
			end if;
			
			final_result := "0000" & result;
			return final_result;
	end shift;
	
begin
	alu : process(A, B, sel)
		-- complete VHDL code for various outputs of ALU based on select lines
		-- Hint: use if/else statement--
		-- sub function usage :
		-- signal_name <= sub(A,B)
		-- variable_name := sub(A,B)
		--
		-- concatenate operator usage:
		-- "0000" & A
	begin
		if (sel = "00") then
			-- concatenate
			op <= A & B;
		elsif (sel = "01") then
			-- subtract
			op <= sub(A, B);
		elsif (sel = "10") then
			-- xor
			op <= "0000" & (A xor B);
		else
			-- shift
			op <= shift(A, B);
		end if;
	end process; --alu
end a1; -- a1