----------------------------------------------------------------------------------
--											    Integrantes:										  --
--							        Juan camilo pelaez Martinez 						     --
--										  Cesar Augusto Morales 		         			  --
--								       Sebastian Londoño marin		    					  --
--																										  --
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Multi_32b is
    Port ( mul_int1 : in  STD_LOGIC_VECTOR (31 downto 0);
           mul_int2 : in  STD_LOGIC_VECTOR (31 downto 0);
           clk_mul : in  STD_LOGIC;
           mul_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Multi_32b;

architecture Behavioral of Multi_32b is

begin
--
process (mul_int1,mul_int2, clk_mul)
	begin
	
		if (clk_mul = '0') then
			mul_out <= mul_int1;-- entra int1 o int2
		else
			mul_out <= mul_int2;
		end if;
	
	end process;

end Behavioral;

