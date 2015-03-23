----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:38:17 04/27/2012 
-- Design Name: 
-- Module Name:    prescalar - Behavioral 
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

entity prescalar is
    Port ( clk_50 : in  STD_LOGIC;
	        reset : in std_logic;
           clk_100hz : out  STD_LOGIC);
end prescalar;

architecture Behavioral of prescalar is

COMPONENT bin_cntr_19 IS
  PORT (
    clk : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
  );
END COMPONENT;

signal cntr_rst: std_logic;
signal counter_cnt: std_logic_vector (18 downto 0);

--signal clk_out: std_logic;
signal flag: std_logic;

begin

cntr_rst <= reset or flag;
counter0: bin_cntr_19 port map( clk_50, cntr_rst, counter_cnt);

flag <= '1' when counter_cnt = "1111010000100100000" else '0';
clk_100hz <= flag;

end Behavioral;

