----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:25:35 03/20/2013 
-- Design Name: 
-- Module Name:    max - Behavioral 
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

entity max is
    Port ( d1 : in  STD_LOGIC_VECTOR (4 downto 0);
           d2 : in  STD_LOGIC_VECTOR (4 downto 0);
           d3 : in  STD_LOGIC_VECTOR (4 downto 0);
           d4 : in  STD_LOGIC_VECTOR (4 downto 0);
           d5 : in  STD_LOGIC_VECTOR (4 downto 0);
           d6 : in  STD_LOGIC_VECTOR (4 downto 0);
           d7 : in  STD_LOGIC_VECTOR (4 downto 0);
           d8 : in  STD_LOGIC_VECTOR (4 downto 0);
           done1 : in  STD_LOGIC;
           done2 : in  STD_LOGIC;
           done3 : in  STD_LOGIC;
           done4 : in  STD_LOGIC;
           done5 : in  STD_LOGIC;
           done6 : in  STD_LOGIC;
           done7 : in  STD_LOGIC;
           done8 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
           b4 : in  STD_LOGIC;
           b5 : in  STD_LOGIC;
           b6 : in  STD_LOGIC;
           b7 : in  STD_LOGIC;
           b8 : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (4 downto 0);
           doneout : out  STD_LOGIC;
           i : out  STD_LOGIC_VECTOR (2 downto 0));
end max;

architecture Behavioral of max is

component comp5 is
    Port ( da : in  STD_LOGIC_VECTOR (4 downto 0);
           db : in  STD_LOGIC_VECTOR (4 downto 0);
           donea : in  STD_LOGIC;
           doneb : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           bora : in  STD_LOGIC;
           borb : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (4 downto 0);
           doneout : out  STD_LOGIC;
           iout : out  STD_LOGIC_VECTOR (2 downto 0);
           borout : out  STD_LOGIC);
end component;

signal d11, d12, d13, d14, d21, d22 : std_logic_vector (4 downto 0);
signal done11, done12, done13, done14, done21, done22 : std_logic;
signal b11, b12, b13, b14, b21, b22, bfin : std_logic;
signal i11,i12,i13,i14,i21,i22 : std_logic_vector (2 downto 0);
signal i1 : std_logic_vector (2 downto 0) :="000";
signal i2 : std_logic_vector (2 downto 0) :="001";
signal i3 : std_logic_vector (2 downto 0) :="010";
signal i4 : std_logic_vector (2 downto 0) :="011";
signal i5 : std_logic_vector (2 downto 0) :="100";
signal i6 : std_logic_vector (2 downto 0) :="101";
signal i7 : std_logic_vector (2 downto 0) :="110";
signal i8 : std_logic_vector (2 downto 0) :="111";

begin

	comp11: comp5 PORT MAP(
		da => d1,
		db => d2,
		donea => done1,
		doneb => done2,
		a => i1,
		b => i2,
		bora => b1,
		borb => b2,
		dout => d11,
		doneout => done11,
		iout => i11,
		borout => b11
	);
	
	comp12: comp5 PORT MAP(
		da => d3,
		db => d4,
		donea => done3,
		doneb => done4,
		a => i3,
		b => i4,
		bora => b3,
		borb => b4,
		dout => d12,
		doneout => done12,
		iout => i12,
		borout => b12
	);
	
	comp13: comp5 PORT MAP(
		da => d5,
		db => d6,
		donea => done5,
		doneb => done6,
		a => i5,
		b => i6,
		bora => b5,
		borb => b6,
		dout => d13,
		doneout => done13,
		iout => i13,
		borout => b13
	);
	
	comp14: comp5 PORT MAP(
		da => d7,
		db => d8,
		donea => done7,
		doneb => done8,
		a => i7,
		b => i8,
		bora => b7,
		borb => b8,
		dout => d14,
		doneout => done14,
		iout => i14,
		borout => b14
	);
	
	comp21: comp5 PORT MAP(
		da => d11,
		db => d12,
		donea => done11,
		doneb => done12,
		a => i11,
		b => i12,
		bora => b11,
		borb => b12,
		dout => d21,
		doneout => done21,
		iout => i21,
		borout => b21
	);
	
	comp22: comp5 PORT MAP(
		da => d13,
		db => d14,
		donea => done13,
		doneb => done14,
		a => i13,
		b => i14,
		bora => b13,
		borb => b14,
		dout => d22,
		doneout => done22,
		iout => i22,
		borout => b22
	);
	
	comp_fin: comp5 PORT MAP(
		da => d21,
		db => d22,
		donea => done21,
		doneb => done22,
		a => i21,
		b => i22,
		bora => b21,
		borb => b22,
		dout => dout,
		doneout => doneout,
		iout => i,
		borout => bfin
	);

end Behavioral;

