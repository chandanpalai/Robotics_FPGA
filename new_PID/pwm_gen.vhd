----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:35:54 04/28/2012 
-- Design Name: 
-- Module Name:    pwm_gen - Behavioral 
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
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_gen is
    Port ( high_time : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
			  reset: in std_logic;
           pwm_out : out  STD_LOGIC);
end pwm_gen;

architecture Behavioral of pwm_gen is

component counter_16_up_sclr IS
  PORT ( 
    clk : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END component;

signal counter16_cnt: std_logic_vector(15 downto 0);

begin

counter1: counter_16_up_sclr port map(clk, reset, counter16_cnt);
pwm_out<='1' when (counter16_cnt < high_time) else '0';

end Behavioral;

