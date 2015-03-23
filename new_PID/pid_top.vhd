----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:36:18 04/02/2012 
-- Design Name: 
-- Module Name:    pid_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pid_top is
    Port ( quadA : in  STD_LOGIC;
           quadB : in  STD_LOGIC;
           clk_50 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  motor_enable : out std_logic;
			  motor_plus: out std_logic;
			  motor_minus: out std_logic;
           disp_out : out  STD_LOGIC_VECTOR (11 downto 0));
end pid_top;

architecture Behavioral of pid_top is

component quad_decoder is
    Port ( quadA      : in  STD_LOGIC;
           quadB      : in  STD_LOGIC;
           clk_50     : in  STD_LOGIC;
           reset      : in  STD_LOGIC;
			  quad_count : out std_logic_vector(14 downto 0));
end component;

component display is
    Port (  clk:in STD_LOGIC;
				num:in STD_LOGIC_VECTOR(12 downto 0);
				op : out  STD_LOGIC_VECTOR (11 downto 0));
end component;


component pid_control is
    Port ( clk: in std_logic;
			  error : in  STD_LOGIC_VECTOR (15 downto 0);
			  val: in  STD_LOGIC_VECTOR (15 downto 0);
           pre_clk : in  STD_LOGIC;
           kp : in  STD_LOGIC_VECTOR (15 downto 0);
           ki : in  STD_LOGIC_VECTOR (15 downto 0);
			  reset: in std_logic;
			  error_sum : out  STD_LOGIC_VECTOR (15 downto 0);
           pid_count : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component prescalar is
    Port ( clk_50 : in  STD_LOGIC;
	        reset : in std_logic;
           clk_100hz : out  STD_LOGIC);
end component;

COMPONENT pwm_gen is
    Port ( high_time : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
			  reset: in std_logic;
           pwm_out : out  STD_LOGIC);
end COMPONENT;

component Pid_bounder is
    Port ( pid_count : in  STD_LOGIC_VECTOR (31 downto 0);
           quad_desired : in  STD_LOGIC_VECTOR (14 downto 0);
           high_time : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component subtractor_15bit_error IS
  PORT (
    a : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
    clk : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END component;

signal clk_100hz: std_logic;

signal quad_d: std_logic_vector(14 downto 0);
signal quad_des: std_logic_vector(14 downto 0);

signal quad_c: std_logic_vector(14 downto 0);
--constant quad_desired: std_logic_vector(14 downto 0):="000001001110011";
constant quad_desired: std_logic_vector(14 downto 0):="000000101110010";

signal error: std_logic_vector(15 downto 0);
signal error_sum: std_logic_vector(15 downto 0) := (others => '0');

constant kp: std_logic_vector(15 downto 0):="0000000000001101";
constant ki: std_logic_vector(15 downto 0):="0000000000000101";
signal pid_cnt_signal: std_logic_vector(31 downto 0) := (others => '0');

signal val_accum: std_logic_vector(15 downto 0);

signal high_time: std_logic_vector(15 downto 0);
signal pwm : std_logic;

begin
	
	qD: quad_decoder port map (quadA, quadB, clk_50, clk_100hz, quad_c);
	inst_disp: display port map (clk_50, quad_c(12 downto 0), disp_out);
	prescale: prescalar port map(clk_50, reset, clk_100hz);
	
	quad_d <= quad_desired;
	sub0: subtractor_15bit_error port map (quad_c, quad_d, clk_50, error);
	
   val_accum <= error_sum;
	quad_des <= quad_desired;
	pid0: pid_control port map(clk_50, error, val_accum, clk_100hz, kp, ki, reset, error_sum, pid_cnt_signal);
	inst_bounder: Pid_bounder port map(pid_cnt_signal, quad_des, high_time);
	pwm0: pwm_gen port map(high_time, clk_50, reset, pwm);
	motor_enable<=pwm;
	motor_plus<='1';
	motor_minus<='0';  
	
end Behavioral;