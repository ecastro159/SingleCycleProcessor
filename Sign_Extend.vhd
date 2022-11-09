----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 01:03:59 PM
-- Design Name: 
-- Module Name: Sign_Extend - Behavioral
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

entity Sign_Extend is
--  Port ( );
Port(
     i    : in std_logic_vector (31 downto 0);
     o    : out std_logic_vector (63 downto 0)
    );
end Sign_Extend;

architecture Behavioral of Sign_Extend is
signal extend : std_logic_vector(63 downto 0);
begin
process(i)
    begin
    -- R instruction (AND)
    if i(31 downto 21) = "10001010000" then
        extend(4 downto 0) <= i( 20 downto 16);
            if extend(4) = '1' then
                
                o <= (63 downto 5 => '1') & extend(4 downto 0);
                else
                o <= (63 downto 5 => '0') & extend(4 downto 0);
            end if;
    
    
    -- D instruction (LDUR)
    elsif i(31 downto 21) = "11111000010" then
            extend(8 downto 0) <= i( 20 downto 12);
                if extend(8) = '1' then
                    o <= (63 downto 9 => '1') & extend(8 downto 0);
                    else
                    o <= (63 downto 9 => '0') & extend(8 downto 0);
                end if;
    
    
    -- R instruction (SUB)
    elsif i(31 downto 21) = "11001011000" then
        extend(4 downto 0) <= i( 20 downto 16);
            if extend(4) = '1' then
                o <= (63 downto 5 => '1') & extend(4 downto 0);
                else
                o <= (63 downto 5 => '0') & extend(4 downto 0);
            end if;
    
    
    -- R instruction (ADD)
    elsif i(31 downto 21) = "10001011000" then
        extend(4 downto 0) <= i( 20 downto 16);
            if extend(4) = '1' then
                o <= (63 downto 5 => '1') & extend(4 downto 0);
                else
                o <= (63 downto 5 =>'0') & extend(4 downto 0);
            end if;
    
    
    --CB instruction (CBZ)
    elsif i(31 downto 24) = "10110100" then
        extend(18 downto 0) <= i(23 downto 5);
            if extend(19) = '1' then
                o <= (63 downto 20 => '1') & extend(19 downto 0);
                else
                o <= (63 downto 20 =>'0') & extend(19 downto 0);
            end if;
    
    
    --R instruction (ORR)
    elsif i(31 downto 21) = "10101010000" then
        extend(4 downto 0) <= i( 20 downto 16);
            if extend(4) = '1' then
                o <= (63 downto 5 => '1') & extend(4 downto 0);
                else
                o <= (63 downto 5 =>'0') & extend(4 downto 0);
            end if;
    
    
    -- D instruction (STUR)
    elsif i(31 downto 21) = "11111000000" then
        extend(8 downto 0) <= i( 20 downto 12);
            if extend(8) = '1' then
                o <= (63 downto 9 => '1') & extend(8 downto 0);
                else
                o <= (63 downto 9 => '0') & extend(8 downto 0);
            end if;
   
    
        -- B instruction (B)
    elsif i(31 downto 26) = "000101" then
        extend(25 downto 0) <= i( 25 downto 0);
            if extend(25) = '1' then
                o <= (63 downto 26 => '1') & extend(25 downto 0);
                else
                o <= (63 downto 26 => '0') & extend(25 downto 0);
            end if;
    else
        o <= (63 downto 0 =>'1');
    end if;
 end process;

end Behavioral;
