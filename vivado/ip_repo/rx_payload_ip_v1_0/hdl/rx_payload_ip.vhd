-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxPayload/rx_payload_ip.vhd
-- Created: 2024-10-03 13:10:13
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
-- Module: rx_payload_ip
-- Source Path: rx_payload_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_payload_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        valid_in                          :   IN    std_logic;  -- ufix1
        last_frame                        :   IN    std_logic;  -- ufix1
        new_frame                         :   IN    std_logic;  -- ufix1
        scrambler_init                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        fec_rate                          :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        block_size                        :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        data_out                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        valid_out                         :   OUT   std_logic;  -- ufix1
        ready                             :   OUT   std_logic  -- ufix1
        );
END rx_payload_ip;


ARCHITECTURE rtl OF rx_payload_ip IS

  -- Component Declarations
  COMPONENT rx_payload_ip_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_payload_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          data_in                         :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          valid_in                        :   IN    std_logic;  -- ufix1
          last_frame                      :   IN    std_logic;  -- ufix1
          new_frame                       :   IN    std_logic;  -- ufix1
          scrambler_init_0                :   IN    std_logic;  -- ufix1
          scrambler_init_1                :   IN    std_logic;  -- ufix1
          scrambler_init_2                :   IN    std_logic;  -- ufix1
          scrambler_init_3                :   IN    std_logic;  -- ufix1
          fec_rate_0                      :   IN    std_logic;  -- ufix1
          fec_rate_1                      :   IN    std_logic;  -- ufix1
          fec_rate_2                      :   IN    std_logic;  -- ufix1
          block_size_0                    :   IN    std_logic;  -- ufix1
          block_size_1                    :   IN    std_logic;  -- ufix1
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
          ce_out_0                        :   OUT   std_logic;  -- ufix1
          ce_out_1                        :   OUT   std_logic;  -- ufix1
          data_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          valid_out                       :   OUT   std_logic;  -- ufix1
          ready                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_payload_ip_reset_sync
    USE ENTITY work.rx_payload_ip_reset_sync(rtl);

  FOR ALL : rx_payload_ip_dut
    USE ENTITY work.rx_payload_ip_dut(rtl);

  -- Signals
  SIGNAL reset_x                          : std_logic;
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL data_in_unsigned                 : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL data_in_sig                      : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL scrambler_init_unsigned          : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL scrambler_init_slice             : std_logic;  -- ufix1
  SIGNAL scrambler_init_slice_1           : std_logic;  -- ufix1
  SIGNAL scrambler_init_slice_2           : std_logic;  -- ufix1
  SIGNAL scrambler_init_slice_3           : std_logic;  -- ufix1
  SIGNAL fec_rate_unsigned                : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL fec_rate_slice                   : std_logic;  -- ufix1
  SIGNAL fec_rate_slice_1                 : std_logic;  -- ufix1
  SIGNAL fec_rate_slice_2                 : std_logic;  -- ufix1
  SIGNAL block_size_unsigned              : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL block_size_slice                 : std_logic;  -- ufix1
  SIGNAL block_size_slice_1               : std_logic;  -- ufix1
  SIGNAL psdu_size_unsigned               : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL psdu_size_slice                  : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_1                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_2                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_3                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_4                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_5                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_6                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_7                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_8                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_9                : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_10               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_11               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_12               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_13               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_14               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_15               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_16               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_17               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_18               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_19               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_20               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_21               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_22               : std_logic;  -- ufix1
  SIGNAL psdu_size_slice_23               : std_logic;  -- ufix1
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ce_out_0_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_1_sig                     : std_logic;  -- ufix1
  SIGNAL data_out_sig                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1
  SIGNAL ready_sig                        : std_logic;  -- ufix1

