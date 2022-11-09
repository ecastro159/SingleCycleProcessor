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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_memory is
--  Port ( );
port(
    data_in: in std_logic_vector(63 downto 0);
    address: in std_logic_vector(63 downto 0);
    data_write: in std_logic;
    data_read: in std_logic;
    --clk: in std_logic;
    data_out: out std_logic_vector(63 downto 0)
);
end data_memory;

architecture Behavioral of data_memory is

type memory is array(0 to 255) of std_logic_vector(7 downto 0);
signal ram : memory := (
    0 => "00000001",
    8 => "00000010",
    others => "00000000"
    );
begin
    process(data_write, data_read)
        begin 
        if data_write = '1' then
                ram(to_integer(unsigned(address))) <= data_in; 
        elsif data_read= '1' then
                data_out <= ram(to_integer(unsigned(address)));
        else           
        end if;
        
    end process;
    
    
end Behavioral;
