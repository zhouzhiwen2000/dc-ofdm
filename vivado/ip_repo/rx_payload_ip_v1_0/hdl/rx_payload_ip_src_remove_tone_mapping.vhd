-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxPayload/rx_payload_ip_src_remove_tone_mapping.vhd
-- Created: 2024-10-03 13:09:50
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_payload_ip_src_remove_tone_mapping
-- Source Path: HDLRxPayload/rx_payload_full/remove_tone_mapping
-- Hierarchy Level: 1
-- Model version: 1.67
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_payload_ip_src_remove_tone_mapping IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        valid_in                          :   IN    std_logic;
        newFrame                          :   IN    std_logic;
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        data_out                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END rx_payload_ip_src_remove_tone_mapping;


ARCHITECTURE rtl OF rx_payload_ip_src_remove_tone_mapping IS

  -- Component Declarations
  COMPONENT rx_payload_ip_src_valid_to_ctrl
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          validIn                         :   IN    std_logic;
          ctrlOut_start                   :   OUT   std_logic;
          ctrlOut_end                     :   OUT   std_logic;
          ctrlOut_valid                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_payload_ip_src_valid_to_ctrl
    USE ENTITY work.rx_payload_ip_src_valid_to_ctrl(rtl);

  -- Signals
  SIGNAL data_in_signed                   : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL Delay_out1                       : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL count_step                       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_reset                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Count                            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_1                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_2                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_3                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Data_Type_Conversion_out1        : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL Data_Type_Conversion_out1_23     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_22     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_21     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_20     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_19     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_18     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_17     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_16     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_15     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_14     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_13     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_12     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_11     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_10     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_9      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_8      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_7      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_6      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_5      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_4      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_3      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_2      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_1      : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion_out1_0      : std_logic;  -- ufix1
  SIGNAL y                                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Multiply_by_8_out1               : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Multiply_by_2_for_fec_rate_1_2_out1 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Relational_Operator_out1         : std_logic;
  SIGNAL valid_out                        : std_logic;
  SIGNAL valid_to_ctrl_out1_start         : std_logic;
  SIGNAL valid_to_ctrl_out1_end           : std_logic;
  SIGNAL valid_to_ctrl_out1_valid         : std_logic;

BEGIN
  u_valid_to_ctrl : rx_payload_ip_src_valid_to_ctrl
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              validIn => valid_out,
              ctrlOut_start => valid_to_ctrl_out1_start,
              ctrlOut_end => valid_to_ctrl_out1_end,
              ctrlOut_valid => valid_to_ctrl_out1_valid
              );

  data_in_signed <= signed(data_in);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        Delay_out1 <= data_in_signed;
      END IF;
    END IF;
  END PROCESS Delay_process;


  data_out <= std_logic_vector(Delay_out1);

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step <= to_unsigned(1, 32);

  count_reset <= to_unsigned(0, 32);

  count_1 <= Count + count_step;

  
  count_2 <= Count WHEN valid_in = '0' ELSE
      count_1;

  
  count_3 <= count_2 WHEN newFrame = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Count <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        Count <= count_3;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Data_Type_Conversion_out1 <= psdu_size;

  Data_Type_Conversion_out1_23 <= Data_Type_Conversion_out1(23);

  Data_Type_Conversion_out1_22 <= Data_Type_Conversion_out1(22);

  Data_Type_Conversion_out1_21 <= Data_Type_Conversion_out1(21);

  Data_Type_Conversion_out1_20 <= Data_Type_Conversion_out1(20);

  Data_Type_Conversion_out1_19 <= Data_Type_Conversion_out1(19);

  Data_Type_Conversion_out1_18 <= Data_Type_Conversion_out1(18);

  Data_Type_Conversion_out1_17 <= Data_Type_Conversion_out1(17);

  Data_Type_Conversion_out1_16 <= Data_Type_Conversion_out1(16);

  Data_Type_Conversion_out1_15 <= Data_Type_Conversion_out1(15);

  Data_Type_Conversion_out1_14 <= Data_Type_Conversion_out1(14);

  Data_Type_Conversion_out1_13 <= Data_Type_Conversion_out1(13);

  Data_Type_Conversion_out1_12 <= Data_Type_Conversion_out1(12);

  Data_Type_Conversion_out1_11 <= Data_Type_Conversion_out1(11);

  Data_Type_Conversion_out1_10 <= Data_Type_Conversion_out1(10);

  Data_Type_Conversion_out1_9 <= Data_Type_Conversion_out1(9);

  Data_Type_Conversion_out1_8 <= Data_Type_Conversion_out1(8);

  Data_Type_Conversion_out1_7 <= Data_Type_Conversion_out1(7);

  Data_Type_Conversion_out1_6 <= Data_Type_Conversion_out1(6);

  Data_Type_Conversion_out1_5 <= Data_Type_Conversion_out1(5);

  Data_Type_Conversion_out1_4 <= Data_Type_Conversion_out1(4);

  Data_Type_Conversion_out1_3 <= Data_Type_Conversion_out1(3);

  Data_Type_Conversion_out1_2 <= Data_Type_Conversion_out1(2);

  Data_Type_Conversion_out1_1 <= Data_Type_Conversion_out1(1);

  Data_Type_Conversion_out1_0 <= Data_Type_Conversion_out1(0);

  y <= unsigned'(Data_Type_Conversion_out1_23 & Data_Type_Conversion_out1_22 & Data_Type_Conversion_out1_21 & Data_Type_Conversion_out1_20 & Data_Type_Conversion_out1_19 & Data_Type_Conversion_out1_18 & Data_Type_Conversion_out1_17 & Data_Type_Conversion_out1_16 & Data_Type_Conversion_out1_15 & Data_Type_Conversion_out1_14 & Data_Type_Conversion_out1_13 & Data_Type_Conversion_out1_12 & Data_Type_Conversion_out1_11 & Data_Type_Conversion_out1_10 & Data_Type_Conversion_out1_9 & Data_Type_Conversion_out1_8 & Data_Type_Conversion_out1_7 & Data_Type_Conversion_out1_6 & Data_Type_Conversion_out1_5 & Data_Type_Conversion_out1_4 & Data_Type_Conversion_out1_3 & Data_Type_Conversion_out1_2 & Data_Type_Conversion_out1_1 & Data_Type_Conversion_out1_0);

  Multiply_by_8_out1 <= y sll 3;

  Multiply_by_2_for_fec_rate_1_2_out1 <= Multiply_by_8_out1 sll 1;

  
  Relational_Operator_out1 <= '1' WHEN Count < resize(Multiply_by_2_for_fec_rate_1_2_out1, 32) ELSE
      '0';

  valid_out <= valid_in AND Relational_Operator_out1;

  ctrl_out_start <= valid_to_ctrl_out1_start;

  ctrl_out_end <= valid_to_ctrl_out1_end;

  ctrl_out_valid <= valid_to_ctrl_out1_valid;

END rtl;
