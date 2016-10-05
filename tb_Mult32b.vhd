
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_Mult32b IS
END tb_Mult32b;
 
ARCHITECTURE behavior OF tb_Mult32b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multi_32b
    PORT(
         mul_int1 : IN  std_logic_vector(31 downto 0);
         mul_int2 : IN  std_logic_vector(31 downto 0);
         clk_mul : IN  std_logic;
         mul_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mul_int1 : std_logic_vector(31 downto 0) := (others => '0');
   signal mul_int2 : std_logic_vector(31 downto 0) := (others => '0');
   signal clk_mul : std_logic := '0';

 	--Outputs
   signal mul_out : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multi_32b PORT MAP (
          mul_int1 => mul_int1,
          mul_int2 => mul_int2,
          clk_mul => clk_mul,
          mul_out => mul_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      mul_int1 <= x"00001201";
		mul_int2 <=  x"0123020A";
		clk_mul <= '0';
      wait for 100 ns;	
		clk_mul <= '1';
		wait for 100 ns;	
		mul_int1 <= x"00301200";
		mul_int2 <= x"0B20E20A";
		wait for 100 ns;
		clk_mul <= '0';
		
      wait;
   end process;

END;
