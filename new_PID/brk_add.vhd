----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:37 03/06/2011 
-- Design Name: 
-- Module Name:    brk_add - Behavioral 
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

entity brk_add is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           op : out  STD_LOGIC_VECTOR (15 downto 0));
end brk_add;

architecture Behavioral of brk_add is
	component add_3 is
    Port ( inp : in  STD_LOGIC_VECTOR (3 downto 0);
			  output : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
begin
	b1: add_3 port map (inp(15 downto 12),op(15 downto 12));
	b2: add_3 port map (inp(11 downto 8),op(11 downto 8));
	b3: add_3 port map (inp(7 downto 4),op(7 downto 4));
	b4: add_3 port map (inp(3 downto 0),op(3 downto 0));

end Behavioral;

