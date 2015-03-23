----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:03 03/13/2013 
-- Design Name: 
-- Module Name:    add_sub - Behavioral 
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

entity add_sub is
    Port ( clk : in STD_LOGIC;
	        x1 : in  STD_LOGIC_vector(1 downto 0);
			  x2 : in  STD_LOGIC_vector(1 downto 0);
	        x3 : in  STD_LOGIC_vector(1 downto 0);
	        x4 : in  STD_LOGIC_vector(1 downto 0);
	        x5 : in  STD_LOGIC_vector(1 downto 0);
	        x6 : in  STD_LOGIC_vector(1 downto 0);
	        x7 : in  STD_LOGIC_vector(1 downto 0);
	        x8 : in  STD_LOGIC_vector(1 downto 0);
           y1 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y2 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y3 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y4 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y5 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y6 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y7 : in  STD_LOGIC_VECTOR (1 downto 0);
			  y8 : in  STD_LOGIC_VECTOR (1 downto 0);
           d1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d4 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d5 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d6 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d7 : in  STD_LOGIC_VECTOR (4 downto 0);
			  d8 : in  STD_LOGIC_VECTOR (4 downto 0);
			  nx1 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx2 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx3 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx4 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx5 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx6 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx7 : out STD_LOGIC_VECTOR (1 downto 0);
			  nx8 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny1 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny2 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny3 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny4 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny5 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny6 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny7 : out STD_LOGIC_VECTOR (1 downto 0);
			  ny8 : out STD_LOGIC_VECTOR (1 downto 0);
           dout1 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout2 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout3 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout4 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout5 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout6 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout7 : out  STD_LOGIC_VECTOR (4 downto 0);
			  dout8 : out  STD_LOGIC_VECTOR (4 downto 0);
           b1 : out  STD_LOGIC;
			  b2 : out  STD_LOGIC;
			  b3 : out  STD_LOGIC;
			  b4 : out  STD_LOGIC;
			  b5 : out  STD_LOGIC;
			  b6 : out  STD_LOGIC;
			  b7 : out  STD_LOGIC;
			  b8 : out  STD_LOGIC);
end add_sub;

architecture Behavioral of add_sub is

COMPONENT sub3
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Inc
  PORT (
    a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    clk : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Add3
  PORT (
    a : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    clk : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

signal dx2, dx4, dx5, dx6, dx7, dx8: STD_LOGIC_VECTOR (2 downto 0);
signal dy1, dy3, dy5, dy6, dy7, dy8: STD_LOGIC_VECTOR (2 downto 0);
signal sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin

	dx2 <= x2&'0';
	dx4 <= x4&'0';
	dx5 <= x5&'0';
	dx6 <= x6&'0';
	dx7 <= x7&'0';
	dx8 <= x8&'0';

	dy1 <= y1&'0';
	dy3 <= y3&'0';
	dy5 <= y5&'0';
	dy6 <= y6&'0';
	dy7 <= y7&'0';
	dy8 <= y8&'0';
	
	nx1 <= x1;
	nx3 <= x3;
	ny2 <= y2;
	ny4 <= y4;
	
	incx2 : Inc
  PORT MAP (
    a => x2,
    clk => clk,
    s => nx2
  );
  incx4 : Inc
  PORT MAP (
    a => x4,
    clk => clk,
    s => nx4
  );
  incx5 : Inc
  PORT MAP (
    a => x5,
    clk => clk,
    s => nx5
  );
  incx6 : Inc
  PORT MAP (
    a => x6,
    clk => clk,
    s => nx6
  );
  incx7 : Inc
  PORT MAP (
    a => x7,
    clk => clk,
    s => nx7
  );
  incx8 : Inc
  PORT MAP (
    a => x8,
    clk => clk,
    s => nx8
  );
  
  incy1 : Inc
  PORT MAP (
    a => y1,
    clk => clk,
    s => ny1
  );
  incy3 : Inc
  PORT MAP (
    a => y3,
    clk => clk,
    s => ny3
  );
  incy5 : Inc
  PORT MAP (
    a => y5,
    clk => clk,
    s => ny5
  );
  incy6 : Inc
  PORT MAP (
    a => y6,
    clk => clk,
    s => ny6
  );
  incy7 : Inc
  PORT MAP (
    a => y7,
    clk => clk,
    s => ny7
  );
  incy8 : Inc
  PORT MAP (
    a => y8,
    clk => clk,
    s => ny8
  );
	
	a5 : Add3
  PORT MAP (
    a => dx5,
    b => dy5,
    clk => clk,
    c_in => '1',
    s => sum5(3 downto 0)
  );
  
  	a6 : Add3
  PORT MAP (
    a => dx6,
    b => dy6,
    clk => clk,
    c_in => '1',
    s => sum6(3 downto 0)
  );
  
  	a7 : Add3
  PORT MAP (
    a => dx7,
    b => dy7,
    clk => clk,
    c_in => '1',
    s => sum7(3 downto 0)
  );
  
  	a8 : Add3
  PORT MAP (
    a => dx8,
    b => dy8,
    clk => clk,
    c_in => '1',
    s => sum8(3 downto 0)
  );
  
  sum1 <= "00"&dy1;
  sum2 <= "00"&dx2;
  sum3 <= "00"&dy3;
  sum4 <= "00"&dx4;
  
  s1 : sub3
  PORT MAP (
    a => d1,
    b => sum1,
    clk => clk,
    c_in => '0',
    c_out => b1,
    s => dout1
  );
  
  s2 : sub3
  PORT MAP (
    a => d2,
    b => sum2,
    clk => clk,
    c_in => '0',
    c_out => b2,
    s => dout2
  );
  
  s3 : sub3
  PORT MAP (
    a => d3,
    b => sum3,
    clk => clk,
    c_in => '0',
    c_out => b3,
    s => dout3
  );
  
  s4 : sub3
  PORT MAP (
    a => d4,
    b => sum4,
    clk => clk,
    c_in => '0',
    c_out => b4,
    s => dout4
  );
  
  s5 : sub3
  PORT MAP (
    a => d5,
    b => sum5,
    clk => clk,
    c_in => '0',
    c_out => b5,
    s => dout5
  );
  
  s6 : sub3
  PORT MAP (
    a => d6,
    b => sum6,
    clk => clk,
    c_in => '0',
    c_out => b6,
    s => dout6
  );
  
  s7 : sub3
  PORT MAP (
    a => d7,
    b => sum7,
    clk => clk,
    c_in => '0',
    c_out => b7,
    s => dout7
  );
  
  s8 : sub3
  PORT MAP (
    a => d8,
    b => sum8,
    clk => clk,
    c_in => '0',
    c_out => b8,
    s => dout8
  );

end Behavioral;