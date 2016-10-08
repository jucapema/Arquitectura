LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         ALUOp : IN  std_logic_vector(5 downto 0);
         x : IN  std_logic_vector(31 downto 0);
         y : IN  std_logic_vector(31 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOp : std_logic_vector(5 downto 0) := (others => '0');
   signal x : std_logic_vector(31 downto 0) := (others => '0');
   signal y : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ALUOp => ALUOp,
          x => x,
          y => y,
          ALUResult => ALUResult
        );
		  
   -- Stimulus process
   stim_proc: process
   begin			  
	     -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		x <= x"0000002A";-- entrada sera esa 
		y <= x"0000000F";
		 
      -- insert stimulus here 
		ALUOp <= "000001";-- igual los bits el valor que varia 
		wait for 100 ns;
	
		ALUOp <= "000010";
		wait for 100 ns;
		
		ALUOp <= "000011";
		wait for 100 ns;
		
		ALUOp <= "000100";
		wait for 100 ns;
		
		ALUOp <= "000101";
		wait for 100 ns;
		
		ALUOp <= "000110";
		wait for 100 ns;
		
		ALUOp <= "000111";
		wait for 100 ns;
		
		ALUOp <= "001000";
      wait;
   end process;

END;