BEGIN
  u_rx_payload_ip_reset_sync_inst : rx_payload_ip_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_cm,  -- ufix1
              reset_out => reset_x
              );

  u_rx_payload_ip_dut_inst : rx_payload_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              dut_enable => dut_enable,  -- ufix1
              data_in => std_logic_vector(data_in_sig),  -- sfix4_En1
              valid_in => valid_in,  -- ufix1
              last_frame => last_frame,  -- ufix1
              new_frame => new_frame,  -- ufix1
              scrambler_init_0 => scrambler_init_slice,  -- ufix1
              scrambler_init_1 => scrambler_init_slice_1,  -- ufix1
              scrambler_init_2 => scrambler_init_slice_2,  -- ufix1
              scrambler_init_3 => scrambler_init_slice_3,  -- ufix1
              fec_rate_0 => fec_rate_slice,  -- ufix1
              fec_rate_1 => fec_rate_slice_1,  -- ufix1
              fec_rate_2 => fec_rate_slice_2,  -- ufix1
              block_size_0 => block_size_slice,  -- ufix1
              block_size_1 => block_size_slice_1,  -- ufix1
              psdu_size_0 => psdu_size_slice,  -- ufix1
              psdu_size_1 => psdu_size_slice_1,  -- ufix1
              psdu_size_2 => psdu_size_slice_2,  -- ufix1
              psdu_size_3 => psdu_size_slice_3,  -- ufix1
              psdu_size_4 => psdu_size_slice_4,  -- ufix1
              psdu_size_5 => psdu_size_slice_5,  -- ufix1
              psdu_size_6 => psdu_size_slice_6,  -- ufix1
              psdu_size_7 => psdu_size_slice_7,  -- ufix1
              psdu_size_8 => psdu_size_slice_8,  -- ufix1
              psdu_size_9 => psdu_size_slice_9,  -- ufix1
              psdu_size_10 => psdu_size_slice_10,  -- ufix1
              psdu_size_11 => psdu_size_slice_11,  -- ufix1
              psdu_size_12 => psdu_size_slice_12,  -- ufix1
              psdu_size_13 => psdu_size_slice_13,  -- ufix1
              psdu_size_14 => psdu_size_slice_14,  -- ufix1
              psdu_size_15 => psdu_size_slice_15,  -- ufix1
              psdu_size_16 => psdu_size_slice_16,  -- ufix1
              psdu_size_17 => psdu_size_slice_17,  -- ufix1
              psdu_size_18 => psdu_size_slice_18,  -- ufix1
              psdu_size_19 => psdu_size_slice_19,  -- ufix1
              psdu_size_20 => psdu_size_slice_20,  -- ufix1
              psdu_size_21 => psdu_size_slice_21,  -- ufix1
              psdu_size_22 => psdu_size_slice_22,  -- ufix1
              psdu_size_23 => psdu_size_slice_23,  -- ufix1
              ce_out_0 => ce_out_0_sig,  -- ufix1
              ce_out_1 => ce_out_1_sig,  -- ufix1
              data_out => data_out_sig,  -- ufix8
              valid_out => valid_out_sig,  -- ufix1
              ready => ready_sig  -- ufix1
              );

  dut_enable <= '1';

  data_in_unsigned <= unsigned(data_in);

  data_in_sig <= signed(data_in_unsigned);

  scrambler_init_unsigned <= unsigned(scrambler_init);

  scrambler_init_slice <= scrambler_init_unsigned(0);

  scrambler_init_slice_1 <= scrambler_init_unsigned(1);

  scrambler_init_slice_2 <= scrambler_init_unsigned(2);

  scrambler_init_slice_3 <= scrambler_init_unsigned(3);

  fec_rate_unsigned <= unsigned(fec_rate);

  fec_rate_slice <= fec_rate_unsigned(0);

  fec_rate_slice_1 <= fec_rate_unsigned(1);

  fec_rate_slice_2 <= fec_rate_unsigned(2);

  block_size_unsigned <= unsigned(block_size);

  block_size_slice <= block_size_unsigned(0);

  block_size_slice_1 <= block_size_unsigned(1);

  psdu_size_unsigned <= unsigned(psdu_size);

  psdu_size_slice <= psdu_size_unsigned(0);

  psdu_size_slice_1 <= psdu_size_unsigned(1);

  psdu_size_slice_2 <= psdu_size_unsigned(2);

  psdu_size_slice_3 <= psdu_size_unsigned(3);

  psdu_size_slice_4 <= psdu_size_unsigned(4);

  psdu_size_slice_5 <= psdu_size_unsigned(5);

  psdu_size_slice_6 <= psdu_size_unsigned(6);

  psdu_size_slice_7 <= psdu_size_unsigned(7);

  psdu_size_slice_8 <= psdu_size_unsigned(8);

  psdu_size_slice_9 <= psdu_size_unsigned(9);

  psdu_size_slice_10 <= psdu_size_unsigned(10);

  psdu_size_slice_11 <= psdu_size_unsigned(11);

  psdu_size_slice_12 <= psdu_size_unsigned(12);

  psdu_size_slice_13 <= psdu_size_unsigned(13);

  psdu_size_slice_14 <= psdu_size_unsigned(14);

  psdu_size_slice_15 <= psdu_size_unsigned(15);

  psdu_size_slice_16 <= psdu_size_unsigned(16);

  psdu_size_slice_17 <= psdu_size_unsigned(17);

  psdu_size_slice_18 <= psdu_size_unsigned(18);

  psdu_size_slice_19 <= psdu_size_unsigned(19);

  psdu_size_slice_20 <= psdu_size_unsigned(20);

  psdu_size_slice_21 <= psdu_size_unsigned(21);

  psdu_size_slice_22 <= psdu_size_unsigned(22);

  psdu_size_slice_23 <= psdu_size_unsigned(23);

  reset_cm <=  NOT IPCORE_RESETN;

  data_out <= data_out_sig;

  valid_out <= valid_out_sig;

  ready <= ready_sig;

END rtl;
