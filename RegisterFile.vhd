----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 04:41:03 PM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
--  Port ( );
Port(
    outA        : out std_logic_vector(63 downto 0);
    outB        : out std_logic_vector(63 downto 0);
    input       : in std_logic_vector(63 downto 0);
    writeEnable : in std_logic;
    regAsel     : in std_logic_vector(4 downto 0);
    regBsel     : in std_logic_vector(4 downto 0);
    writeRegSel : in std_logic_vector(4 downto 0)
);
end RegisterFile;

architecture Behavioral of RegisterFile is
    type register_file is array(0 to 31) of std_logic_vector(63 downto 0);
    signal registers: register_file;
begin
--Write 
    process(writeEnable, writeRegSel, regAsel, regBsel, input) is 
        begin
            if writeEnable = '1' then
                 registers(to_integer(unsigned(writeRegSel))) <=  input;
            end if;
-- Read    
            outA <= registers(to_integer(unsigned(regAsel)));
            outB <= registers(to_integer(unsigned(regBsel)));
    end process; 

end Behavioral;