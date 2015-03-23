
-- VHDL Instantiation Created from source file pid_control.vhd -- 18:50:03 04/28/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pid_control
	PORT(
		clk : IN std_logic;
		error : IN std_logic_vector(15 downto 0);
		val : IN std_logic_vector(15 downto 0);
		pre_clk : IN std_logic;
		kp : IN std_logic_vector(15 downto 0);
		ki : IN std_logic_vector(15 downto 0);
		reset : IN std_logic;          
		error_sum : OUT std_logic_vector(15 downto 0);
		pid_count : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_pid_control: pid_control PORT MAP(
		clk => ,
		error => ,
		val => ,
		pre_clk => ,
		kp => ,
		ki => ,
		reset => ,
		error_sum => ,
		pid_count => 
	);


