--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY tb_Sum32b IS
END tb_Sum32b;
 
ARCHITECTURE behavior OF tb_Sum32b IS 
 
 
    COMPONENT Sum32b
    PORT(
         x : IN  std_logic_vector(31 downto 0);
         y : IN  std_logic_vector(31 downto 0);
         add_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(31 downto 0) := (others => '0');
   signal y : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal add_out : std_logic_vector(31 downto 0);
  
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum32b PORT MAP (
          x => x,
          y => y,
          add_out => add_out
        );



      -- insert stimulus here    -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		x <= "00000000000000000000000000000001";
		y <= "00000000000000000000000000000010";
      wait for 100 ns;
		x <= "00000000000000000000000000000010";
		y <= "00000000000000000000000000000011";
      wait for 100 ns;	
		x <= "00000000000000000000000000001000";
		y <= "00000000000000000000000000000101";
      wait for 100 ns;		
      
      wait;
   end process;
END;
