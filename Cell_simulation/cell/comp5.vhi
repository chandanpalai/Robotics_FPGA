
-- VHDL Instantiation Created from source file comp5.vhd -- 02:35:01 03/20/2013
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT comp5
	PORT(
		da : IN std_logic_vector(4 downto 0);
		db : IN std_logic_vector(4 downto 0);
		donea : IN std_logic;
		doneb : IN std_logic;
		a : IN std_logic_vector(2 downto 0);
		b : IN std_logic_vector(2 downto 0);
		bora : IN std_logic;
		borb : IN std_logic;          
		dout : OUT std_logic_vector(4 downto 0);
		doneout : OUT std_logic;
		iout : OUT std_logic_vector(2 downto 0);
		borout : OUT std_logic
		);
	END COMPONENT;

	Inst_comp5: comp5 PORT MAP(
		da => ,
		db => ,
		donea => ,
		doneb => ,
		a => ,
		b => ,
		bora => ,
		borb => ,
		dout => ,
		doneout => ,
		iout => ,
		borout => 
	);


