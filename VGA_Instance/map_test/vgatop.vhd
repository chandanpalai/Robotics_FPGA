----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:38:34 07/03/2012 
-- Design Name: 
-- Module Name:    vgatop - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity vgatop is
    Port ( clk_50 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           color_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  hcount: inout std_logic_vector (10 downto 0);
			  vcount: inout std_logic_vector (10 downto 0);
			  blank : out std_logic;
           hs : out  STD_LOGIC;
           vs : out  STD_LOGIC);
end vgatop;

architecture Behavioral of vgatop is

component dcm_25 is
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          CLK0_OUT        : out   std_logic);
end component;


component VgaRefComp is
   port ( CLK_25MHz  : in    std_logic; 
          CLK_40MHz  : in    std_logic; 
          RESOLUTION : in    std_logic; 
          RST        : in    std_logic; 
          BLANK      : out   std_logic; 
          HCOUNT     : inout   std_logic_vector (10 downto 0); 
          HS         : out   std_logic; 
          VCOUNT     : inout   std_logic_vector (10 downto 0); 
          VS         : out   std_logic);
end component;

COMPONENT dr
  PORT (
    a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

signal clk_25: std_logic;
--signal clk_40: std_logic;
signal clk_tmp: std_logic;
signal spo: std_logic_vector (0 downto 0);
signal a: std_logic_vector(13 downto 0);

begin

Inst_dcm_25: dcm_25 PORT MAP(
		CLKIN_IN => clk_50,
		RST_IN => rst,
		CLKIN_IBUFG_OUT => clk_tmp,
		CLK0_OUT => clk_25    );

--blank<='0';

vga: VgaRefComp port map (clk_25, clk_25, '0', rst, blank, hcount, hs, vcount, vs);
--Inst_VgaRefComp: VgaRefComp PORT MAP(
--		CLK_25MHz => ,
--		CLK_40MHz => ,
--		RESOLUTION => ,
--		RST => ,
--		BLANK => ,
--		HCOUNT => ,
--		HS => ,
--		VCOUNT => ,
--		VS => 
--	);

--	color_out <= color_in;

a <= to_stdlogicvector(to_bitvector(vcount) sla 4)+ hcount;

dist1 : dr 
  PORT MAP (
    a =>  a(13 downto 0),
    spo => spo
  );

color_out <= "11111111" when vcount < 128 and hcount < 128 else "00000000";

end Behavioral;