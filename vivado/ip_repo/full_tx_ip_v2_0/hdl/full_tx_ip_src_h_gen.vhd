-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_h_gen.vhd
-- Created: 2024-08-11 18:37:15
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_h_gen
-- Source Path: HDLTx/full_tx/header_full/h_gen
-- Hierarchy Level: 2
-- Model version: 4.91
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_src_h_gen IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        new_frame                         :   IN    std_logic;
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        msg_duration                      :   IN    std_logic_vector(15 DOWNTO 0);  -- boolean [16]
        block_size                        :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
        fec_rate                          :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        rep_number                        :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        concat_factor                     :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        scrambler_init                    :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
        bat_id                            :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
        cp_id                             :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        mimo_spacing                      :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        mimo_number                       :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        data_out                          :   OUT   std_logic;
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END full_tx_ip_src_h_gen;


ARCHITECTURE rtl OF full_tx_ip_src_h_gen IS

  -- Component Declarations
  COMPONENT full_tx_ip_src_valid_to_ctrl_block
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
  FOR ALL : full_tx_ip_src_valid_to_ctrl_block
    USE ENTITY work.full_tx_ip_src_valid_to_ctrl_block(rtl);

  -- Constants
  CONSTANT Constant1_data                 : std_logic_vector(7 DOWNTO 0) := 
    ('0', '0', '0', '0', '1', '1', '0', '0');  -- ufix1 [8]

  -- Signals
  SIGNAL count_step                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL count_from                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL HDL_Counter1_out2                : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL HDL_Counter1_out1                : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL range_hit                        : std_logic;
  SIGNAL count                            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : std_logic;
  SIGNAL count_1                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : std_logic;
  SIGNAL control_in_2                     : std_logic;
  SIGNAL Serializer1D_contl_cnt           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Serializer1D_invldSignal         : std_logic;
  SIGNAL Serializer1D_out2                : std_logic;
  SIGNAL Constant1_out1                   : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Demux_out1                       : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Demux_out2                       : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Demux_out3                       : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Demux1_out1                      : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Demux1_out2                      : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Vector_Concatenate_out1          : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Vector_Concatenate1_out1         : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant2_out1                   : std_logic;
  SIGNAL Constant3_out1                   : std_logic;
  SIGNAL Constant4_out1                   : std_logic;
  SIGNAL Vector_Concatenate2_out1         : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant5_out1                   : std_logic;
  SIGNAL Constant6_out1                   : std_logic;
  SIGNAL Vector_Concatenate3_out1         : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant7_out1                   : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant8_out1                   : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant9_out1                   : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant10_out1                  : std_logic;
  SIGNAL Constant11_out1                  : std_logic;
  SIGNAL Constant12_out1                  : std_logic;
  SIGNAL Constant13_out1                  : std_logic;
  SIGNAL Constant14_out1                  : std_logic;
  SIGNAL Vector_Concatenate4_out1         : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant15_out1                  : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant16_out1                  : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant17_out1                  : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant18_out1                  : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Constant19_out1                  : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Multiport_Switch1_out1           : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL serial_in_1                      : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Serializer1D_data                : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL Serializer1D_data_next           : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL serializer_PostProcessed         : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL valid_to_ctrl_out1_start         : std_logic;
  SIGNAL valid_to_ctrl_out1_end           : std_logic;
  SIGNAL valid_to_ctrl_out1_valid         : std_logic;

