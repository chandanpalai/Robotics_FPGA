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

	COMPONENT cell_matrix
	PORT(
		clk : IN std_logic;
		row1 : IN std_logic;
		row2 : IN std_logic;
		row3 : IN std_logic;
		row4 : IN std_logic;
		row5 : IN std_logic;
		row6 : IN std_logic;          
		wea : OUT std_logic_vector(0 to 0);
		out1 : OUT std_logic;
		out2 : OUT std_logic;
		out3 : OUT std_logic;
		out4 : OUT std_logic;
		out5 : OUT std_logic;
		out6 : OUT std_logic
		);
	END COMPONENT;

COMPONENT DCM_25
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLK0_OUT : OUT std_logic
		);
	END COMPONENT;
	
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

COMPONENT map_ram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

signal clk_25: std_logic;
signal flag : std_logic;
signal wea, dina  : std_logic_vector (0 downto 0) := "0";
signal clk_tmp: std_logic;
signal spo: std_logic_vector (0 downto 0);
signal data: std_logic_vector(5 downto 0);
signal cnt: std_logic_vector(2 downto 0):="000";
signal count : std_logic_vector(2 downto 0) :="101";
signal clk_40: std_logic;

signal row1,row2,row3,row4,row5,row6 : std_logic_vector (0 downto 0);


begin

Inst_cell_matrix: cell_matrix PORT MAP(
		clk => clk_50,
		row1 => data(0),
		row2 => data(1),
		row3 => data(2),
		row4 => data(3),
		row5 => data(4),
		row6 => data(5),
		wea => wea,
		out1 => row1(0),
		out2 => row2(0),
		out3 => row3(0),
		out4 => row4(0),
		out5 => row5(0),
		out6 => row6(0)
	);

	Inst_DCM_25: DCM_25 PORT MAP(
		CLKIN_IN => clk_50,
		RST_IN => rst,
		CLK0_OUT => clk_25
	);

vga: VgaRefComp PORT MAP(
		CLK_25MHz => clk_25,
		CLK_40MHz => clk_25,
		RESOLUTION => '0',
		RST => rst,
		BLANK => blank,
		HCOUNT => hcount,
		HS => hs,
		VCOUNT => vcount,
		VS => vs
	);

cnt<= count when flag = '0' else hcount(2 downto 0);

r1 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row1,
    douta(0) => data(0)
  );
  
  r2 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row2,
    douta(0) => data(1)
  );
  
  r3 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row3,
    douta(0) => data(2)
  );
  
  r4 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row4,
    douta(0) => data(3)
  );
  
  r5 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row5,
    douta(0) => data(4)
  );
  
  r6 : map_ram
  PORT MAP (
    clka => clk_50,
    wea => wea,
    addra => cnt,
    dina => row6,
    douta(0) => data(5)
  );

process( hcount, vcount)
begin
if(hcount>5 or vcount>5) then
	color_out <= "00000000";
elsif(vcount = 1) then
	if(data(0) = '0') then
		color_out <= "11111111";
	else
		color_out <= "00000000";
	end if;
elsif(vcount = 2) then
	if(data(1) = '0') then
		color_out <= "00111111";
	else
		color_out <= "00000000";
	end if;
elsif(vcount = 3) then
	if(data(2) = '0') then
		color_out <= "00011111";
	else
		color_out <= "00000000";
	end if;
elsif(vcount = 4) then
	if(data(3) = '0') then
		color_out <= "11111100";
	else
		color_out <= "00000000";
	end if;
elsif(vcount = 5) then
	if(data(4) = '0') then
		color_out <= "11111000";
	else
		color_out <= "00000000";
	end if;
elsif(vcount = 6) then
	if(data(5) = '0') then
		color_out <= "11100111";
	else
		color_out <= "00000000";
	end if;
end if;
end process;

process(clk_50)
begin
	if(clk_50 = '1' and clk_50'event) then
		count <= count - "001";
	end if;
end process;

end Behavioral;