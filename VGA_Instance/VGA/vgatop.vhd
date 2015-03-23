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
use IEEE.STD_LOGIC_ARITH.ALL;
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
           to_be_displayed : std_logic_vector(15 downto 0);
           color_out : out  STD_LOGIC_VECTOR (7 downto 0);
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
          HCOUNT     : out   std_logic_vector (10 downto 0); 
          HS         : out   std_logic; 
          VCOUNT     : out   std_logic_vector (10 downto 0); 
          VS         : out   std_logic);
end component;

signal clk_25: std_logic;
--signal clk_40: std_logic;
signal clk_tmp: std_logic;

signal hcount: std_logic_vector (10 downto 0);
signal vcount: std_logic_vector (10 downto 0);

begin

Inst_dcm_25: dcm_25 PORT MAP(
		CLKIN_IN => clk_50,
		RST_IN => rst,
		CLKIN_IBUFG_OUT => clk_tmp,
		CLK0_OUT => clk_25    );


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
			 
--process(clk_25)
--begin
--	color_out <= color_in;
--end process;

--color_out <= color_in when hcount>20 and hcount<40 and vcount<480 else "00000000";

process(hcount)
begin
--
	  
if hcount>0 and hcount<20 then
  --
    if(to_be_displayed(15)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(15)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;

if hcount>20 and hcount<40 then
  --
    if(to_be_displayed(14)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(14)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>40 and hcount<60 then
  --
    if(to_be_displayed(13)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(13)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>60 and hcount<80 then
  --
    if(to_be_displayed(12)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(12)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>80 and hcount<100 then
  --
    if(to_be_displayed(11)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(11)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>100 and hcount<120 then
  --
    if(to_be_displayed(10)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(10)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>120 and hcount<140 then
  --
    if(to_be_displayed(9)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(9)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>140 and hcount<160 then
  --
    if(to_be_displayed(8)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(8)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>160 and hcount<180 then
  --
    if(to_be_displayed(7)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(7)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>180 and hcount<200 then
  --
    if(to_be_displayed(6)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(6)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>200 and hcount<220 then
  --
    if(to_be_displayed(5)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(5)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>220 and hcount<240 then
  --
    if(to_be_displayed(4)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(4)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>240 and hcount<260 then
  --
    if(to_be_displayed(3)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(3)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>260 and hcount<280 then
  --
    if(to_be_displayed(2)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(2)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>280 and hcount<300 then
  --
    if(to_be_displayed(1)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(1)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>300 and hcount<320 then
  --
    if(to_be_displayed(0)='1') then 
    --
		color_out<="11111111";
    --  
    end if;

    if(to_be_displayed(0)='0') then 
    --
		color_out<="11100000";
    -- 
    end if;

end if;


if hcount>320 then
--
	color_out<="00000000";
	
--
end if;

--
end process;
--color_out <= color_in when hcount>20 and vcount<480 else "00000000";

end Behavioral;