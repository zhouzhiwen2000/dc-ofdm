-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_falling_edge_detector.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_falling_edge_detector
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_rx_counter/falling_edge_detector
-- Hierarchy Level: 2
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_ip_src_falling_edge_detector IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        in_rsvd                           :   IN    std_logic;
        out_rsvd                          :   OUT   std_logic
        );
END rx_demod_ip_src_falling_edge_detector;


ARCHITECTURE rtl OF rx_demod_ip_src_falling_edge_detector IS

  -- Signals
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL in_rsvd_1                        : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  Logical_Operator1_out1 <=  NOT in_rsvd;

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        in_rsvd_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        in_rsvd_1 <= in_rsvd;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  Logical_Operator_out1 <= Logical_Operator1_out1 AND in_rsvd_1;

  out_rsvd <= Logical_Operator_out1;

END rtl;
