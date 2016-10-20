library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtenSigno is
    Port ( Inmediato : in  STD_LOGIC_VECTOR (12 downto 0);
           Out_Exten : out  STD_LOGIC_VECTOR (31 downto 0));
end ExtenSigno;

architecture Behavioral of ExtenSigno is

begin
--extencion de signo , si el ultimo termina 0 rellena todos los numeros a la izq lo mismo en 1 todo a la izq en 1
process (Inmediato)
	begin
		Out_Exten(12 downto 0) <= Inmediato;
		if(Inmediato(12) = '0')then
			Out_Exten (31 downto 13) <= (others=>'0');
		else
			Out_Exten(31 downto 13) <= (others=>'1');
		end if;		
	
	end process;

end Behavioral;

