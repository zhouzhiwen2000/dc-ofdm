-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Compare_To_Constant_block1.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Compare_To_Constant_block1
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/m_cox/Compare To Constant
-- Hierarchy Level: 3
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_Compare_To_Constant_block1 IS
  PORT( u                                 :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En31
        y                                 :   OUT   std_logic
        );
END rx_demod_optimized_src_Compare_To_Constant_block1;


ARCHITECTURE rtl OF rx_demod_optimized_src_Compare_To_Constant_block1 IS

  -- Signals
  SIGNAL u_signed                         : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Constant_out1                    : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Compare_out1                     : std_logic;

BEGIN
  u_signed <= signed(u);

  Constant_out1 <= signed'("0000000000010000000000000000000000000000000");

  
  Compare_out1 <= '1' WHEN u_signed >= Constant_out1 ELSE
      '0';

  y <= Compare_out1;

END rtl;
