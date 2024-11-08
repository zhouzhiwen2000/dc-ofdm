-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Normalize_numerator.vhd
-- Created: 2024-10-04 10:51:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Normalize_numerator
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized/ForEach - Real Divide/Normalize numerato
-- Hierarchy Level: 6
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_Normalize_numerator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        u                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validIn                           :   IN    std_logic;
        x                                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        e                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
        isNegative                        :   OUT   std_logic
        );
END rx_demod_optimized_src_Normalize_numerator;


ARCHITECTURE rtl OF rx_demod_optimized_src_Normalize_numerator IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_positiveRealNormalizer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_positiveRealNormalizer
    USE ENTITY work.rx_demod_optimized_src_positiveRealNormalizer(rtl);

  -- Signals
  SIGNAL x_tmp                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL e_tmp                            : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_positiveRealNormalizer : rx_demod_optimized_src_positiveRealNormalizer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              u => u,  -- sfix16_En14
              validIn => validIn,
              x => x_tmp,  -- sfix16_En14
              e => e_tmp,  -- int32
              isNegative => isNegative
              );

  x <= x_tmp;

  e <= e_tmp;

END rtl;

