-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLDownshifter/downshift_ip.vhd
-- Created: 2024-09-23 00:12:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: downshift_ip
-- Source Path: downshift_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY downshift_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        valid_in                          :   IN    std_logic;  -- ufix1
        phase_offset                      :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        data_out_real                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        data_out_imag                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix16
        valid_out                         :   OUT   std_logic  -- ufix1
        );
END downshift_ip;


ARCHITECTURE rtl OF downshift_ip IS

  -- Component Declarations
  COMPONENT downshift_ip_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT downshift_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          data_in                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
          valid_in                        :   IN    std_logic;  -- ufix1
          phase_offset                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          ce_out                          :   OUT   std_logic;  -- ufix1
          data_out_real                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_imag                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : downshift_ip_reset_sync
    USE ENTITY work.downshift_ip_reset_sync(rtl);

  FOR ALL : downshift_ip_dut
    USE ENTITY work.downshift_ip_dut(rtl);

  -- Signals
  SIGNAL reset_x                          : std_logic;
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL data_in_unsigned                 : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL data_in_sig                      : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL phase_offset_unsigned            : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL phase_offset_sig                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL data_out_real_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL data_out_imag_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1
  SIGNAL data_out_real_sig_signed         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_out_real_tmp                : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_out_imag_sig_signed         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_out_imag_tmp                : unsigned(15 DOWNTO 0);  -- ufix16

BEGIN
  u_downshift_ip_reset_sync_inst : downshift_ip_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_cm,  -- ufix1
              reset_out => reset_x
              );

  u_downshift_ip_dut_inst : downshift_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              dut_enable => dut_enable,  -- ufix1
              data_in => std_logic_vector(data_in_sig),  -- sfix14_En13
              valid_in => valid_in,  -- ufix1
              phase_offset => std_logic_vector(phase_offset_sig),  -- sfix16_En15
              ce_out => ce_out_sig,  -- ufix1
              data_out_real => data_out_real_sig,  -- sfix16_En14
              data_out_imag => data_out_imag_sig,  -- sfix16_En14
              valid_out => valid_out_sig  -- ufix1
              );

  dut_enable <= '1';

  data_in_unsigned <= unsigned(data_in);

  data_in_sig <= signed(data_in_unsigned);

  phase_offset_unsigned <= unsigned(phase_offset);

  phase_offset_sig <= signed(phase_offset_unsigned);

  reset_cm <=  NOT IPCORE_RESETN;

  data_out_real_sig_signed <= signed(data_out_real_sig);

  data_out_real_tmp <= unsigned(data_out_real_sig_signed);

  data_out_real <= std_logic_vector(data_out_real_tmp);

  data_out_imag_sig_signed <= signed(data_out_imag_sig);

  data_out_imag_tmp <= unsigned(data_out_imag_sig_signed);

  data_out_imag <= std_logic_vector(data_out_imag_tmp);

  valid_out <= valid_out_sig;

END rtl;
