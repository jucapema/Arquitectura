LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ExtenSigno IS
END tb_ExtenSigno;
 
ARCHITECTURE behavior OF tb_ExtenSigno IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ExtenSigno
    PORT(
         Inmediato : IN  std_logic_vector(12 downto 0);
         Out_Exten : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Inmediato : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Out_Exten : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name  
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ExtenSigno PORT MAP (
          Inmediato => Inmediato,
          Out_Exten => Out_Exten
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Inmediato <= "0111111111111";
      wait for 100 ns;
		Inmediato <= "1001111111111";
      wait for 100 ns;		
		Inmediato <= "0000011111111";
      wait for 100 ns;
		Inmediato <= "1000011111111";
      wait for 100 ns;

      wait;
   end process;

END;