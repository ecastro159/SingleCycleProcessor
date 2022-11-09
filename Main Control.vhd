----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2021 11:14:11 PM
-- Design Name: 
-- Module Name: Main Control - Behavioral
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

entity Main_Control is
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
end Main_Control;

architecture Behavioral of Main_Control is

begin
    process(opcode) 
    begin
    case opcode is 
    
    -- :R-format
    when "1XX0101X000" =>
        Reg2Loc  <= '0';
        ALUSrc   <= '0';
        MemtoReg <= '0';
        RegWrite <= '1';
        MemRead  <= '0';
        MemWrite <= '0';
        Branch   <= '0';
        ALUOp    <= "10";
        Branch   <= '0';
        
    -- :LDUR
    when "11111000010" =>
        Reg2Loc  <= 'X';
        ALUSrc   <= '1';
        MemtoReg <= '1';
        RegWrite <= '1';
        MemRead  <= '1';
        MemWrite <= '0';
        Branch   <= '0';
        ALUOp    <= "00";
        
     -- :STUR
    when "11111000000"=>
        Reg2Loc  <= '1';
        ALUSrc   <= '1';
        MemtoReg <= 'X';
        RegWrite <= '0';
        MemRead  <= '0';
        MemWrite <= '1';
        Branch   <= '0';
        ALUOp    <= "00";

        
    -- :CBZ    
    when "10110100XXX" =>
        Reg2Loc  <= '1';
        ALUSrc   <= '0';
        MemtoReg <= 'X';
        RegWrite <= '0';
        MemRead  <= '0';
        MemWrite <= '0';
        Branch   <= '1';
        ALUOp    <= "01";
        
   -- : B (branch unconditionally)     
    when "000101XXXXX" =>
        Reg2Loc  <= '1';
        ALUSrc   <= '0';
        MemtoReg <= 'X';
        RegWrite <= '0';
        MemRead  <= '0';
        MemWrite <= '0';
        Branch   <= '1';
        ALUOp    <= "00";
        
    when others =>
            NULL;
    end case;
    
    end process;

end Behavioral;
