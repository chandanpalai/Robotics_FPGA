----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:08 04/27/2012 
-- Design Name: 
-- Module Name:    pid_control - Behavioral 
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
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pid_control is
    Port ( clk: in std_logic;
			  error : in  STD_LOGIC_VECTOR (15 downto 0);
			  val: in  STD_LOGIC_VECTOR (15 downto 0);
           pre_clk : in  STD_LOGIC;
           kp : in  STD_LOGIC_VECTOR (15 downto 0);
           ki : in  STD_LOGIC_VECTOR (15 downto 0);
			  reset: in std_logic;
			  error_sum : out  STD_LOGIC_VECTOR (15 downto 0);
           pid_count : out  STD_LOGIC_VECTOR (31 downto 0));
end pid_control;

architecture Behavioral of pid_control is

COMPONENT accum_err_sum_16bits IS
  PORT (
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

COMPONENT add_32 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clk : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mult_16 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

signal kp_times_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal ki_times_err_sum: std_logic_vector(31 downto 0) := (others => '0');
signal temp_sum: std_logic_vector(15 downto 0);

signal pid_cnt : std_logic_vector(31 downto 0);

begin

temp_sum <= val;
--accumulate sum of all the errors
integrate0: accum_err_sum_16bits port map( error, clk, pre_clk, reset, temp_sum);

--multiply kp with error
mult0: mult_16 port map( clk, kp, error, kp_times_error);

--multiply ki with error sum
mult1: mult_16 port map( clk, ki, temp_sum, ki_times_err_sum);

--add kp_times_error and ki_times_err_sum
add1: add_32 port map( ki_times_err_sum, kp_times_error, clk, pid_cnt);

pid_count <= pid_cnt;
error_sum <= temp_sum;
end Behavioral;