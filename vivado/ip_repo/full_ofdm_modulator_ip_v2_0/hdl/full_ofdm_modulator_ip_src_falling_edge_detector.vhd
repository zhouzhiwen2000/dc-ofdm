-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_falling_edge_detector.vhd
-- Created: 2024-09-01 00:44:13
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_falling_edge_detector
-- Source Path: HDLModulatorFull/full_ofdm_modulator/interpolator/falling_edge_detector
-- Hierarchy Level: 2
-- Model version: 1.36
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_ofdm_modulator_ip_src_falling_edge_detector IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        in_rsvd                           :   IN    std_logic;
        out_rsvd                          :   OUT   std_logic
        );
END full_ofdm_modulator_ip_src_falling_edge_detector;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_falling_edge_detector IS

  -- Signals
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  Logical_Operator1_out1 <=  NOT in_rsvd;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay_out1 <= in_rsvd;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator_out1 <= Logical_Operator1_out1 AND Delay_out1;

  out_rsvd <= Logical_Operator_out1;

END rtl;
