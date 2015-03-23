----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:05:07 07/06/2012 
-- Design Name: 
-- Module Name:    map_top - Behavioral 
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

entity map_top is
    Port ( clk_50 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           color : out  STD_LOGIC_VECTOR (7 downto 0);
           hs : out  STD_LOGIC;
           vs : out  STD_LOGIC);
end map_top;

architecture Behavioral of map_top is

begin


end Behavioral;

