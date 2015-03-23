
-- VHDL Instantiation Created from source file vgatop.vhd -- 00:11:08 07/06/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vgatop
	PORT(
		clk_50 : IN std_logic;
		rst : IN std_logic;
		color_in : IN std_logic_vector(7 downto 0);          
		color_out : OUT std_logic_vector(7 downto 0);
		blank : OUT std_logic;
		hs : OUT std_logic;
		vs : OUT std_logic
		);
	END COMPONENT;

	Inst_vgatop: vgatop PORT MAP(
		clk_50 => ,
		rst => ,
		color_in => ,
		color_out => ,
		blank => ,
		hs => ,
		vs => 
	);


