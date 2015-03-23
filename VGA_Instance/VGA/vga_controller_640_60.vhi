
-- VHDL Instantiation Created from source file vga_controller_640_60.vhd -- 19:51:41 07/04/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga_controller_640_60
	PORT(
		rst : IN std_logic;
		pixel_clk : IN std_logic;          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;

	Inst_vga_controller_640_60: vga_controller_640_60 PORT MAP(
		rst => ,
		pixel_clk => ,
		HS => ,
		VS => ,
		hcount => ,
		vcount => ,
		blank => 
	);