BEGIN
  u_valid_to_ctrl : full_tx_ip_src_valid_to_ctrl_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              validIn => Serializer1D_out2,
              ctrlOut_start => valid_to_ctrl_out1_start,
              ctrlOut_end => valid_to_ctrl_out1_end,
              ctrlOut_valid => valid_to_ctrl_out1_valid
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 18
  count_step <= to_unsigned(16#01#, 5);

  count_from <= to_unsigned(16#00#, 5);

  Logical_Operator1_out1 <=  NOT HDL_Counter1_out2;

  
  range_hit <= '1' WHEN HDL_Counter1_out1 > to_unsigned(16#1E#, 5) ELSE
      '0';

  count <= HDL_Counter1_out1 + count_step;

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter1_out1 WHEN Unit_Delay_Enabled_Synchronous_out1 = '0' ELSE
      count_value;

  HDL_Counter1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter1_out1 <= to_unsigned(16#00#, 5);
      ELSIF enb_1_8_0 = '1' THEN
        HDL_Counter1_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  
  need_to_wrap <= '1' WHEN HDL_Counter1_out1 = to_unsigned(16#12#, 5) ELSE
      '0';

  HDL_Counter1_out2 <= need_to_wrap OR range_hit;

  Logical_Operator_out1 <= new_frame OR HDL_Counter1_out2;

  
  Unit_Delay_Enabled_Synchronous_ectrl <= Unit_Delay_Enabled_Synchronous_out1 WHEN Logical_Operator_out1 = '0' ELSE
      Logical_Operator1_out1;

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Unit_Delay_Enabled_Synchronous_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  control_in_2 <= Unit_Delay_Enabled_Synchronous_out1;

  Serializer1D_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_contl_cnt <= to_unsigned(16#0#, 3);
      ELSIF enb = '1' THEN
        IF Serializer1D_contl_cnt = to_unsigned(16#7#, 3) THEN 
          Serializer1D_contl_cnt <= to_unsigned(16#0#, 3);
        ELSE 
          Serializer1D_contl_cnt <= Serializer1D_contl_cnt + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D_contl_process;

  Serializer1D_out2 <= control_in_2;
  
  Serializer1D_invldSignal <= '1' WHEN Serializer1D_contl_cnt = to_unsigned(16#0#, 3) ELSE
      '0';

  Constant1_out1 <= Constant1_data;

  Demux_out1(0) <= psdu_size(0);
  Demux_out1(1) <= psdu_size(1);
  Demux_out1(2) <= psdu_size(2);
  Demux_out1(3) <= psdu_size(3);
  Demux_out1(4) <= psdu_size(4);
  Demux_out1(5) <= psdu_size(5);
  Demux_out1(6) <= psdu_size(6);
  Demux_out1(7) <= psdu_size(7);

  Demux_out2(0) <= psdu_size(8);
  Demux_out2(1) <= psdu_size(9);
  Demux_out2(2) <= psdu_size(10);
  Demux_out2(3) <= psdu_size(11);
  Demux_out2(4) <= psdu_size(12);
  Demux_out2(5) <= psdu_size(13);
  Demux_out2(6) <= psdu_size(14);
  Demux_out2(7) <= psdu_size(15);

  Demux_out3(0) <= psdu_size(16);
  Demux_out3(1) <= psdu_size(17);
  Demux_out3(2) <= psdu_size(18);
  Demux_out3(3) <= psdu_size(19);
  Demux_out3(4) <= psdu_size(20);
  Demux_out3(5) <= psdu_size(21);
  Demux_out3(6) <= psdu_size(22);
  Demux_out3(7) <= psdu_size(23);

  Demux1_out1(0) <= msg_duration(0);
  Demux1_out1(1) <= msg_duration(1);
  Demux1_out1(2) <= msg_duration(2);
  Demux1_out1(3) <= msg_duration(3);
  Demux1_out1(4) <= msg_duration(4);
  Demux1_out1(5) <= msg_duration(5);
  Demux1_out1(6) <= msg_duration(6);
  Demux1_out1(7) <= msg_duration(7);

  Demux1_out2(0) <= msg_duration(8);
  Demux1_out2(1) <= msg_duration(9);
  Demux1_out2(2) <= msg_duration(10);
  Demux1_out2(3) <= msg_duration(11);
  Demux1_out2(4) <= msg_duration(12);
  Demux1_out2(5) <= msg_duration(13);
  Demux1_out2(6) <= msg_duration(14);
  Demux1_out2(7) <= msg_duration(15);

  Vector_Concatenate_out1(0) <= block_size(0);
  Vector_Concatenate_out1(1) <= block_size(1);
  Vector_Concatenate_out1(2) <= fec_rate(0);
  Vector_Concatenate_out1(3) <= fec_rate(1);
  Vector_Concatenate_out1(4) <= fec_rate(2);
  Vector_Concatenate_out1(5) <= rep_number(0);
  Vector_Concatenate_out1(6) <= rep_number(1);
  Vector_Concatenate_out1(7) <= rep_number(2);

  Constant_out1 <= '0';

  Vector_Concatenate1_out1(0) <= concat_factor(0);
  Vector_Concatenate1_out1(1) <= concat_factor(1);
  Vector_Concatenate1_out1(2) <= concat_factor(2);
  Vector_Concatenate1_out1(3) <= scrambler_init(0);
  Vector_Concatenate1_out1(4) <= scrambler_init(1);
  Vector_Concatenate1_out1(5) <= scrambler_init(2);
  Vector_Concatenate1_out1(6) <= scrambler_init(3);
  Vector_Concatenate1_out1(7) <= Constant_out1;

  Constant2_out1 <= '0';

  Constant3_out1 <= '0';

  Constant4_out1 <= '0';

  Vector_Concatenate2_out1(0) <= bat_id(0);
  Vector_Concatenate2_out1(1) <= bat_id(1);
  Vector_Concatenate2_out1(2) <= bat_id(2);
  Vector_Concatenate2_out1(3) <= bat_id(3);
  Vector_Concatenate2_out1(4) <= bat_id(4);
  Vector_Concatenate2_out1(5) <= Constant2_out1;
  Vector_Concatenate2_out1(6) <= Constant3_out1;
  Vector_Concatenate2_out1(7) <= Constant4_out1;

  Constant5_out1 <= '0';

  Constant6_out1 <= '0';

  Vector_Concatenate3_out1(0) <= cp_id(0);
  Vector_Concatenate3_out1(1) <= cp_id(1);
  Vector_Concatenate3_out1(2) <= cp_id(2);
  Vector_Concatenate3_out1(3) <= mimo_spacing(0);
  Vector_Concatenate3_out1(4) <= mimo_spacing(1);
  Vector_Concatenate3_out1(5) <= mimo_spacing(2);
  Vector_Concatenate3_out1(6) <= Constant5_out1;
  Vector_Concatenate3_out1(7) <= Constant6_out1;

  Constant7_out1 <= (OTHERS => '0');

  Constant8_out1 <= (OTHERS => '0');

  Constant9_out1 <= (OTHERS => '0');

  Constant10_out1 <= '0';

  Constant11_out1 <= '0';

  Constant12_out1 <= '0';

  Constant13_out1 <= '0';

  Constant14_out1 <= '0';

  Vector_Concatenate4_out1(0) <= Constant10_out1;
  Vector_Concatenate4_out1(1) <= Constant11_out1;
  Vector_Concatenate4_out1(2) <= mimo_number(0);
  Vector_Concatenate4_out1(3) <= mimo_number(1);
  Vector_Concatenate4_out1(4) <= mimo_number(2);
  Vector_Concatenate4_out1(5) <= Constant12_out1;
  Vector_Concatenate4_out1(6) <= Constant13_out1;
  Vector_Concatenate4_out1(7) <= Constant14_out1;

  Constant15_out1 <= (OTHERS => '0');

  Constant16_out1 <= (OTHERS => '0');

  Constant17_out1 <= (OTHERS => '0');

  Constant18_out1 <= (OTHERS => '0');

  Constant19_out1 <= (OTHERS => '0');

  Multiport_Switch1_output : PROCESS (Constant15_out1, Constant16_out1, Constant17_out1, Constant18_out1,
       Constant19_out1, Constant1_out1, Constant7_out1, Constant8_out1,
       Constant9_out1, Demux1_out1, Demux1_out2, Demux_out1, Demux_out2,
       Demux_out3, HDL_Counter1_out1, Vector_Concatenate1_out1,
       Vector_Concatenate2_out1, Vector_Concatenate3_out1,
       Vector_Concatenate4_out1, Vector_Concatenate_out1)
  BEGIN
    IF HDL_Counter1_out1 = to_unsigned(16#00#, 5) THEN 
      Multiport_Switch1_out1 <= Constant1_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#01#, 5) THEN 
      Multiport_Switch1_out1 <= Demux_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#02#, 5) THEN 
      Multiport_Switch1_out1 <= Demux_out2;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#03#, 5) THEN 
      Multiport_Switch1_out1 <= Demux_out3;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#04#, 5) THEN 
      Multiport_Switch1_out1 <= Demux1_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#05#, 5) THEN 
      Multiport_Switch1_out1 <= Demux1_out2;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#06#, 5) THEN 
      Multiport_Switch1_out1 <= Vector_Concatenate_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#07#, 5) THEN 
      Multiport_Switch1_out1 <= Vector_Concatenate1_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#08#, 5) THEN 
      Multiport_Switch1_out1 <= Vector_Concatenate2_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#09#, 5) THEN 
      Multiport_Switch1_out1 <= Vector_Concatenate3_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0A#, 5) THEN 
      Multiport_Switch1_out1 <= Constant7_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0B#, 5) THEN 
      Multiport_Switch1_out1 <= Constant8_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0C#, 5) THEN 
      Multiport_Switch1_out1 <= Constant9_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0D#, 5) THEN 
      Multiport_Switch1_out1 <= Vector_Concatenate4_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0E#, 5) THEN 
      Multiport_Switch1_out1 <= Constant15_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#0F#, 5) THEN 
      Multiport_Switch1_out1 <= Constant16_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#10#, 5) THEN 
      Multiport_Switch1_out1 <= Constant17_out1;
    ELSIF HDL_Counter1_out1 = to_unsigned(16#11#, 5) THEN 
      Multiport_Switch1_out1 <= Constant18_out1;
    ELSE 
      Multiport_Switch1_out1 <= Constant19_out1;
    END IF;
  END PROCESS Multiport_Switch1_output;


  serial_in_1 <= Multiport_Switch1_out1;

  Serializer1D_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D_data <= Serializer1D_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D_process;

  Serializer1D_output : PROCESS (Serializer1D_data, Serializer1D_invldSignal, serial_in_1)
  BEGIN
    Serializer1D_data_next <= Serializer1D_data;
    IF Serializer1D_invldSignal /= '0' THEN 
      serializer_PostProcessed <= serial_in_1(0);
    ELSE 
      serializer_PostProcessed <= Serializer1D_data(0);
    END IF;
    IF Serializer1D_invldSignal /= '0' THEN 
      Serializer1D_data_next(6 DOWNTO 0) <= serial_in_1(7 DOWNTO 1);
    ELSE 
      Serializer1D_data_next(5 DOWNTO 0) <= Serializer1D_data(6 DOWNTO 1);
      Serializer1D_data_next(6) <= serial_in_1(7);
    END IF;
  END PROCESS Serializer1D_output;


  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= serializer_PostProcessed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  data_out <= Delay1_out1;

  ctrl_out_start <= valid_to_ctrl_out1_start;

  ctrl_out_end <= valid_to_ctrl_out1_end;

  ctrl_out_valid <= valid_to_ctrl_out1_valid;

END rtl;
