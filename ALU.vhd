library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
--Hace operaciones aritmeticas y logicas

begin
	process(x,y,ALUOp)-- siempre se utiliza si se hace un if 
	--dibujo x , y
	--aluop=dato que viene de la unidad de control que le dice a la alu que operacion realiza
	begin
	   case (ALUOp) is 
	             -- el binario tiene que estar tal cualcomo en la unidad de control Uc
			when "000001" => -- Add  
				ALUResult <= x + y;
			when "000010" => -- Sub
				ALUResult <= x - y;
			when "000011" => -- And
				ALUResult <= x and y;
			when "000100" => -- Nand
				ALUResult <= x nand y;
			when "000101" => -- Or
				ALUResult <= x or y;
			when "000110" => -- Nor
				ALUResult <= x nor y;
			when "000111" => -- Xor
				ALUResult <= x xor y;
			when "001000" => -- Xnor
				ALUResult <= x xnor y;
			when others => 
				ALUResult <= (others=>'0');-- Si es diferente de los bits anteriores todo se vuelve 0
		end case;
	end process;

end Behavioral;
