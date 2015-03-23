--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

package my_pack is
 
-- Declare functions and procedure

  function bintobcd_func  (signal x : in STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR;

end my_pack;


package body my_pack is

-- Example 1
  function bintobcd_func  (signal x : in STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
    variable op:STD_LOGIC_VECTOR (7 downto 0);
  begin
    case x is 
		when "0000" =>
			op:="11000000";
		when "0001" =>
			op:="11111001";
		when "0010" =>
			op:="10100100";
		when "0011" =>
			op:="10110000";
		when "0100" =>
			op:="10011001";
		when "0101" =>
			op:="10010010";
		when "0110" =>
			op:="10000010";
		when "0111" =>
			op:="11111000";
		when "1000" =>
			op:="10000000";
		when "1001" =>
			op:="10010000";
		when others =>
			op:="11111111";
		end case;
    return op; 
  end bintobcd_func;
  

end my_pack;
