-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_ofdm_modulator_block.vhd
-- Created: 2024-08-31 22:08:52
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_ofdm_modulator_block
-- Source Path: HDLModulatorFull/full_ofdm_modulator/ofdm_modulator
-- Hierarchy Level: 1
-- Model version: 1.21
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_ofdm_modulator_ip_src_ofdm_modulator_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_in_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_in                          :   IN    std_logic;
        cp_len                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic;
        ready                             :   OUT   std_logic
        );
END full_ofdm_modulator_ip_src_ofdm_modulator_block;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_ofdm_modulator_block IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_src_OFDM_Modulator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid                           :   IN    std_logic;
          FFTLen                          :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          CPLen                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          numLgSc                         :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          numRgSc                         :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          data_re_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_im_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_1                         :   OUT   std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_src_OFDM_Modulator
    USE ENTITY work.full_ofdm_modulator_ip_src_OFDM_Modulator(rtl);

  -- Signals
  SIGNAL Constant2_out1                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Constant4_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant3_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL data_re                          : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL data_im                          : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL valid                            : std_logic;

BEGIN
  u_OFDM_Modulator : full_ofdm_modulator_ip_src_OFDM_Modulator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_re => data_in_re,  -- sfix12_En10
              data_im => data_in_im,  -- sfix12_En10
              valid => valid_in,
              FFTLen => std_logic_vector(Constant2_out1),  -- ufix9
              CPLen => cp_len,  -- uint8
              numLgSc => std_logic_vector(Constant4_out1),  -- ufix6
              numRgSc => std_logic_vector(Constant3_out1),  -- ufix6
              data_re_1 => data_re,  -- sfix12_En10
              data_im_1 => data_im,  -- sfix12_En10
              valid_1 => valid,
              ready => ready
              );

  Constant2_out1 <= to_unsigned(16#100#, 9);

  Constant4_out1 <= to_unsigned(16#19#, 6);

  Constant3_out1 <= to_unsigned(16#25#, 6);

  data_out_re <= data_re;

  data_out_im <= data_im;

  valid_out <= valid;

END rtl;
