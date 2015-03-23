----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:25:20 10/04/2012 
-- Design Name: 
-- Module Name:    cell_matrix - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity cell_matrix is
	Port ( 
		clk : in  STD_LOGIC;
		row1 : in STD_LOGIC;
		row2 : in STD_LOGIC;
		row3 : in STD_LOGIC;
		row4 : in STD_LOGIC;
		row5 : in STD_LOGIC;
		row6 : in STD_LOGIC;
		wea : out STD_LOGIC_VECTOR(0 downto 0) := "0";
		out1 : out STD_LOGIC;
		out2 : out STD_LOGIC;
		out3 : out STD_LOGIC;
		out4 : out STD_LOGIC;
		out5 : out STD_LOGIC;
		out6 : out STD_LOGIC
		--flag : inout STD_LOGIC := '0'
	);
end cell_matrix;

architecture Behavioral of cell_matrix is

COMPONENT cell
	PORT(
		clk : IN std_logic;
		in1 : IN std_logic;
		in2 : IN std_logic;
		in3 : IN std_logic;
		in4 : IN std_logic;
		in5 : IN std_logic;
		in6 : IN std_logic;
		in7 : IN std_logic;
		in8 : IN std_logic;
		data : OUT std_logic
		);
END COMPONENT;

COMPONENT map_ram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

signal count : std_logic_vector (3 downto 0) :="0000" ;
signal op_0101,op_0102,op_0103,op_0104,op_0105,op_0106,op_0201,op_0202,op_0203,op_0204,op_0205,op_0206,op_0301,op_0302,op_0303,op_0304,op_0305,op_0306,op_0401,op_0402,op_0403,op_0404,op_0405,op_0406,op_0501,op_0502,op_0503,op_0504,op_0505,op_0506,op_0601,op_0602,op_0603,op_0604,op_0605,op_0606 : std_logic;

begin

