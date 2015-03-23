----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:52:27 04/28/2012 
-- Design Name: 
-- Module Name:    Pid_bounder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pid_bounder is
    Port ( pid_count : in  STD_LOGIC_VECTOR (31 downto 0);
           quad_desired : in  STD_LOGIC_VECTOR (14 downto 0);
           high_time : out  STD_LOGIC_VECTOR (15 downto 0));
end Pid_bounder;

architecture Structural of Pid_bounder is

begin
process (pid_count, quad_desired)
	begin
		case quad_desired is
			when "000000000000000" =>
				high_time <= "0000000000000000";
			when others =>
				case pid_count(31) is
					when '1' =>
						high_time <= "0000000000000000";
					when others =>
						if( pid_count(30 downto 0) < "0000000000000000100110011001101") then
							high_time <= "0100110011001101";
						else
							if( pid_count(30 downto 0) > "0000000000000001100110010001010") then
								high_time <= "1100110010001010";
							else
								high_time <= pid_count(15 downto 0);
							end if;
						end if;
				end case;
		end case;
	end process;

end Structural;

