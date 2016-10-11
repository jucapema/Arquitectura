LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_npc IS
END tb_npc;
 
ARCHITECTURE behavior OF tb_npc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT npc
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         intNPC : IN  std_logic_vector(31 downto 0);
         outNPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal intNPC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal outNPC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: npc PORT MAP (
          clk => clk,
          reset => reset,
          intNPC => intNPC,
          outNPC => outNPC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;	
		reset <= '0'; 
		intNPC <= x"00000001";       
		wait for 20 ns;
		intNPC <= x"0000000A";
		wait for 20 ns;
		intNPC <= x"00000010";
		wait for 20 ns;
		reset <= '0'; 
      wait;
   end process;

END;