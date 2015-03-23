
-- VHDL Instantiation Created from source file pid_top.vhd -- 19:13:27 07/04/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pid_top
	PORT(
		quadA : IN std_logic;
		quadB : IN std_logic;
		clk_50 : IN std_logic;
		reset : IN std_logic;          
		motor_enable : OUT std_logic;
		motor_plus : OUT std_logic;
		motor_minus : OUT std_logic;
		disp_out : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	Inst_pid_top: pid_top PORT MAP(
		quadA => ,
		quadB => ,
		clk_50 => ,
		reset => ,
		motor_enable => ,
		motor_plus => ,
		motor_minus => ,
		disp_out => 
	);


