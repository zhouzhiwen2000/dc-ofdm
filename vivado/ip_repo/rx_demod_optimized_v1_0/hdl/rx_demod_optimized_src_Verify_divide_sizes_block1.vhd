-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Verify_divide_sizes_block1.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Verify_divide_sizes_block1
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/Verify divide 
-- size
-- Hierarchy Level: 4
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_Verify_divide_sizes_block1 IS
  PORT( denominator                       :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
        numerator                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
        den                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
        num                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- ufix16_En10
        );
END rx_demod_optimized_src_Verify_divide_sizes_block1;


ARCHITECTURE rtl OF rx_demod_optimized_src_Verify_divide_sizes_block1 IS

  -- Signals
  SIGNAL denominator_unsigned             : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL numerator_unsigned               : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL den_tmp                          : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL num_tmp                          : unsigned(15 DOWNTO 0);  -- ufix16_En10

BEGIN
  denominator_unsigned <= unsigned(denominator);

  numerator_unsigned <= unsigned(numerator);

  -- Verify that the dimensions of the input arrays match, and then reshape
  -- them.
  den_tmp <= denominator_unsigned;
  num_tmp <= numerator_unsigned;

  den <= std_logic_vector(den_tmp);

  num <= std_logic_vector(num_tmp);

END rtl;
