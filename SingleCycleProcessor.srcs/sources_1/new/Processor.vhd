
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
    Port ( Clk : in STD_LOGIC;
           PCOut : out STD_LOGIC_VECTOR (63 downto 0);
           ReadData1_in : out STD_LOGIC_VECTOR (63 downto 0);
           ReadData2_in : out STD_LOGIC_VECTOR (63 downto 0);
           DataMemInput_in : out STD_LOGIC_VECTOR (63 downto 0));
end Processor;

architecture Behavioral of Processor is

--add components from other files
    component RegisterFile
        Port(
            outA        : out std_logic_vector(63 downto 0);
            outB        : out std_logic_vector(63 downto 0);
            --input       : in std_logic_vector(63 downto 0);
            writeEnable : in std_logic;
            regAsel     : in std_logic_vector(4 downto 0);
            regBsel     : in std_logic_vector(4 downto 0);
            writeRegSel : in std_logic_vector(4 downto 0)
            );
    end component;

    component ALU
        Port(
            input_a         : in std_logic_vector(63 downto 0);
            input_b         : in std_logic_vector(63 downto 0);
            alu_control     : in std_logic_vector(3 downto 0);
            alu_result      : out std_logic_vector(63 downto 0);
            zero            : out std_logic
            );
    end component;

    component ALUControl
        Port (
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           Opcode : in STD_LOGIC_VECTOR (10 downto 0);
           ALU_Control : out STD_LOGIC_VECTOR (3 downto 0)
           );
    end component;
    
    component InstructionMem
        Port ( 
               read_address: in std_logic_vector(63 downto 0);
               instruction: out std_logic_vector(31 downto 0)
           );
    end component;
    
     component Main_Control
        Port ( 
               opcode  : in STD_LOGIC_VECTOR (10 downto 0);
               Reg2Loc : out STD_LOGIC;
               ALUSrc  : out STD_LOGIC;
               MemtoReg: out STD_LOGIC;
               RegWrite: out STD_LOGIC;
               MemRead : out STD_LOGIC;
               MemWrite: out STD_LOGIC;
               Branch  : out STD_LOGIC;
               ALUOp   : out STD_LOGIC_VECTOR (1 downto 0);
               UncondB : out STD_LOGIC    
           );
    end component;
    
    component Program_Counter
        Port ( 
               CLK :in std_logic;
               NextInst:in std_logic_vector(63 downto 0);
               Current:out std_logic_vector(63 downto 0)
           );
    end component;
    
    component Sign_Extend
        Port ( 
               i    : in std_logic_vector (31 downto 0);
               o    : out std_logic_vector (63 downto 0)
           );
    end component;
    
    component data_memory
        port(
               data_in: in std_logic_vector(63 downto 0);
               address: in std_logic_vector(63 downto 0);
               data_write: in std_logic;
               data_read: in std_logic;
               clk: in std_logic;
               data_out: out std_logic_vector(63 downto 0)
        );
    end component;
    
  --Wires between element
  
  --PC 
  signal PC_ADD_Instruct: std_logic_vector(63 downto 0);
  

  --Instruction Mem
  signal Instruction_Out:   std_logic_vector(31 downto 0);
  signal Read2_Mux:         std_logic_vector(4 downto 0);
  
  
  --Control
  signal ControlReg_Mux:        std_logic;
  signal ControlUn_OR:          std_logic;
  signal ControlB_AND:          std_logic;
  signal ControlMemR_Data:      std_logic;
  signal ControlMemReg_Mux:     std_logic;
  signal ControlALU_ALUControl: std_logic_vector(1 downto 0);
  signal ControlMemWr_DataMem:  std_logic;
  signal ControlALUSrc_Mux:     std_logic;
  signal ControlRegWrite_Reg:   std_logic;
  
  --Registers
  
  signal Rd1_ALU:          std_logic_vector(63 downto 0);
  signal Rd2_Mux_DataWr:   std_logic_vector(63 downto 0);
 
 --Sign Extend
  signal Sign_Shift: std_logic_vector(63 downto 0);
  
  --ALU Control
  signal ALUC_ALU:   std_logic_vector(3 downto 0);
  
  --ALU
  signal zero_AND:      std_logic;
  signal ALUR_Addr_Mux: std_logic_vector(63 downto 0);
  
  --Data Memory
  signal Read_mux:  std_logic_vector(63 downto 0);
  
  --Gates
  signal OR_Gate:   std_logic;
  signal AND_Gate:  std_logic;
  
  --Operations
  signal Add4:       std_logic_vector(63 downto 0);
  signal AddALU:     std_logic_vector(63 downto 0);
  signal Mux_PC:     std_logic_vector(63 downto 0);
  signal MuxOut_ALU: std_logic_vector(63 downto 0);
  signal Mux_ReadR2: std_logic_vector(4 downto 0);
  signal Mux_WriteD: std_logic;
  signal Shift2:     std_logic_vector(63 downto 0);
  signal Shift_Add:  signed(63 downto 0);
  
