--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : xaw2vhdl
--  /   /         Filename : dcm.vhd
-- /___/   /\     Timestamp : 07/03/2012 01:00:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st D:\Documents\Studies\Extra Projects\FPGA\Honours project\FPGA codes\VGA instance\VGA\ipcore_dir\.\dcm.xaw D:\Documents\Studies\Extra Projects\FPGA\Honours project\FPGA codes\VGA instance\VGA\ipcore_dir\.\dcm
--Design Name: dcm
--Device: xc3s500e-4fg320
--
-- Module dcm
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dcm is
   port ( CLKIN_IN  : in    std_logic; 
          RST_IN    : in    std_logic; 
          CLKDV_OUT : out   std_logic; 
          CLK0_OUT  : out   std_logic);
end dcm;

architecture BEHAVIORAL of dcm is
   signal CLKDV_BUF : std_logic;
   signal CLKFB_IN  : std_logic;
   signal CLK0_BUF  : std_logic;
   signal GND_BIT   : std_logic;
begin
   GND_BIT <= '0';
   CLK0_OUT <= CLKFB_IN;
   CLKDV_BUFG_INST : BUFG
      port map (I=>CLKDV_BUF,
                O=>CLKDV_OUT);
   
   CLK0_BUFG_INST : BUFG
      port map (I=>CLK0_BUF,
                O=>CLKFB_IN);
   
   DCM_SP_INST : DCM_SP
   generic map( CLK_FEEDBACK => "1X",
            CLKDV_DIVIDE => 2.0,
            CLKFX_DIVIDE => 1,
            CLKFX_MULTIPLY => 4,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 20.000,
            CLKOUT_PHASE_SHIFT => "NONE",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>CLKFB_IN,
                CLKIN=>CLKIN_IN,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>RST_IN,
                CLKDV=>CLKDV_BUF,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>CLK0_BUF,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;


