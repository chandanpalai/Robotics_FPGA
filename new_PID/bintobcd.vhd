----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:54 03/06/2011 
-- Design Name: 
-- Module Name:    bintobcd - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bintobcd is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           op : out  STD_LOGIC_VECTOR (15 downto 0));
end bintobcd;

architecture Behavioral of bintobcd is
	component brk_add is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           op : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	signal inp0:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp1:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp2:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp3:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp4:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp5:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp6:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp7:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp8:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp9:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp10:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp11:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp12:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp13:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	signal inp14:STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
	
	signal op0:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op1:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op2:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op3:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op4:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op5:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op6:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op7:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op8:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op9:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op10:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op11:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op12:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op13:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	signal op14:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
	
begin
	inp0<="000000000000000"&inp(15);
	br0: brk_add port map (inp0,op0);
	
	inp1<=op0(14 downto 0)&inp(14);
	br1: brk_add port map (inp1,op1);
	
	inp2<=op1(14 downto 0)&inp(13);
	br2: brk_add port map (inp2,op2);
	
	inp3<=op2(14 downto 0)&inp(12);
	br3: brk_add port map (inp3,op3);
	
	inp4<=op3(14 downto 0)&inp(11);
	br4: brk_add port map (inp4,op4);
	
	inp5<=op4(14 downto 0)&inp(10);
	br5: brk_add port map (inp5,op5);
	
	inp6<=op5(14 downto 0)&inp(9);
	br6: brk_add port map (inp6,op6);
	
	inp7<=op6(14 downto 0)&inp(8);
	br7: brk_add port map (inp7,op7);
	
	inp8<=op7(14 downto 0)&inp(7);
	br8: brk_add port map (inp8,op8);
	
	inp9<=op8(14 downto 0)&inp(6);
	br9: brk_add port map (inp9,op9);
	
	inp10<=op9(14 downto 0)&inp(5);
	br10: brk_add port map (inp10,op10);
	
	inp11<=op10(14 downto 0)&inp(4);
	br11: brk_add port map (inp11,op11);
	
	inp12<=op11(14 downto 0)&inp(3);
	br12: brk_add port map (inp12,op12);
	
	inp13<=op12(14 downto 0)&inp(2);
	br13: brk_add port map (inp13,op13);
	
	inp14<=op13(14 downto 0)&inp(1);
	br14: brk_add port map (inp14,op14);
	
	op<=op14(14 downto 0)&inp(0);
	
end Behavioral;

