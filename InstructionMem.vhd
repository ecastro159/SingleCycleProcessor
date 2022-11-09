----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 04:38:50 PM
-- Design Name: 
-- Module Name: InstructionMem - Behavioral
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

entity InstructionMem is
--  Port ( );
Port(
    read_address: in std_logic_vector(63 downto 0);
    instruction: out std_logic_vector(31 downto 0)
);

end InstructionMem;

architecture Behavioral of InstructionMem is
type memory is array(0 to 255) of std_logic_vector(7 to 0);
signal instructionMemory:
    memory:= (
                0 => "01000010",
                1 => "00000001",
                2 => "01000000",
                3 => "11111000",
                4 => "01000011",
                5 => "10000001",
                6 => "01000000",
                7 => "11111000",
                8 => "01100100",
                9 => "00000000",
                10 => "00000010",
                11 => "11001011",
                12 => "01100101",
                13 => "00000000",
                14 => "00000010",
                15 => "10001011",
                16 => "01000001",
                17 => "00000000",
                18 => "00000000",
                19 => "10110100",
                20 => "01000000",
                21 => "00000000",
                22 => "00000000",
                23 => "10110100",
                24 => "01000010",
                25 => "00000001",
                26 => "01000000",
                27 => "11111000",
                28 => "01000110",
                29 => "00000000",
                30 => "00000011",
                31 => "10101010",
                32 => "01000111",
                33 => "00000000",
                34 => "00000011",
                35 => "10001010",
                36 => "11100100",
                37 => "10000000",
                38 => "00000000",
                39 => "11111000",
                40 => "00000010",
                41 => "00000000",
                42 => "00000000",
                43 => "00010100",
                44 => "01000011",
                45 => "10000001",
                46 => "01000000",
                47 => "11111000",
                48 => "00001000",
                49 => "00000000",
                50 => "00000001",
                51 => "10001011",
                others => "00000000"
    
    );
begin
    process(read_address) is 
            begin
               
                    instruction(7 downto 0) <= instructionMemory(to_integer(unsigned(read_address)));
                    instruction(15 downto 8) <= instructionMemory(to_integer(unsigned(read_address)) + 1);
                    instruction(24 downto 16) <= instructionMemory(to_integer(unsigned(read_address)) + 2);
                    instruction(31 downto 25) <= instructionMemory(to_integer(unsigned(read_address)) + 3);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 4);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 5);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 6);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 7);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 8);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 9);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 10);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 11);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 12);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 13);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 14);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 15);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 16);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 17);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 18);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 19);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 20);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 21);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 22);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 23);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 24);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 25);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 26);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 27);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 28);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 29);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 30);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 31);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 32);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 33);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 34);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 35);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 36);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 37);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 38);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 39);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 40);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 41);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 42);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 43);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 44);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 45);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 46);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 47);
                    
                    instruction(7 downto 0)    <= instructionMemory(to_integer(unsigned(read_address)) + 48);
                    instruction(15 downto 8)   <= instructionMemory(to_integer(unsigned(read_address)) + 49);
                    instruction(24 downto 16)  <= instructionMemory(to_integer(unsigned(read_address)) + 50);
                    instruction(31 downto 25)  <= instructionMemory(to_integer(unsigned(read_address)) + 51);
                    
            end process;

end Behavioral;
