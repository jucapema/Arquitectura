----------------------------------------------------------------------------------
--											    Integrantes:										  --
--							        Juan camilo pelaez Martinez 						     --
--										  Cesar Augusto Morales 		         			  --
--								       Sebastian Londoño marin		    					  --
--																										  --
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Tb_RegFile IS
END Tb_RegFile;
 
ARCHITECTURE behavior OF Tb_RegFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegFile
    PORT(
         reset : IN  std_logic;
         regfileSource1 : IN  std_logic_vector(4 downto 0);
         regfileSource2 : IN  std_logic_vector(4 downto 0);
         RegFileDesti : IN  std_logic_vector(4 downto 0);
         dtaToWrite : IN  std_logic_vector(31 downto 0);
         contRegfileSource1 : OUT  std_logic_vector(31 downto 0);
         contRegfileSource2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal regfileSource1 : std_logic_vector(4 downto 0) := (others => '0');
   signal regfileSource2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RegFileDesti : std_logic_vector(4 downto 0) := (others => '0');
   signal dtaToWrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal contRegfileSource1 : std_logic_vector(31 downto 0);
   signal contRegfileSource2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile PORT MAP (
          reset => reset,
          regfileSource1 => regfileSource1,
          regfileSource2 => regfileSource2,
          RegFileDesti => RegFileDesti,
          dtaToWrite => dtaToWrite,
          contRegfileSource1 => contRegfileSource1,
          contRegfileSource2 => contRegfileSource2
        );


   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '0';
		regfileSource1 <= "00010";
		regfileSource2 <= "00100";
		RegFileDesti <= "00001";
		dtaToWrite <= "00000000000000000000000000000111";
		wait for 100 ns;

   end process;

END;
