library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity npc is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           intNPC : in  STD_LOGIC_VECTOR (31 downto 0);
           outNPC : out  STD_LOGIC_VECTOR (31 downto 0));
end npc;

architecture Behavioral of npc is

begin

process (clk, reset, intNPC)
	begin
		if (reset = '1') then
			outNPC <= (others => '0');
		else
			if(rising_edge(clk)) then
				outNPC <= intNPC;
			end if;
		end if;
end process;

end Behavioral;