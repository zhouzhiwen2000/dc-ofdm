-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLHeaderFull/header_full_ip_dut.vhd
-- Created: 2024-08-31 15:25:56
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: header_full_ip_dut
-- Source Path: header_full_ip/header_full_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY header_full_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        new_frame                         :   IN    std_logic;  -- ufix1
        psdu_size_0                       :   IN    std_logic;  -- ufix1
        psdu_size_1                       :   IN    std_logic;  -- ufix1
        psdu_size_2                       :   IN    std_logic;  -- ufix1
        psdu_size_3                       :   IN    std_logic;  -- ufix1
        psdu_size_4                       :   IN    std_logic;  -- ufix1
        psdu_size_5                       :   IN    std_logic;  -- ufix1
        psdu_size_6                       :   IN    std_logic;  -- ufix1
        psdu_size_7                       :   IN    std_logic;  -- ufix1
        psdu_size_8                       :   IN    std_logic;  -- ufix1
        psdu_size_9                       :   IN    std_logic;  -- ufix1
        psdu_size_10                      :   IN    std_logic;  -- ufix1
        psdu_size_11                      :   IN    std_logic;  -- ufix1
        psdu_size_12                      :   IN    std_logic;  -- ufix1
        psdu_size_13                      :   IN    std_logic;  -- ufix1
        psdu_size_14                      :   IN    std_logic;  -- ufix1
        psdu_size_15                      :   IN    std_logic;  -- ufix1
        psdu_size_16                      :   IN    std_logic;  -- ufix1
        psdu_size_17                      :   IN    std_logic;  -- ufix1
        psdu_size_18                      :   IN    std_logic;  -- ufix1
        psdu_size_19                      :   IN    std_logic;  -- ufix1
        psdu_size_20                      :   IN    std_logic;  -- ufix1
        psdu_size_21                      :   IN    std_logic;  -- ufix1
        psdu_size_22                      :   IN    std_logic;  -- ufix1
        psdu_size_23                      :   IN    std_logic;  -- ufix1
        msg_duration_0                    :   IN    std_logic;  -- ufix1
        msg_duration_1                    :   IN    std_logic;  -- ufix1
        msg_duration_2                    :   IN    std_logic;  -- ufix1
        msg_duration_3                    :   IN    std_logic;  -- ufix1
        msg_duration_4                    :   IN    std_logic;  -- ufix1
        msg_duration_5                    :   IN    std_logic;  -- ufix1
        msg_duration_6                    :   IN    std_logic;  -- ufix1
        msg_duration_7                    :   IN    std_logic;  -- ufix1
        msg_duration_8                    :   IN    std_logic;  -- ufix1
        msg_duration_9                    :   IN    std_logic;  -- ufix1
        msg_duration_10                   :   IN    std_logic;  -- ufix1
        msg_duration_11                   :   IN    std_logic;  -- ufix1
        msg_duration_12                   :   IN    std_logic;  -- ufix1
        msg_duration_13                   :   IN    std_logic;  -- ufix1
        msg_duration_14                   :   IN    std_logic;  -- ufix1
        msg_duration_15                   :   IN    std_logic;  -- ufix1
        block_size_0                      :   IN    std_logic;  -- ufix1
        block_size_1                      :   IN    std_logic;  -- ufix1
        fec_rate_0                        :   IN    std_logic;  -- ufix1
        fec_rate_1                        :   IN    std_logic;  -- ufix1
        fec_rate_2                        :   IN    std_logic;  -- ufix1
        rep_number_0                      :   IN    std_logic;  -- ufix1
        rep_number_1                      :   IN    std_logic;  -- ufix1
        rep_number_2                      :   IN    std_logic;  -- ufix1
        concat_factor_0                   :   IN    std_logic;  -- ufix1
        concat_factor_1                   :   IN    std_logic;  -- ufix1
        concat_factor_2                   :   IN    std_logic;  -- ufix1
        scrambler_init_0                  :   IN    std_logic;  -- ufix1
        scrambler_init_1                  :   IN    std_logic;  -- ufix1
        scrambler_init_2                  :   IN    std_logic;  -- ufix1
        scrambler_init_3                  :   IN    std_logic;  -- ufix1
        bat_id_0                          :   IN    std_logic;  -- ufix1
        bat_id_1                          :   IN    std_logic;  -- ufix1
        bat_id_2                          :   IN    std_logic;  -- ufix1
        bat_id_3                          :   IN    std_logic;  -- ufix1
        bat_id_4                          :   IN    std_logic;  -- ufix1
        cp_id_0                           :   IN    std_logic;  -- ufix1
        cp_id_1                           :   IN    std_logic;  -- ufix1
        cp_id_2                           :   IN    std_logic;  -- ufix1
        mimo_spacing_0                    :   IN    std_logic;  -- ufix1
        mimo_spacing_1                    :   IN    std_logic;  -- ufix1
        mimo_spacing_2                    :   IN    std_logic;  -- ufix1
        mimo_number_0                     :   IN    std_logic;  -- ufix1
        mimo_number_1                     :   IN    std_logic;  -- ufix1
        mimo_number_2                     :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        header                            :   OUT   std_logic;  -- ufix1
        ctrl_out_start                    :   OUT   std_logic;  -- ufix1
        ctrl_out_end                      :   OUT   std_logic;  -- ufix1
        ctrl_out_valid                    :   OUT   std_logic;  -- ufix1
        next_frame                        :   OUT   std_logic  -- ufix1
        );
