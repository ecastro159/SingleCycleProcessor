----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2021 05:43:33 PM
-- Design Name: 
-- Module Name: ALU Control - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity ALUControl is
    Port ( ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           Opcode : in STD_LOGIC_VECTOR (10 downto 0);
           ALU_Control : out STD_LOGIC_VECTOR (3 downto 0)
           );
end ALUControl;

architecture Behavioral of ALUControl is

begin
    process(ALUOp, Opcode)
    begin
    
    case ALUOp is
    --LDUR/STUR Instruction
        when "00" =>
        --Add Action
            ALU_Control <= "0010";
    --CBZ
        when "01" =>
        --Pass input b Action
            ALU_Control <= "0111";
    --R-type Instruction
        when "10" =>
            case Opcode is
        --Add Instruction
                when "10001011000" =>
                --add Action
                    ALU_Control <= "0010";
        --SUB Instruction
                when "11001011000" =>
                --subtract Action
                    ALU_Control <= "0110";
        --AND Instruction
                when "10001010000" =>
                --AND Action
                    ALU_Control <= "0000";
        --ORR Instruction
                when "10101010000" =>
                --OR Action
                    ALU_Control <= "0001";
                when others =>
                    ALU_Control <= "0000";
            end case;
      when others =>
            NULL;
    end case;
end process;

end Behavioral;



















