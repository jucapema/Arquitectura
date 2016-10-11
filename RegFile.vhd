----------------------------------------------------------------------------------
--											    Integrantes:										  --
--							        Juan camilo pelaez Martinez 						     --
--										  Cesar Augusto Morales 		         			  --
--								       Sebastian Londoño marin		    					  --
--																										  --
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RegFile is
    Port ( reset : in  STD_LOGIC;
           regfileSource1 : in  STD_LOGIC_VECTOR (4 downto 0);
           regfileSource2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RegFileDesti : in  STD_LOGIC_VECTOR (4 downto 0);
           dtaToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           contRegfileSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contRegfileSource2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegFile;

architecture Behavioral of RegFile is

	type ram is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registro : ram :=(others => x"00000000");

begin
	process(reset,regfileSource1,regfileSource2,RegFileDesti,dtaToWrite)--clkFPGA)
	begin
			registro(0) <= x"00000000";
			if(reset = '1')then
				contRegfileSource1 <= (others=>'0');
				contRegfileSource2 <= (others=>'0');
				registro <= (others => x"00000000");
				
			else
				contRegfileSource1 <= registro(conv_integer(regfileSource1));
				contRegfileSource2 <= registro(conv_integer(regfileSource2));
				if(RegFileDesti /= "00000")then
					registro(conv_integer(RegFileDesti)) <= dtaToWrite;
				end if;
			end if;
	end process;

end Behavioral;
