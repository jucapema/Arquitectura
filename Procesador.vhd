
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

COMPONENT npc
	Port( clk : in  STD_LOGIC;
         reset : in  STD_LOGIC;
         intNPC : in  STD_LOGIC_VECTOR (31 downto 0);
         outNPC : out  STD_LOGIC_VECTOR (31 downto 0)
		);
		END COMPONENT;
COMPONENT ProgramCounter 
	Port (  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           pc_int : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
		END COMPONENT ;
		
COMPONENT Sum32b
	Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           add_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
		 END COMPONENT ;

COMPONENT IMemory
	Port (address : in  STD_LOGIC_VECTOR (31 downto 0);
         reset  : in  STD_LOGIC;
         outInstruction  : out  STD_LOGIC_VECTOR (31 downto 0)
			);
			END COMPONENT ;

COMPONENT CU
	Port (Op : in  STD_LOGIC_VECTOR (1 downto 0);
         Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
         CU_out : out  STD_LOGIC_VECTOR (5 downto 0)
			);
			END COMPONENT ;
			
COMPONENT RegFile
	Port (  reset : in  STD_LOGIC;
           regfileSource1 : in  STD_LOGIC_VECTOR (4 downto 0);
           regfileSource2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RegFileDesti : in  STD_LOGIC_VECTOR (4 downto 0);
           dtaToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           contRegfileSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contRegfileSource2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  END COMPONENT ;
			  
COMPONENT ALU
	Port (  ALUOp : in  STD_LOGIC_VECTOR (5 downto 0);
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  END COMPONENT ;
			  
COMPONENT ExtenSigno
	Port (  Inmediato : in  STD_LOGIC_VECTOR (12 downto 0);
           Out_Exten : out  STD_LOGIC_VECTOR (31 downto 0)
			  );	
				END COMPONENT ;
				
COMPONENT Multi_32b
	Port (  mul_int1 : in  STD_LOGIC_VECTOR (31 downto 0);
           mul_int2 : in  STD_LOGIC_VECTOR (31 downto 0);
           clk_mul : in  STD_LOGIC;
           mul_out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
				END COMPONENT ;

	signal suma_out, nPC_out, PC_out, IM_out, CRs1, CRs2, AluResult, SEU_out, MUX_out : std_logic_vector(31 downto 0);
	signal CU_Out : std_logic_vector(3 downto 0);

begin
		Inst_nPc: npc PORT MAP(
										intNPC => suma_out,
										reset => reset,
										clk => clk,
										outNPC => nPC_out
									  );
									  
	   Inst_PC: ProgramCounter PORT MAP (
										pc_int => nPC_out,
										rst => reset, -- duda
										clk => clk,
										pc_out => PC_out 
										);				

		Inst_Sum: Sum32b PORT MAP (
										 x => x"00000001", --
										 y => nPC_out,
										 add_out => suma_out
		);
		
		

		Inst_IM: IMemory PORT MAP ( 
										address => Pc_out,
										reset => reset ,
										outInstruction => IM_out
										);
										
		Inst_CU: CU PORT MAP (
										op => IM_out(31 downto 30),
										op3 => IM_out (24 downto 19),
										CU_out => CU_Out
										);


		Inst_RF: RegFile PORT MAP (
											reset => reset ,
											regfileSource1 => IM_out(18 downto 14),
											regfileSource2 => IM_out(4 downto 0),
											RegFileDesti =>   IM_out(29 downto 25),
											dtaToWrite => 		ALUResult,
											contRegfileSource1 =>  CRs1,
											contRegfileSource2 =>  CRs2
											);
											
		Inst_SEU: ExtenSigno PORT MAP (
											Inmediato => IM_out(12 downto 0),
											Out_Exten => SEU_out
											);
											
		Inst_Mux: Multi_32b PORT MAP (
											mul_int1 =>  CRs2,
											mul_int2 =>  SEU_out,
											clk_mul =>   MUX_out,
											mul_out =>  IM_out(13) 
											);
											

											
		Inst_Alu: ALU PORT MAP (
											 ALUOp => CRs1,
											 x => MUX_out,
											 y => CU_out,
											 ALUResult => AluResult
											 );
											
											
		ALUResult <= AluResult;
											
											
end Behavioral;

