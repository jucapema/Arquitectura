--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_ProgramCounter IS
END tb_ProgramCounter;
 
ARCHITECTURE behavior OF tb_ProgramCounter IS 
 
    COMPONENT ProgramCounter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         pc_int : IN  std_logic_vector(31 downto 0);
         pc_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal pc_int : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pc_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          clk => clk,
          rst => rst,
          pc_int => pc_int,
          pc_out => pc_out
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
      rst <= '1';
      wait for 100 ns;	
		rst <= '0'; 
		pc_int <= x"00000001";       
		wait for 20 ns;
		pc_int <= x"0000000A";
		wait for 20 ns;
		pc_int <= x"00000010";
		wait for 20 ns;
		rst <= '0'; 
      wait;
   end process;

END;
