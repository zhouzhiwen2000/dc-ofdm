-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_Normalize_numerator_block1.vhd
-- Created: 2024-10-03 19:36:11
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_Normalize_numerator_block1
-- Source Path: test/divider/in_8_out_16/ForEach - Real Divide/Normalize numerator
-- Hierarchy Level: 3
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY divider_ip_src_Normalize_numerator_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        u                                 :   IN    std_logic_vector(7 DOWNTO 0);  -- sfix8_En6
        validIn                           :   IN    std_logic;
        x                                 :   OUT   std_logic_vector(7 DOWNTO 0);  -- sfix8_En6
        e                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
        isNegative                        :   OUT   std_logic
        );
END divider_ip_src_Normalize_numerator_block1;


ARCHITECTURE rtl OF divider_ip_src_Normalize_numerator_block1 IS

  -- Component Declarations
  COMPONENT divider_ip_src_positiveRealNormalizer_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(7 DOWNTO 0);  -- sfix8_En6
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(7 DOWNTO 0);  -- sfix8_En6
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : divider_ip_src_positiveRealNormalizer_block
    USE ENTITY work.divider_ip_src_positiveRealNormalizer_block(rtl);

  -- Signals
  SIGNAL x_tmp                            : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL e_tmp                            : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL validOutdeadOut                  : std_logic;

BEGIN
  u_positiveRealNormalizer : divider_ip_src_positiveRealNormalizer_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => u,  -- sfix8_En6
              validIn => validIn,
              x => x_tmp,  -- sfix8_En6
              e => e_tmp,  -- int32
              isNegative => isNegative,
              validOut => validOutdeadOut
              );

  x <= x_tmp;

  e <= e_tmp;

END rtl;
