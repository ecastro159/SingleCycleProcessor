----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 03:32:37 PM
-- Design Name: 
-- Module Name: Program Counter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Counter is
--  Port ( );
port(
CLK :in std_logic;
NextInst:in std_logic_vector(63 downto 0);
Current:out std_logic_vector(63 downto 0)
);
end Program_Counter;

architecture Behavioral of Program_Counter is
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
        Current <= NextInst;
        end if;
    end process;


end Behavioral;