begin
--PC connection
    pc: Program_Counter port map(   CLK => CLK,
                                    NextInst => Mux_PC,
                                    Current =>  PC_ADD_Instruct
                                    );
 --Instruction connection                             
    instructionM: InstructionMem port map( read_address => PC_ADD_Instruct,
                                           instruction  => Instruction_Out
                                           );
    
  --Register
    Reg: RegisterFile port map ( outA => Rd1_ALU,
                                 outB => Rd2_Mux_DataWr,
                                 writeEnable => Mux_WriteD,
                                 regAsel => Instruction_out(9 downto 5), 
                                 regBsel => Mux_ReadR2,
                                 writeRegSel => Instruction_out(4 downto 0)
                                 );
   
   --Control
    Control: Main_Control port map ( opcode  => Instruction_out(31 downto 21),
                                     Reg2Loc => ControlReg_Mux, 
                                     ALUSrc  => ControlALUSrc_Mux,
                                     MemtoReg=> ControlMemReg_Mux,
                                     RegWrite=> ControlRegWrite_Reg,
                                     MemRead => ControlMemR_Data,
                                     MemWrite=> ControlMemWr_DataMem,
                                     Branch  => ControlB_AND,
                                     ALUOp   => ControlALU_ALUControl,
                                     UncondB => ControlUn_OR
                                     );
    
    --SignExtend 
     Extend: Sign_Extend port map ( i => Instruction_out(31 downto 0),
                                    o => Shift2                
                                    );
                                     
    --ALU Control
     ALUC: ALUControl port map ( ALUOp => ControlALU_ALUControl,
                                 Opcode => Instruction_out(31 downto 21),
                                 ALU_Control => ALUC_ALU
                                 );
    -- ALU
     ProcALU: ALU port map( input_a => Rd1_ALU,
                            input_b => MuxOut_ALU,
                            alu_control => ALUC_ALU,
                            alu_result  => ALUR_Addr_Mux,
                            zero => zero_AND
                            );
    
    --Data Memory
     Mem: data_memory port map( data_in => Rd2_Mux_DataWr,
                                address => ALUR_Addr_Mux,
                                data_write => ControlMemR_Data,
                                data_read => ControlMemR_Data,
                                clk => CLK,
                                data_out => Read_mux
                                );
   
   ------ Operation Blocks
   
  process(ControlB_AND, zero_AND) -- AND Gate to Or Gate
  begin
  AND_Gate <= (ControlB_AND and zero_AND);
  end process;

  process(ControlUn_OR, AND_Gate) -- Or Gate to Mux
  begin
  OR_Gate <= (ControlB_AND or AND_Gate);
  end process;
                                   
  process(ControlUn_OR, AND_Gate) -- Mux to PC Counter
  begin
  OR_Gate <= (ControlB_AND or AND_Gate);
  end process;
    
  process(Shift2) -- Shifting Left by 2 / Add to Add-ALU
  begin
  Shift_Add <= shift_left(signed(Shift2), 2);
  end process;                               
    
    
   process(PC_ADD_Instruct, Shift_Add) -- Add-ALU / Add to Mux
   begin
   AddALU <= std_logic_vector(unsigned(PC_ADD_Instruct) + unsigned(Shift_Add));
   end process;
   
   process(Instruction_out, ControlReg_Mux)-- Mux to Register 2
   begin
    if ControlReg_Mux ='1' then
        Mux_ReadR2<= Instruction_out(4 downto 0);
    elsif ControlReg_Mux ='0' then
        Mux_ReadR2<= Instruction_out(20 downto 16);
    end if;
   end process;                            









end Behavioral;
