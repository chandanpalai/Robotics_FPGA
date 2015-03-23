library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addervga is
--
	Port 
	( clk_50 : in  STD_LOGIC;
     rst : in  STD_LOGIC;
	  to_be_displayed : in STD_LOGIC_VECTOR(15 downto 0);
	  color_out : out  STD_LOGIC_VECTOR (7 downto 0);
	  blank : out std_logic;
     hs : out  STD_LOGIC;
     vs : out  STD_LOGIC
	 );
--
end addervga;

architecture Behavioral of addervga is
	component vgatop is
	--
		Port ( clk_50 : in  STD_LOGIC;
            rst : in  STD_LOGIC;
			  to_be_displayed : STD_LOGIC_VECTOR(15 downto 0);
           color_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  blank : out std_logic;
           hs : out  STD_LOGIC;
           vs : out  STD_LOGIC);
	--
	end component;
	COMPONENT adder32
  PORT (
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
component dcm_25 is
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          CLK0_OUT        : out   std_logic);
end component;




signal color_out0,color_out1 : STD_LOGIC_VECTOR(7 downto 0);
signal hs0,hs1 : std_logic;
signal vs0,vs1 : std_logic;
signal blank0,blank1 : std_logic;
signal clk_25: std_logic;
--signal clk_40: std_logic;
signal clk_tmp: std_logic;


begin
--
  VGA0 : vgatop port map(clk_50,rst,to_be_displayed,color_out,blank,hs,vs);
--Inst_dcm_25: dcm_25 PORT MAP(
--		CLKIN_IN => clk_50,
--		RST_IN => rst,
--		CLKIN_IBUFG_OUT => clk_tmp,
--		CLK0_OUT => clk_25    );
 
--
end Behavioral;