END header_full_ip_dut;


ARCHITECTURE rtl OF header_full_ip_dut IS

  -- Component Declarations
  COMPONENT header_full_ip_src_header_full
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          new_frame                       :   IN    std_logic;  -- ufix1
          psdu_size_0                     :   IN    std_logic;  -- ufix1
          psdu_size_1                     :   IN    std_logic;  -- ufix1
          psdu_size_2                     :   IN    std_logic;  -- ufix1
          psdu_size_3                     :   IN    std_logic;  -- ufix1
          psdu_size_4                     :   IN    std_logic;  -- ufix1
          psdu_size_5                     :   IN    std_logic;  -- ufix1
          psdu_size_6                     :   IN    std_logic;  -- ufix1
          psdu_size_7                     :   IN    std_logic;  -- ufix1
          psdu_size_8                     :   IN    std_logic;  -- ufix1
          psdu_size_9                     :   IN    std_logic;  -- ufix1
          psdu_size_10                    :   IN    std_logic;  -- ufix1
          psdu_size_11                    :   IN    std_logic;  -- ufix1
          psdu_size_12                    :   IN    std_logic;  -- ufix1
          psdu_size_13                    :   IN    std_logic;  -- ufix1
          psdu_size_14                    :   IN    std_logic;  -- ufix1
          psdu_size_15                    :   IN    std_logic;  -- ufix1
          psdu_size_16                    :   IN    std_logic;  -- ufix1
          psdu_size_17                    :   IN    std_logic;  -- ufix1
          psdu_size_18                    :   IN    std_logic;  -- ufix1
          psdu_size_19                    :   IN    std_logic;  -- ufix1
          psdu_size_20                    :   IN    std_logic;  -- ufix1
          psdu_size_21                    :   IN    std_logic;  -- ufix1
          psdu_size_22                    :   IN    std_logic;  -- ufix1
          psdu_size_23                    :   IN    std_logic;  -- ufix1
          msg_duration_0                  :   IN    std_logic;  -- ufix1
          msg_duration_1                  :   IN    std_logic;  -- ufix1
          msg_duration_2                  :   IN    std_logic;  -- ufix1
          msg_duration_3                  :   IN    std_logic;  -- ufix1
          msg_duration_4                  :   IN    std_logic;  -- ufix1
          msg_duration_5                  :   IN    std_logic;  -- ufix1
          msg_duration_6                  :   IN    std_logic;  -- ufix1
          msg_duration_7                  :   IN    std_logic;  -- ufix1
          msg_duration_8                  :   IN    std_logic;  -- ufix1
          msg_duration_9                  :   IN    std_logic;  -- ufix1
          msg_duration_10                 :   IN    std_logic;  -- ufix1
          msg_duration_11                 :   IN    std_logic;  -- ufix1
          msg_duration_12                 :   IN    std_logic;  -- ufix1
          msg_duration_13                 :   IN    std_logic;  -- ufix1
          msg_duration_14                 :   IN    std_logic;  -- ufix1
          msg_duration_15                 :   IN    std_logic;  -- ufix1
          block_size_0                    :   IN    std_logic;  -- ufix1
          block_size_1                    :   IN    std_logic;  -- ufix1
          fec_rate_0                      :   IN    std_logic;  -- ufix1
          fec_rate_1                      :   IN    std_logic;  -- ufix1
          fec_rate_2                      :   IN    std_logic;  -- ufix1
          rep_number_0                    :   IN    std_logic;  -- ufix1
          rep_number_1                    :   IN    std_logic;  -- ufix1
          rep_number_2                    :   IN    std_logic;  -- ufix1
          concat_factor_0                 :   IN    std_logic;  -- ufix1
          concat_factor_1                 :   IN    std_logic;  -- ufix1
          concat_factor_2                 :   IN    std_logic;  -- ufix1
          scrambler_init_0                :   IN    std_logic;  -- ufix1
          scrambler_init_1                :   IN    std_logic;  -- ufix1
          scrambler_init_2                :   IN    std_logic;  -- ufix1
          scrambler_init_3                :   IN    std_logic;  -- ufix1
          bat_id_0                        :   IN    std_logic;  -- ufix1
          bat_id_1                        :   IN    std_logic;  -- ufix1
          bat_id_2                        :   IN    std_logic;  -- ufix1
          bat_id_3                        :   IN    std_logic;  -- ufix1
          bat_id_4                        :   IN    std_logic;  -- ufix1
          cp_id_0                         :   IN    std_logic;  -- ufix1
          cp_id_1                         :   IN    std_logic;  -- ufix1
          cp_id_2                         :   IN    std_logic;  -- ufix1
          mimo_spacing_0                  :   IN    std_logic;  -- ufix1
          mimo_spacing_1                  :   IN    std_logic;  -- ufix1
          mimo_spacing_2                  :   IN    std_logic;  -- ufix1
          mimo_number_0                   :   IN    std_logic;  -- ufix1
          mimo_number_1                   :   IN    std_logic;  -- ufix1
          mimo_number_2                   :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          header                          :   OUT   std_logic;  -- ufix1
          ctrl_out_start                  :   OUT   std_logic;  -- ufix1
          ctrl_out_end                    :   OUT   std_logic;  -- ufix1
          ctrl_out_valid                  :   OUT   std_logic;  -- ufix1
          next_frame                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : header_full_ip_src_header_full
    USE ENTITY work.header_full_ip_src_header_full(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL new_frame_sig                    : std_logic;  -- ufix1
  SIGNAL psdu_size_0_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_1_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_2_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_3_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_4_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_5_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_6_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_7_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_8_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_9_sig                  : std_logic;  -- ufix1
  SIGNAL psdu_size_10_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_11_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_12_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_13_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_14_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_15_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_16_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_17_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_18_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_19_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_20_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_21_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_22_sig                 : std_logic;  -- ufix1
  SIGNAL psdu_size_23_sig                 : std_logic;  -- ufix1
  SIGNAL msg_duration_0_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_1_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_2_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_3_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_4_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_5_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_6_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_7_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_8_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_9_sig               : std_logic;  -- ufix1
  SIGNAL msg_duration_10_sig              : std_logic;  -- ufix1
  SIGNAL msg_duration_11_sig              : std_logic;  -- ufix1
  SIGNAL msg_duration_12_sig              : std_logic;  -- ufix1
  SIGNAL msg_duration_13_sig              : std_logic;  -- ufix1
  SIGNAL msg_duration_14_sig              : std_logic;  -- ufix1
  SIGNAL msg_duration_15_sig              : std_logic;  -- ufix1
  SIGNAL block_size_0_sig                 : std_logic;  -- ufix1
  SIGNAL block_size_1_sig                 : std_logic;  -- ufix1
  SIGNAL fec_rate_0_sig                   : std_logic;  -- ufix1
  SIGNAL fec_rate_1_sig                   : std_logic;  -- ufix1
  SIGNAL fec_rate_2_sig                   : std_logic;  -- ufix1
  SIGNAL rep_number_0_sig                 : std_logic;  -- ufix1
  SIGNAL rep_number_1_sig                 : std_logic;  -- ufix1
  SIGNAL rep_number_2_sig                 : std_logic;  -- ufix1
  SIGNAL concat_factor_0_sig              : std_logic;  -- ufix1
  SIGNAL concat_factor_1_sig              : std_logic;  -- ufix1
  SIGNAL concat_factor_2_sig              : std_logic;  -- ufix1
  SIGNAL scrambler_init_0_sig             : std_logic;  -- ufix1
  SIGNAL scrambler_init_1_sig             : std_logic;  -- ufix1
  SIGNAL scrambler_init_2_sig             : std_logic;  -- ufix1
  SIGNAL scrambler_init_3_sig             : std_logic;  -- ufix1
  SIGNAL bat_id_0_sig                     : std_logic;  -- ufix1
  SIGNAL bat_id_1_sig                     : std_logic;  -- ufix1
  SIGNAL bat_id_2_sig                     : std_logic;  -- ufix1
  SIGNAL bat_id_3_sig                     : std_logic;  -- ufix1
  SIGNAL bat_id_4_sig                     : std_logic;  -- ufix1
  SIGNAL cp_id_0_sig                      : std_logic;  -- ufix1
  SIGNAL cp_id_1_sig                      : std_logic;  -- ufix1
  SIGNAL cp_id_2_sig                      : std_logic;  -- ufix1
  SIGNAL mimo_spacing_0_sig               : std_logic;  -- ufix1
  SIGNAL mimo_spacing_1_sig               : std_logic;  -- ufix1
  SIGNAL mimo_spacing_2_sig               : std_logic;  -- ufix1
  SIGNAL mimo_number_0_sig                : std_logic;  -- ufix1
  SIGNAL mimo_number_1_sig                : std_logic;  -- ufix1
  SIGNAL mimo_number_2_sig                : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL header_sig                       : std_logic;  -- ufix1
  SIGNAL ctrl_out_start_sig               : std_logic;  -- ufix1
  SIGNAL ctrl_out_end_sig                 : std_logic;  -- ufix1
  SIGNAL ctrl_out_valid_sig               : std_logic;  -- ufix1
  SIGNAL next_frame_sig                   : std_logic;  -- ufix1

BEGIN
  u_header_full_ip_src_header_full : header_full_ip_src_header_full
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset_x => reset_x,
              new_frame => new_frame_sig,  -- ufix1
              psdu_size_0 => psdu_size_0_sig,  -- ufix1
              psdu_size_1 => psdu_size_1_sig,  -- ufix1
              psdu_size_2 => psdu_size_2_sig,  -- ufix1
              psdu_size_3 => psdu_size_3_sig,  -- ufix1
              psdu_size_4 => psdu_size_4_sig,  -- ufix1
              psdu_size_5 => psdu_size_5_sig,  -- ufix1
              psdu_size_6 => psdu_size_6_sig,  -- ufix1
              psdu_size_7 => psdu_size_7_sig,  -- ufix1
              psdu_size_8 => psdu_size_8_sig,  -- ufix1
              psdu_size_9 => psdu_size_9_sig,  -- ufix1
              psdu_size_10 => psdu_size_10_sig,  -- ufix1
              psdu_size_11 => psdu_size_11_sig,  -- ufix1
              psdu_size_12 => psdu_size_12_sig,  -- ufix1
              psdu_size_13 => psdu_size_13_sig,  -- ufix1
              psdu_size_14 => psdu_size_14_sig,  -- ufix1
              psdu_size_15 => psdu_size_15_sig,  -- ufix1
              psdu_size_16 => psdu_size_16_sig,  -- ufix1
              psdu_size_17 => psdu_size_17_sig,  -- ufix1
              psdu_size_18 => psdu_size_18_sig,  -- ufix1
              psdu_size_19 => psdu_size_19_sig,  -- ufix1
              psdu_size_20 => psdu_size_20_sig,  -- ufix1
              psdu_size_21 => psdu_size_21_sig,  -- ufix1
              psdu_size_22 => psdu_size_22_sig,  -- ufix1
              psdu_size_23 => psdu_size_23_sig,  -- ufix1
              msg_duration_0 => msg_duration_0_sig,  -- ufix1
              msg_duration_1 => msg_duration_1_sig,  -- ufix1
              msg_duration_2 => msg_duration_2_sig,  -- ufix1
              msg_duration_3 => msg_duration_3_sig,  -- ufix1
              msg_duration_4 => msg_duration_4_sig,  -- ufix1
              msg_duration_5 => msg_duration_5_sig,  -- ufix1
              msg_duration_6 => msg_duration_6_sig,  -- ufix1
              msg_duration_7 => msg_duration_7_sig,  -- ufix1
              msg_duration_8 => msg_duration_8_sig,  -- ufix1
              msg_duration_9 => msg_duration_9_sig,  -- ufix1
              msg_duration_10 => msg_duration_10_sig,  -- ufix1
              msg_duration_11 => msg_duration_11_sig,  -- ufix1
              msg_duration_12 => msg_duration_12_sig,  -- ufix1
              msg_duration_13 => msg_duration_13_sig,  -- ufix1
              msg_duration_14 => msg_duration_14_sig,  -- ufix1
              msg_duration_15 => msg_duration_15_sig,  -- ufix1
              block_size_0 => block_size_0_sig,  -- ufix1
              block_size_1 => block_size_1_sig,  -- ufix1
              fec_rate_0 => fec_rate_0_sig,  -- ufix1
              fec_rate_1 => fec_rate_1_sig,  -- ufix1
              fec_rate_2 => fec_rate_2_sig,  -- ufix1
              rep_number_0 => rep_number_0_sig,  -- ufix1
              rep_number_1 => rep_number_1_sig,  -- ufix1
              rep_number_2 => rep_number_2_sig,  -- ufix1
              concat_factor_0 => concat_factor_0_sig,  -- ufix1
              concat_factor_1 => concat_factor_1_sig,  -- ufix1
              concat_factor_2 => concat_factor_2_sig,  -- ufix1
              scrambler_init_0 => scrambler_init_0_sig,  -- ufix1
              scrambler_init_1 => scrambler_init_1_sig,  -- ufix1
              scrambler_init_2 => scrambler_init_2_sig,  -- ufix1
              scrambler_init_3 => scrambler_init_3_sig,  -- ufix1
              bat_id_0 => bat_id_0_sig,  -- ufix1
              bat_id_1 => bat_id_1_sig,  -- ufix1
              bat_id_2 => bat_id_2_sig,  -- ufix1
              bat_id_3 => bat_id_3_sig,  -- ufix1
              bat_id_4 => bat_id_4_sig,  -- ufix1
              cp_id_0 => cp_id_0_sig,  -- ufix1
              cp_id_1 => cp_id_1_sig,  -- ufix1
              cp_id_2 => cp_id_2_sig,  -- ufix1
              mimo_spacing_0 => mimo_spacing_0_sig,  -- ufix1
              mimo_spacing_1 => mimo_spacing_1_sig,  -- ufix1
              mimo_spacing_2 => mimo_spacing_2_sig,  -- ufix1
              mimo_number_0 => mimo_number_0_sig,  -- ufix1
              mimo_number_1 => mimo_number_1_sig,  -- ufix1
              mimo_number_2 => mimo_number_2_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              header => header_sig,  -- ufix1
              ctrl_out_start => ctrl_out_start_sig,  -- ufix1
              ctrl_out_end => ctrl_out_end_sig,  -- ufix1
              ctrl_out_valid => ctrl_out_valid_sig,  -- ufix1
              next_frame => next_frame_sig  -- ufix1
              );

  new_frame_sig <= new_frame;

  psdu_size_0_sig <= psdu_size_0;

  psdu_size_1_sig <= psdu_size_1;

  psdu_size_2_sig <= psdu_size_2;

  psdu_size_3_sig <= psdu_size_3;

  psdu_size_4_sig <= psdu_size_4;

  psdu_size_5_sig <= psdu_size_5;

  psdu_size_6_sig <= psdu_size_6;

  psdu_size_7_sig <= psdu_size_7;

  psdu_size_8_sig <= psdu_size_8;

  psdu_size_9_sig <= psdu_size_9;

  psdu_size_10_sig <= psdu_size_10;

  psdu_size_11_sig <= psdu_size_11;

  psdu_size_12_sig <= psdu_size_12;

  psdu_size_13_sig <= psdu_size_13;

  psdu_size_14_sig <= psdu_size_14;

  psdu_size_15_sig <= psdu_size_15;

  psdu_size_16_sig <= psdu_size_16;

  psdu_size_17_sig <= psdu_size_17;

  psdu_size_18_sig <= psdu_size_18;

  psdu_size_19_sig <= psdu_size_19;

  psdu_size_20_sig <= psdu_size_20;

  psdu_size_21_sig <= psdu_size_21;

  psdu_size_22_sig <= psdu_size_22;

  psdu_size_23_sig <= psdu_size_23;

  msg_duration_0_sig <= msg_duration_0;

  msg_duration_1_sig <= msg_duration_1;

  msg_duration_2_sig <= msg_duration_2;

  msg_duration_3_sig <= msg_duration_3;

  msg_duration_4_sig <= msg_duration_4;

  msg_duration_5_sig <= msg_duration_5;

  msg_duration_6_sig <= msg_duration_6;

  msg_duration_7_sig <= msg_duration_7;

  msg_duration_8_sig <= msg_duration_8;

  msg_duration_9_sig <= msg_duration_9;

  msg_duration_10_sig <= msg_duration_10;

  msg_duration_11_sig <= msg_duration_11;

  msg_duration_12_sig <= msg_duration_12;

  msg_duration_13_sig <= msg_duration_13;

  msg_duration_14_sig <= msg_duration_14;

  msg_duration_15_sig <= msg_duration_15;

  block_size_0_sig <= block_size_0;

  block_size_1_sig <= block_size_1;

  fec_rate_0_sig <= fec_rate_0;

  fec_rate_1_sig <= fec_rate_1;

  fec_rate_2_sig <= fec_rate_2;

  rep_number_0_sig <= rep_number_0;

  rep_number_1_sig <= rep_number_1;

  rep_number_2_sig <= rep_number_2;

  concat_factor_0_sig <= concat_factor_0;

  concat_factor_1_sig <= concat_factor_1;

  concat_factor_2_sig <= concat_factor_2;

  scrambler_init_0_sig <= scrambler_init_0;

  scrambler_init_1_sig <= scrambler_init_1;

  scrambler_init_2_sig <= scrambler_init_2;

  scrambler_init_3_sig <= scrambler_init_3;

  bat_id_0_sig <= bat_id_0;

  bat_id_1_sig <= bat_id_1;

  bat_id_2_sig <= bat_id_2;

  bat_id_3_sig <= bat_id_3;

  bat_id_4_sig <= bat_id_4;

  cp_id_0_sig <= cp_id_0;

  cp_id_1_sig <= cp_id_1;

  cp_id_2_sig <= cp_id_2;

  mimo_spacing_0_sig <= mimo_spacing_0;

  mimo_spacing_1_sig <= mimo_spacing_1;

  mimo_spacing_2_sig <= mimo_spacing_2;

  mimo_number_0_sig <= mimo_number_0;

  mimo_number_1_sig <= mimo_number_1;

  mimo_number_2_sig <= mimo_number_2;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  header <= header_sig;

  ctrl_out_start <= ctrl_out_start_sig;

  ctrl_out_end <= ctrl_out_end_sig;

  ctrl_out_valid <= ctrl_out_valid_sig;

  next_frame <= next_frame_sig;

END rtl;
