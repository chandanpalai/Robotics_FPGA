----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:03 03/02/2011 
-- Design Name: 
-- Module Name:    pres_clk - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pres_clk is
    Port ( clk : in  STD_LOGIC;
           pres : out  STD_LOGIC);
end pres_clk;

architecture Behavioral of pres_clk is
	signal op:STD_LOGIC:='1';
	signal count:STD_LOGIC_VECTOR (17 downto 0):="000000000000000000";
begin
	process(clk)
	begin
		if(clk='1' and clk'event) then
			count<=count+1;
				if(count="010000110101000000") then
				op<=not op;
				count<="000000000000000000";
			end if;
		end if;
	end process;
pres<=op;
end Behavioral;

