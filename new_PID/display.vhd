----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:36 03/02/2011 
-- Design Name: 
-- Module Name:    display - Behavioral 
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
library work;
use work.my_pack.all;
use IEEE.STD_LOGIC_1164.ALL;
use  IEEE.NUMERIC_STD;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port (  clk:in STD_LOGIC;
				num:in STD_LOGIC_VECTOR(12 downto 0);
				op : out  STD_LOGIC_VECTOR (11 downto 0));
end display;

architecture Behavioral of display is 
	signal anode:STD_LOGIC_VECTOR (3 downto 0):="1101";
	
	signal digit0:STD_LOGIC_VECTOR(3 downto 0);
	signal digit1:STD_LOGIC_VECTOR(3 downto 0);
	signal digit2:STD_LOGIC_VECTOR(3 downto 0);
	signal digit3:STD_LOGIC_VECTOR(3 downto 0);
	
	signal bcdnum:STD_LOGIC_VECTOR(15 downto 0);
	signal binnum:STD_LOGIC_VECTOR(15 downto 0);
	
	signal pres:STD_LOGIC;
	
	component pres_clk is
    Port ( clk : in  STD_LOGIC;
           pres : out  STD_LOGIC);
	end component;
	
	component bintobcd is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           op : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	
begin
	binnum<="000"&num;
	
	pre1: pres_clk port map(clk,pres);
	bcd: bintobcd port map (binnum,bcdnum);
	
	process(pres)
	begin	
		if(pres='1' and pres'event) then
			
			digit3<=bcdnum(3 downto 0);
			digit2<=bcdnum(7 downto 4);
			digit1<=bcdnum(11 downto 8);
			digit0<=bcdnum(15 downto 12);
			
			case anode is
			when "1110" =>
				op(7 downto 0)<=bintobcd_func(digit3);
			when "1101" =>
				op(7 downto 0)<=bintobcd_func(digit2);
			when "1011" =>
				op(7 downto 0)<=bintobcd_func(digit1);
			when "0111" =>
				op(7 downto 0)<=bintobcd_func(digit0);
			when others =>
				op(7 downto 0)<="11111111";
			end case;
			anode<=anode(2 downto 0) & anode(3);
		end if;
	end process;
	op(11 downto 8)<=anode(0) & anode(3 downto 1) ;
end Behavioral;