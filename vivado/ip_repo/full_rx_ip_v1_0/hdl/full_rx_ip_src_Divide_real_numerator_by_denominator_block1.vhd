-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Divide_real_numerator_by_denominator_block1.vhd
-- Created: 2024-10-04 15:18:54
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Divide_real_numerator_by_denominator_block1
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Divide real numerator by denominato
-- Hierarchy Level: 6
-- Model version: 1.101
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Divide_real_numerator_by_denominator_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        num                               :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
        tNum                              :   IN    std_logic_vector(32 DOWNTO 0);  -- sfix33
        den                               :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
        tDen                              :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        isNumNegative                     :   IN    std_logic;
        isDenNegative                     :   IN    std_logic;
        validIn                           :   IN    std_logic;
        y                                 :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
        e                                 :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34
        isDenZero                         :   OUT   std_logic;
        validOut                          :   OUT   std_logic
        );
END full_rx_ip_src_Divide_real_numerator_by_denominator_block1;


ARCHITECTURE rtl OF full_rx_ip_src_Divide_real_numerator_by_denominator_block1 IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_normalizedCORDICDivide_block1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          num                             :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
          den                             :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
          tNum                            :   IN    std_logic_vector(32 DOWNTO 0);  -- sfix33
          tDen                            :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          isNumNegative                   :   IN    std_logic;
          isDenNegative                   :   IN    std_logic;
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
          t                               :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34
          isDenZeroOut                    :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_normalizedCORDICDivide_block1
    USE ENTITY work.full_rx_ip_src_normalizedCORDICDivide_block1(rtl);

  -- Signals
  SIGNAL y_tmp                            : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL t                                : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL isDenZeroOut                     : std_logic;

BEGIN
  u_normalizedCORDICDivide : full_rx_ip_src_normalizedCORDICDivide_block1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              num => num,  -- sfix17_En15
              den => den,  -- sfix17_En15
              tNum => tNum,  -- sfix33
              tDen => tDen,  -- int32
              isNumNegative => isNumNegative,
              isDenNegative => isDenNegative,
              validIn => validIn,
              y => y_tmp,  -- sfix17_En15
              t => t,  -- sfix34
              isDenZeroOut => isDenZeroOut,
              validOut => validOut
              );

  y <= y_tmp;

  e <= t;

  isDenZero <= isDenZeroOut;

END rtl;
