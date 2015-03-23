
-- VHDL Instantiation Created from source file dcm_40MHz.vhd -- 23:04:34 10/02/2013
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT dcm_40MHz
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_dcm_40MHz: dcm_40MHz PORT MAP(
		CLKIN_IN => ,
		RST_IN => ,
		CLKFX_OUT => ,
		CLKIN_IBUFG_OUT => 
	);


