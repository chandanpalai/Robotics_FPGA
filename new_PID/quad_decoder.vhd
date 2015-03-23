----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:31 04/01/2012 
-- Design Name: 
-- Module Name:    quad_decoder - Behavioral 
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

entity quad_decoder is
    Port ( quadA      : in  STD_LOGIC;
           quadB      : in  STD_LOGIC;
           clk_50     : in  STD_LOGIC;
           reset      : in  STD_LOGIC;
			  quad_count : out std_logic_vector(14 downto 0));
end quad_decoder;

architecture structural of quad_decoder is

component FD 
generic( INIT : BIT := '0');
port ( C: in STD_LOGIC;
		 D: in STD_LOGIC;
		 Q: out STD_LOGIC);
end component;

component adder_15bit
Port ( A: in std_logic_vector(13 Downto 0);
		 B: in std_logic_vector(13 Downto 0);
		 S: out std_logic_vector(14 Downto 0);
		 clk: in std_logic);
end component;

component counter_14bit_up
Port ( clk: in std_logic;
		 ce    : in std_logic;
		 sclr  : in std_logic;
		 Q     : out std_logic_vector(13 Downto 0));
end component;

signal quadA_prev: std_logic :='0';
signal quadB_prev: std_logic :='0';

signal countA_en: std_logic ;
signal countB_en: std_logic ;

signal countA_out: std_logic_vector(13 Downto 0) ;
signal countB_out: std_logic_vector(13 Downto 0) ;

begin
FDA: FD port map(clk_50,quadA,quadA_prev);
FDB: FD port map(clk_50,quadB,quadB_prev);

countA_en<= quadA xor quadA_prev;
countB_en<= quadB xor quadB_prev;

CDA: counter_14bit_up port map(clk_50, countA_en, reset, countA_out);
CDB: counter_14bit_up port map(clk_50, countB_en, reset, countB_out);

add1: adder_15bit port map(countA_out, countB_out, quad_count, clk_50);
end structural;

