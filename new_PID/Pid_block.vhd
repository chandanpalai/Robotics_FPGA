----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:20:32 04/22/2012 
-- Design Name: 
-- Module Name:    Pid_block - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pid_block is
    Port ( err : in  STD_LOGIC_VECTOR (15 downto 0);
           pid_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end Pid_block;

architecture Behavioral of Pid_block is

signal kp: std_logic_vector(14 downto 0):="000000000000001";
signal kp_times_error: std_logic_vector(31 downto 0);
signal ki: std_logic_vector(14 downto 0):="000000000000001";
signal ki_times_error_sum(31 downto 0):
begin


end Behavioral;

