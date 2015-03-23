
-- VHDL Instantiation Created from source file VgaRefComp.vhd -- 21:55:22 07/04/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT VgaRefComp
	PORT(
		CLK_25MHz : IN std_logic;
		CLK_40MHz : IN std_logic;
		RESOLUTION : IN std_logic;
		RST : IN std_logic;          
		BLANK : OUT std_logic;
		HCOUNT : OUT std_logic_vector(10 downto 0);
		HS : OUT std_logic;
		VCOUNT : OUT std_logic_vector(10 downto 0);
		VS : OUT std_logic
		);
	END COMPONENT;

	Inst_VgaRefComp: VgaRefComp PORT MAP(
		CLK_25MHz => ,
		CLK_40MHz => ,
		RESOLUTION => ,
		RST => ,
		BLANK => ,
		HCOUNT => ,
		HS => ,
		VCOUNT => ,
		VS => 
	);


