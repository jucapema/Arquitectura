----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           pc_int : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
--dice cual es la instruccion actual 
process (clk, rst, pc_int)
	begin
		if (rst = '1') then
			pc_out <= (others => '0');
		else
			if(rising_edge(clk)) then
				pc_out <= pc_int;
			end if;
		end if;
end process;

end Behavioral;

