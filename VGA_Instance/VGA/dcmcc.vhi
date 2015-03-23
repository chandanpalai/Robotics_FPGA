
-- VHDL Instantiation Created from source file dcmcc.vhd -- 23:03:57 10/02/2013
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT dcmcc
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_dcmcc: dcmcc PORT MAP(
		CLKIN_IN => ,
		RST_IN => ,
		CLK0_OUT => ,
		LOCKED_OUT => 
	);


