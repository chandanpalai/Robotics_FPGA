----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:55 03/06/2011 
-- Design Name: 
-- Module Name:    add_3 - Behavioral 
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

entity add_3 is
    Port ( inp : in  STD_LOGIC_VECTOR (3 downto 0);
			  output : out  STD_LOGIC_VECTOR (3 downto 0));
end add_3;

architecture Behavioral of add_3 is
begin
	process (inp)
	begin
		case inp is
			when "0000" => 
				output<="0000";
			when "0001" => 
				output<="0001";
			when "0010" => 
				output<="0010";
			when "0011" =>
				output<="0011";
			when "0100" => 
				output<="0100";
			when "0101" => 
				output<="1000";
			when "0110" => 
				output<="1001";
			when "0111" => 
				output<="1010";
			when "1000" => 
				output<="1011";
			when "1001" => 
				output<="1100";
			when others =>
				output<="0000";
		end case;	
	end process;
end Behavioral;