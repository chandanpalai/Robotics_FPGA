----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:00:20 03/20/2013 
-- Design Name: 
-- Module Name:    comp5 - Behavioral 
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

entity comp5 is
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
end comp5;

architecture Behavioral of comp5 is

signal cmp, sel : std_logic := '0';

begin

cmp <= '0' when da > db else '1';
sel <= (not(donea) or (doneb and bora and (not(borb))) or (donea and doneb and (not(cmp)) and (not(bora xor borb))));

dout <= da when sel='0' else db;
doneout <= donea when sel='0' else doneb;
iout <= a when sel='0' else b;
borout <= bora when sel='0' else borb;

end Behavioral;