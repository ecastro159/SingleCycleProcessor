----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 08:07:37 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
--  Port ( );
Port(
    input_a         : in std_logic_vector(63 downto 0);
    input_b         : in std_logic_vector(63 downto 0);
    alu_control     : in std_logic_vector(3 downto 0);
    alu_result      : out std_logic_vector(63 downto 0);
    zero            : out std_logic
);
end ALU;

architecture Behavioral of ALU is
signal output: std_logic_vector(63 downto 0);
begin
    process(input_a, input_b, alu_control)
    begin
        case alu_control is
            when "0000" =>
                alu_result <= input_a and input_b;
                output <= input_a and input_b;
            when "0001" =>
                alu_result <= input_a or input_b;
                output <= input_a or input_b;
            when "0010" =>
                alu_result <= std_logic_vector(unsigned(input_a) + unsigned(input_b));
                output <= std_logic_vector(unsigned(input_a) + unsigned(input_b));
            when "0110" =>
                alu_result <= std_logic_vector(unsigned(input_a) - unsigned(input_b));
                output <= std_logic_vector(unsigned(input_a) - unsigned(input_b));
            when "0111" => 
                alu_result <= input_b;
                output <= input_b;
            when "1100" => 
                alu_result <= (input_a nor input_b);
                output <= (input_a nor input_b);
            when others =>
                null;
        end case;
        -- checking if computation is 0 
        if output = "0000000000000000000000000000000000000000000000000000000000000000" then
            zero <= '1';
        else
            zero <= '0';
        end if;
    end process;

    

end Behavioral;
