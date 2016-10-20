library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CU_out : out  STD_LOGIC_VECTOR (3 downto 0));
end CU;

architecture Behavioral of CU is

begin

	process (Op, Op3)	
	begin
	-- op siempre sera 10 
	-- op3 siempre lo dan cuaderno 
		if(op = "10") then
			case (Op3) is
				when("000000") =>
				--indica a la unidad de control que operacion se hace 
					CU_out <= "0001"; -- Add
				when("000100") =>
					CU_out <= "0010"; -- Sub
				when("000001") =>
					CU_out <= "0011"; -- And
				when("000101") =>
					CU_out <= "0100"; -- Nand
				when("000010") =>
					CU_out <= "0101"; -- Or	
				when("000110") =>
					CU_out <= "0110"; -- Nor
				when("000011") =>
					CU_out <= "0111"; -- Xor
				when("000111") =>
					CU_out <= "1000"; -- Xnor				
				when others =>
					CU_out <= "0000";
			end case;
		end if;
	end process;

end Behavioral;