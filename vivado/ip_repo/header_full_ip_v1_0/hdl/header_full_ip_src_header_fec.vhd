-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLHeaderFull/header_full_ip_src_header_fec.vhd
-- Created: 2024-08-31 15:23:55
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: header_full_ip_src_header_fec
-- Source Path: HDLHeaderFull/header_full/header_fec
-- Hierarchy Level: 1
-- Model version: 1.18
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY header_full_ip_src_header_fec IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic;
        ctrl_in_start                     :   IN    std_logic;
        ctrl_in_end                       :   IN    std_logic;
        ctrl_in_valid                     :   IN    std_logic;
        data_out                          :   OUT   std_logic;
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic;
        next_frame                        :   OUT   std_logic
        );
END header_full_ip_src_header_fec;


ARCHITECTURE rtl OF header_full_ip_src_header_fec IS

  -- Component Declarations
  COMPONENT header_full_ip_src_Hc_12H_B14
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          in0                             :   IN    std_logic;
          in1_start                       :   IN    std_logic;
          in1_end                         :   IN    std_logic;
          in1_valid                       :   IN    std_logic;
          out0                            :   OUT   std_logic;
          out1_start                      :   OUT   std_logic;
          out1_end                        :   OUT   std_logic;
          out1_valid                      :   OUT   std_logic;
          out2                            :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : header_full_ip_src_Hc_12H_B14
    USE ENTITY work.header_full_ip_src_Hc_12H_B14(rtl);

  -- Signals
  SIGNAL Hc_12H_B14_out1                  : std_logic;
  SIGNAL Hc_12H_B14_out2_start            : std_logic;
  SIGNAL Hc_12H_B14_out2_end              : std_logic;
  SIGNAL Hc_12H_B14_out2_valid            : std_logic;
  SIGNAL Hc_12H_B14_out3                  : std_logic;

BEGIN
  u_Hc_12H_B14 : header_full_ip_src_Hc_12H_B14
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              in0 => data_in,
              in1_start => ctrl_in_start,
              in1_end => ctrl_in_end,
              in1_valid => ctrl_in_valid,
              out0 => Hc_12H_B14_out1,
              out1_start => Hc_12H_B14_out2_start,
              out1_end => Hc_12H_B14_out2_end,
              out1_valid => Hc_12H_B14_out2_valid,
              out2 => Hc_12H_B14_out3
              );

  data_out <= Hc_12H_B14_out1;

  ctrl_out_start <= Hc_12H_B14_out2_start;

  ctrl_out_end <= Hc_12H_B14_out2_end;

  ctrl_out_valid <= Hc_12H_B14_out2_valid;

  next_frame <= Hc_12H_B14_out3;

END rtl;
