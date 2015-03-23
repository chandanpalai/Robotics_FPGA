----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:11 03/14/2013 
-- Design Name: 
-- Module Name:    cell_top - Behavioral 
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

entity cell_top is
    Port ( clk : in  STD_LOGIC;
			x1 : IN std_logic_vector(1 downto 0);
			x2 : IN std_logic_vector(1 downto 0);
			x3 : IN std_logic_vector(1 downto 0);
			x4 : IN std_logic_vector(1 downto 0);
			x5 : IN std_logic_vector(1 downto 0);
			x6 : IN std_logic_vector(1 downto 0);
			x7 : IN std_logic_vector(1 downto 0);
			x8 : IN std_logic_vector(1 downto 0);
			y1 : IN std_logic_vector(1 downto 0);
			y2 : IN std_logic_vector(1 downto 0);
			y3 : IN std_logic_vector(1 downto 0);
			y4 : IN std_logic_vector(1 downto 0);
			y5 : IN std_logic_vector(1 downto 0);
			y6 : IN std_logic_vector(1 downto 0);
			y7 : IN std_logic_vector(1 downto 0);
			y8 : IN std_logic_vector(1 downto 0);
			d1 : IN std_logic_vector(4 downto 0);
			d2 : IN std_logic_vector(4 downto 0);
			d3 : IN std_logic_vector(4 downto 0);
			d4 : IN std_logic_vector(4 downto 0);
			d5 : IN std_logic_vector(4 downto 0);
			d6 : IN std_logic_vector(4 downto 0);
			d7 : IN std_logic_vector(4 downto 0);
			d8 : IN std_logic_vector(4 downto 0);
			done1 : IN std_logic;
			done2 : IN std_logic;
			done3 : IN std_logic;
			done4 : IN std_logic;
			done5 : IN std_logic;
			done6 : IN std_logic;
			done7 : IN std_logic;
			done8 : IN std_logic;
		   xout: OUT std_logic_vector (1 downto 0);
			yout: OUT std_logic_vector (1 downto 0);
			done: out std_logic;
			d: out std_logic_vector(4 downto 0)
		 );
end cell_top;