process(clk)
begin
	if(clk='1' and clk'event) then
		count <= count + "0001";
	end if;
	if(count > 5 and count <12) then
		--flag <= '1';
		wea <= "1";
	end if;
end process;
  
	Inst_cell_0101: cell PORT MAP(
		clk => clk,
		data => op_0101,
		in1 => op_0102,
		in2 => '0',
		in3 => row1,
		in4 => op_0201,
		in5 => '0',
		in6 => '0',
		in7 => '0',
		in8 => op_0202
	);

	Inst_cell_0102: cell PORT MAP(
		clk => clk,
		data => op_0102,
		in1 => op_0103,
		in2 => '0',
		in3 => op_0101,
		in4 => op_0202,
		in5 => '0',
		in6 => '0',
		in7 => op_0201,
		in8 => op_0203
	);

	Inst_cell_0103: cell PORT MAP(
		clk => clk,
		data => op_0103,
		in1 => op_0104,
		in2 => '0',
		in3 => op_0102,
		in4 => op_0203,
		in5 => '0',
		in6 => '0',
		in7 => op_0202,
		in8 => op_0204
	);

	Inst_cell_0104: cell PORT MAP(
		clk => clk,
		data => op_0104,
		in1 => op_0105,
		in2 => '0',
		in3 => op_0103,
		in4 => op_0204,
		in5 => '0',
		in6 => '0',
		in7 => op_0203,
		in8 => op_0205
	);

	Inst_cell_0105: cell PORT MAP(
		clk => clk,
		data => op_0105,
		in1 => op_0106,
		in2 => '0',
		in3 => op_0104,
		in4 => op_0205,
		in5 => '0',
		in6 => '0',
		in7 => op_0204,
		in8 => op_0206
	);

	Inst_cell_0106: cell PORT MAP(
		clk => clk,
		data => op_0106,
		in1 => '0',
		in2 => '0',
		in3 => op_0105,
		in4 => op_0206,
		in5 => '0',
		in6 => '0',
		in7 => op_0205,
		in8 => '0'
	);

	Inst_cell_0201: cell PORT MAP(
		clk => clk,
		data => op_0201,
		in1 => op_0202,
		in2 => op_0101,
		in3 => row2,
		in4 => op_0301,
		in5 => op_0102,
		in6 => '0',
		in7 => '0',
		in8 => op_0302
	);

	Inst_cell_0202: cell PORT MAP(
		clk => clk,
		data => op_0202,
		in1 => op_0203,
		in2 => op_0102,
		in3 => op_0201,
		in4 => op_0302,
		in5 => op_0103,
		in6 => op_0101,
		in7 => op_0301,
		in8 => op_0303
	);

	Inst_cell_0203: cell PORT MAP(
		clk => clk,
		data => op_0203,
		in1 => op_0204,
		in2 => op_0103,
		in3 => op_0202,
		in4 => op_0303,
		in5 => op_0104,
		in6 => op_0102,
		in7 => op_0302,
		in8 => op_0304
	);

	Inst_cell_0204: cell PORT MAP(
		clk => clk,
		data => op_0204,
		in1 => op_0205,
		in2 => op_0104,
		in3 => op_0203,
		in4 => op_0304,
		in5 => op_0105,
		in6 => op_0103,
		in7 => op_0303,
		in8 => op_0305
	);

	Inst_cell_0205: cell PORT MAP(
		clk => clk,
		data => op_0205,
		in1 => op_0206,
		in2 => op_0105,
		in3 => op_0204,
		in4 => op_0305,
		in5 => op_0106,
		in6 => op_0104,
		in7 => op_0304,
		in8 => op_0306
	);

	Inst_cell_0206: cell PORT MAP(
		clk => clk,
		data => op_0206,
		in1 => '0',
		in2 => op_0106,
		in3 => op_0205,
		in4 => op_0306,
		in5 => '0',
		in6 => op_0105,
		in7 => op_0305,
		in8 => '0'
	);

	Inst_cell_0301: cell PORT MAP(
		clk => clk,
		data => op_0301,
		in1 => op_0302,
		in2 => op_0201,
		in3 => row3,
		in4 => op_0401,
		in5 => op_0202,
		in6 => '0',
		in7 => '0',
		in8 => op_0402
	);

	Inst_cell_0302: cell PORT MAP(
		clk => clk,
		data => op_0302,
		in1 => op_0303,
		in2 => op_0202,
		in3 => op_0301,
		in4 => op_0402,
		in5 => op_0203,
		in6 => op_0201,
		in7 => op_0401,
		in8 => op_0403
	);

	Inst_cell_0303: cell PORT MAP(
		clk => clk,
		data => op_0303,
		in1 => op_0304,
		in2 => op_0203,
		in3 => op_0302,
		in4 => op_0403,
		in5 => op_0204,
		in6 => op_0202,
		in7 => op_0402,
		in8 => op_0404
	);

	Inst_cell_0304: cell PORT MAP(
		clk => clk,
		data => op_0304,
		in1 => op_0305,
		in2 => op_0204,
		in3 => op_0303,
		in4 => op_0404,
		in5 => op_0205,
		in6 => op_0203,
		in7 => op_0403,
		in8 => op_0405
	);

	Inst_cell_0305: cell PORT MAP(
		clk => clk,
		data => op_0305,
		in1 => op_0306,
		in2 => op_0205,
		in3 => op_0304,
		in4 => op_0405,
		in5 => op_0206,
		in6 => op_0204,
		in7 => op_0404,
		in8 => op_0406
	);

	Inst_cell_0306: cell PORT MAP(
		clk => clk,
		data => op_0306,
		in1 => '0',
		in2 => op_0206,
		in3 => op_0305,
		in4 => op_0406,
		in5 => '0',
		in6 => op_0205,
		in7 => op_0405,
		in8 => '0'
	);

	Inst_cell_0401: cell PORT MAP(
		clk => clk,
		data => op_0401,
		in1 => op_0402,
		in2 => op_0301,
		in3 => row4,
		in4 => op_0501,
		in5 => op_0302,
		in6 => '0',
		in7 => '0',
		in8 => op_0502
	);

	Inst_cell_0402: cell PORT MAP(
		clk => clk,
		data => op_0402,
		in1 => op_0403,
		in2 => op_0302,
		in3 => op_0401,
		in4 => op_0502,
		in5 => op_0303,
		in6 => op_0301,
		in7 => op_0501,
		in8 => op_0503
	);

	Inst_cell_0403: cell PORT MAP(
		clk => clk,
		data => op_0403,
		in1 => op_0404,
		in2 => op_0303,
		in3 => op_0402,
		in4 => op_0503,
		in5 => op_0304,
		in6 => op_0302,
		in7 => op_0502,
		in8 => op_0504
	);

	Inst_cell_0404: cell PORT MAP(
		clk => clk,
		data => op_0404,
		in1 => op_0405,
		in2 => op_0304,
		in3 => op_0403,
		in4 => op_0504,
		in5 => op_0305,
		in6 => op_0303,
		in7 => op_0503,
		in8 => op_0505
	);

	Inst_cell_0405: cell PORT MAP(
		clk => clk,
		data => op_0405,
		in1 => op_0406,
		in2 => op_0305,
		in3 => op_0404,
		in4 => op_0505,
		in5 => op_0306,
		in6 => op_0304,
		in7 => op_0504,
		in8 => op_0506
	);

	Inst_cell_0406: cell PORT MAP(
		clk => clk,
		data => op_0406,
		in1 => '0',
		in2 => op_0306,
		in3 => op_0405,
		in4 => op_0506,
		in5 => '0',
		in6 => op_0305,
		in7 => op_0505,
		in8 => '0'
	);

	Inst_cell_0501: cell PORT MAP(
		clk => clk,
		data => op_0501,
		in1 => op_0502,
		in2 => op_0401,
		in3 => row5,
		in4 => op_0601,
		in5 => op_0402,
		in6 => '0',
		in7 => '0',
		in8 => op_0602
	);

	Inst_cell_0502: cell PORT MAP(
		clk => clk,
		data => op_0502,
		in1 => op_0503,
		in2 => op_0402,
		in3 => op_0501,
		in4 => op_0602,
		in5 => op_0403,
		in6 => op_0401,
		in7 => op_0601,
		in8 => op_0603
	);

	Inst_cell_0503: cell PORT MAP(
		clk => clk,
		data => op_0503,
		in1 => op_0504,
		in2 => op_0403,
		in3 => op_0502,
		in4 => op_0603,
		in5 => op_0404,
		in6 => op_0402,
		in7 => op_0602,
		in8 => op_0604
	);

	Inst_cell_0504: cell PORT MAP(
		clk => clk,
		data => op_0504,
		in1 => op_0505,
		in2 => op_0404,
		in3 => op_0503,
		in4 => op_0604,
		in5 => op_0405,
		in6 => op_0403,
		in7 => op_0603,
		in8 => op_0605
	);

	Inst_cell_0505: cell PORT MAP(
		clk => clk,
		data => op_0505,
		in1 => op_0506,
		in2 => op_0405,
		in3 => op_0504,
		in4 => op_0605,
		in5 => op_0406,
		in6 => op_0404,
		in7 => op_0604,
		in8 => op_0606
	);

	Inst_cell_0506: cell PORT MAP(
		clk => clk,
		data => op_0506,
		in1 => '0',
		in2 => op_0406,
		in3 => op_0505,
		in4 => op_0606,
		in5 => '0',
		in6 => op_0405,
		in7 => op_0605,
		in8 => '0'
	);

	Inst_cell_0601: cell PORT MAP(
		clk => clk,
		data => op_0601,
		in1 => op_0602,
		in2 => op_0501,
		in3 =>row6,
		in4 => '0',
		in5 => op_0502,
		in6 => '0',
		in7 => '0',
		in8 => '0'
	);

	Inst_cell_0602: cell PORT MAP(
		clk => clk,
		data => op_0602,
		in1 => op_0603,
		in2 => op_0502,
		in3 => op_0601,
		in4 => '0',
		in5 => op_0503,
		in6 => op_0501,
		in7 => '0',
		in8 => '0'
	);

	Inst_cell_0603: cell PORT MAP(
		clk => clk,
		data => op_0603,
		in1 => op_0604,
		in2 => op_0503,
		in3 => op_0602,
		in4 => '0',
		in5 => op_0504,
		in6 => op_0502,
		in7 => '0',
		in8 => '0'
	);

	Inst_cell_0604: cell PORT MAP(
		clk => clk,
		data => op_0604,
		in1 => op_0605,
		in2 => op_0504,
		in3 => op_0603,
		in4 => '0',
		in5 => op_0505,
		in6 => op_0503,
		in7 => '0',
		in8 => '0'
	);

	Inst_cell_0605: cell PORT MAP(
		clk => clk,
		data => op_0605,
		in1 => op_0606,
		in2 => op_0505,
		in3 => op_0604,
		in4 => '0',
		in5 => op_0506,
		in6 => op_0504,
		in7 => '0',
		in8 => '0'
	);

	Inst_cell_0606: cell PORT MAP(
		clk => clk,
		data => op_0606,
		in1 => '0',
		in2 => op_0506,
		in3 => op_0605,
		in4 => '0',
		in5 => '0',
		in6 => op_0505,
		in7 => '0',
		in8 => '0'
	);
	
	out1 <= op_0106;
	out2 <= op_0206;
	out3 <= op_0306;
	out4 <= op_0406;
	out5 <= op_0506;
	out6 <= op_0606;

--  r1 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0106,
--    douta => row1
--  );
--  
--  r2 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0206,
--    douta => row2
--  );
--  
--  r3 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0306,
--    douta => row3
--  );
--  
--  r4 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0406,
--    douta => row4
--  );
--  
--  r5 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0506,
--    douta => row5
--  );
--  
--  r6 : map_ram
--  PORT MAP (
--    clka => clk,
--    wea => wea,
--    addra => count,
--    dina(0) => op_0606,
--    douta => row6
--  );

--  process(clk)
--  begin
--	if(clk = '1' and clk'event and count = "000") then
--	--	wea <= not(wea);
--		--count <= "101";
--	if(clk = '1' and clk'event) then
--		count <= count - "001";
--	end if;
--  end process;
  
end Behavioral;