architecture Behavioral of cell_top is

	COMPONENT add_sub
	PORT(
		clk : IN std_logic;
		x1 : IN std_logic_vector(1 downto 0);
		x2 : IN std_logic_vector(1 downto 0);
		x3 : IN std_logic_vector(1 downto 0);
		x4 : IN std_logic_vector(1 downto 0);
		x5 : IN std_logic_vector(1 downto 0);
		x6 : IN std_logic_vector(1 downto 0);
		x7 : IN std_logic_vector(1 downto 0);
		x8 : IN std_logic_vector(1 downto 0);
		y1 : IN std_logic_vector(1 downto 0);
		y2 : IN std_logic_vector(1 downto 0);
		y3 : IN std_logic_vector(1 downto 0);
		y4 : IN std_logic_vector(1 downto 0);
		y5 : IN std_logic_vector(1 downto 0);
		y6 : IN std_logic_vector(1 downto 0);
		y7 : IN std_logic_vector(1 downto 0);
		y8 : IN std_logic_vector(1 downto 0);
		d1 : IN std_logic_vector(4 downto 0);
		d2 : IN std_logic_vector(4 downto 0);
		d3 : IN std_logic_vector(4 downto 0);
		d4 : IN std_logic_vector(4 downto 0);
		d5 : IN std_logic_vector(4 downto 0);
		d6 : IN std_logic_vector(4 downto 0);
		d7 : IN std_logic_vector(4 downto 0);
		d8 : IN std_logic_vector(4 downto 0);          
		nx1 : OUT std_logic_vector(1 downto 0);
		nx2 : OUT std_logic_vector(1 downto 0);
		nx3 : OUT std_logic_vector(1 downto 0);
		nx4 : OUT std_logic_vector(1 downto 0);
		nx5 : OUT std_logic_vector(1 downto 0);
		nx6 : OUT std_logic_vector(1 downto 0);
		nx7 : OUT std_logic_vector(1 downto 0);
		nx8 : OUT std_logic_vector(1 downto 0);
		ny1 : OUT std_logic_vector(1 downto 0);
		ny2 : OUT std_logic_vector(1 downto 0);
		ny3 : OUT std_logic_vector(1 downto 0);
		ny4 : OUT std_logic_vector(1 downto 0);
		ny5 : OUT std_logic_vector(1 downto 0);
		ny6 : OUT std_logic_vector(1 downto 0);
		ny7 : OUT std_logic_vector(1 downto 0);
		ny8 : OUT std_logic_vector(1 downto 0);
		dout1 : OUT std_logic_vector(4 downto 0);
		dout2 : OUT std_logic_vector(4 downto 0);
		dout3 : OUT std_logic_vector(4 downto 0);
		dout4 : OUT std_logic_vector(4 downto 0);
		dout5 : OUT std_logic_vector(4 downto 0);
		dout6 : OUT std_logic_vector(4 downto 0);
		dout7 : OUT std_logic_vector(4 downto 0);
		dout8 : OUT std_logic_vector(4 downto 0);
		b1 : OUT std_logic;
		b2 : OUT std_logic;
		b3 : OUT std_logic;
		b4 : OUT std_logic;
		b5 : OUT std_logic;
		b6 : OUT std_logic;
		b7 : OUT std_logic;
		b8 : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT max
	PORT(
		d1 : IN std_logic_vector(4 downto 0);
		d2 : IN std_logic_vector(4 downto 0);
		d3 : IN std_logic_vector(4 downto 0);
		d4 : IN std_logic_vector(4 downto 0);
		d5 : IN std_logic_vector(4 downto 0);
		d6 : IN std_logic_vector(4 downto 0);
		d7 : IN std_logic_vector(4 downto 0);
		d8 : IN std_logic_vector(4 downto 0);
		done1 : IN std_logic;
		done2 : IN std_logic;
		done3 : IN std_logic;
		done4 : IN std_logic;
		done5 : IN std_logic;
		done6 : IN std_logic;
		done7 : IN std_logic;
		done8 : IN std_logic;
		b1 : IN std_logic;
		b2 : IN std_logic;
		b3 : IN std_logic;
		b4 : IN std_logic;
		b5 : IN std_logic;
		b6 : IN std_logic;
		b7 : IN std_logic;
		b8 : IN std_logic;          
		dout : OUT std_logic_vector(4 downto 0);
		doneout : OUT std_logic;
		i : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;
signal nx1,nx2,nx3,nx4,nx5,nx6,nx7,nx8,ny1,ny2,ny3,ny4,ny5,ny6,ny7,ny8 : std_logic_vector(1 downto 0) :="00";
signal dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8 : std_logic_vector( 4 downto 0) ;
signal b1,b2,b3,b4,b5,b6,b7,b8 :std_logic;
signal i: std_logic_vector(2 downto 0);
signal tempx, tempy : std_logic_vector (1 downto 0) :="00";
signal tempd : std_logic_vector (4 downto 0) :="00000";
signal tempdone : std_logic := '0';

begin

add_sub_inc: add_sub PORT MAP(
		clk => clk,
		x1 => x1,
		x2 => x2,
		x3 => x3,
		x4 => x4,
		x5 => x5,
		x6 => x6,
		x7 => x7,
		x8 => x8,
		y1 => y1,
		y2 => y2,
		y3 => y3,
		y4 => y4,
		y5 => y5,
		y6 => y6,
		y7 => y7,
		y8 => y8,
		d1 => d1,
		d2 => d2,
		d3 => d3,
		d4 => d4,
		d5 => d5,
		d6 => d6,
		d7 => d7,
		d8 => d8,
		nx1 => nx1,
		nx2 => nx2,
		nx3 => nx3,
		nx4 => nx4,
		nx5 => nx5,
		nx6 => nx6,
		nx7 => nx7,
		nx8 => nx8,
		ny1 => ny1,
		ny2 => ny2,
		ny3 => ny3,
		ny4 => ny4,
		ny5 => ny5,
		ny6 => ny6,
		ny7 => ny7,
		ny8 => ny8,
		dout1 => dout1,
		dout2 => dout2,
		dout3 => dout3,
		dout4 => dout4,
		dout5 => dout5,
		dout6 => dout6,
		dout7 => dout7,
		dout8 => dout8,
		b1 => b1,
		b2 => b2,
		b3 => b3,
		b4 => b4,
		b5 => b5,
		b6 => b6,
		b7 => b7,
		b8 => b8
	);

max_compute: max PORT MAP(
		d1 => dout1,
		d2 => dout2,
		d3 => dout3,
		d4 => dout4,
		d5 => dout5,
		d6 => dout6,
		d7 => dout7,
		d8 => dout8,
		done1 => done1,
		done2 => done2,
		done3 => done3,
		done4 => done4,
		done5 => done5,
		done6 => done6,
		done7 => done7,
		done8 => done8,
		b1 => b1,
		b2 => b2,
		b3 => b3,
		b4 => b4,
		b5 => b5,
		b6 => b6,
		b7 => b7,
		b8 => b8,
		dout => tempd ,
		doneout => tempdone,
		i => i
	);

tempx <= nx1 when i="000" else nx2 when i="001" else nx3 when i="010" else nx4 when i="011" else nx5 when i="100" else nx6 when i="101" else nx7 when i="110" else nx8 when i="111";
tempy <= ny1 when i="000" else ny2 when i="001" else ny3 when i="010" else ny4 when i="011" else ny5 when i="100" else ny6 when i="101" else ny7 when i="110" else ny8 when i="111";

process(clk)
begin 
if(clk='1' and clk'event and tempdone ='1')then
xout<=tempx;
yout<=tempy;
d<=tempd;
done<=tempdone;
end if ;
end process;
end Behavioral;

