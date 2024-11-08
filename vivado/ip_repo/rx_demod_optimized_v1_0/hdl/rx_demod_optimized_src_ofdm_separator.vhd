-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_ofdm_separator.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_ofdm_separator
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_separator
-- Hierarchy Level: 1
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_ofdm_separator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_in_im                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        peak                              :   IN    std_logic;
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        payload_bits_per_subcarrier       :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        payload_cp_len                    :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        header_ready                      :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_out_im                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        valid_channel                     :   OUT   std_logic;
        valid_header                      :   OUT   std_logic;
        valid_payload                     :   OUT   std_logic;
        payload_num_ofdm_symbols          :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END rx_demod_optimized_src_ofdm_separator;


ARCHITECTURE rtl OF rx_demod_optimized_src_ofdm_separator IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_rising_edge_detector_block2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_psdu_size_to_payload_len
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          payload_len_in_ofdm_symbols     :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_Compare_To_Constant
    PORT( u                               :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_Compare_To_Constant1
    PORT( u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_falling_edge_detector_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in_rsvd                         :   IN    std_logic;
          out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_wait_for_header
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_in_im                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          header_ready                    :   IN    std_logic;
          valid_payload                   :   IN    std_logic;
          zero_payload                    :   IN    std_logic;
          one_payload                     :   IN    std_logic;
          ofdm_samples                    :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          data_out_re                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_out_im                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          valid_payload_out               :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_rising_edge_detector_block2
    USE ENTITY work.rx_demod_optimized_src_rising_edge_detector_block2(rtl);

  FOR ALL : rx_demod_optimized_src_psdu_size_to_payload_len
    USE ENTITY work.rx_demod_optimized_src_psdu_size_to_payload_len(rtl);

  FOR ALL : rx_demod_optimized_src_Compare_To_Constant
    USE ENTITY work.rx_demod_optimized_src_Compare_To_Constant(rtl);

  FOR ALL : rx_demod_optimized_src_Compare_To_Constant1
    USE ENTITY work.rx_demod_optimized_src_Compare_To_Constant1(rtl);

  FOR ALL : rx_demod_optimized_src_falling_edge_detector_block
    USE ENTITY work.rx_demod_optimized_src_falling_edge_detector_block(rtl);

  FOR ALL : rx_demod_optimized_src_wait_for_header
    USE ENTITY work.rx_demod_optimized_src_wait_for_header(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_in_im_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL delayMatch8_reg_re               : vector_of_signed14(0 TO 1);  -- sfix14_En12 [2]
  SIGNAL delayMatch8_reg_im               : vector_of_signed14(0 TO 1);  -- sfix14_En12 [2]
  SIGNAL data_in_re_1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_in_im_1                     : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay16_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay16_out1                     : std_logic;
  SIGNAL Delay7_reg                       : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL header_ready_1                   : std_logic;
  SIGNAL delayMatch9_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL header_ready_2                   : std_logic;
  SIGNAL peak_1                           : std_logic;
  SIGNAL count_step                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_from                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_reset                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL zero_1                           : std_logic;
  SIGNAL Counter_channel_out1             : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL range_hit                        : std_logic;
  SIGNAL count                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL Counter_channel_out2             : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL count_1                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_2                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_hit                        : std_logic;
  SIGNAL Counter_channel_out2_1           : std_logic;
  SIGNAL count_step_1                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_from_1                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_reset_1                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL zero_3                           : std_logic;
  SIGNAL Counter_header_out1              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL range_hit_1                      : std_logic;
  SIGNAL count_3                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL need_to_wrap_1                   : std_logic;
  SIGNAL count_value_1                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL Counter_header_out2              : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL count_4                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_5                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_hit_1                      : std_logic;
  SIGNAL Counter_header_out2_1            : std_logic;
  SIGNAL delayMatch6_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL stateControl                     : std_logic;
  SIGNAL delayMatch7_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL Counter_payload_ctrl_const_out   : std_logic;
  SIGNAL Counter_payload_ctrl_delay_out   : std_logic;
  SIGNAL Counter_payload_Initial_Val_out  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_step_2                     : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_reset_2                    : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL delayMatch4_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL stateControl_4                   : std_logic;
  SIGNAL delayMatch3_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_5                   : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL From3_out1                       : std_logic;
  SIGNAL stateControl_6                   : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_7                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL From4_out1                       : std_logic;
  SIGNAL Constant2_out1                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL psdu_size_to_payload_len_out1    : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL psdu_size_to_payload_len_out1_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL psdu_size_to_payload_len_out1_1  : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL payload_cp_len_unsigned          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant1_out1                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Add_out1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay3_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay3_out1_1                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL payloadNumOFDMSamples            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL payloadNumOFDMSamples_1          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL stateControl_9                   : std_logic;
  SIGNAL delayMatch5_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_10                  : std_logic;
  SIGNAL Data_Type_Conversion1_out1       : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL Data_Type_Conversion1_out1_23    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_22    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_21    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_20    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_19    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_18    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_17    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_16    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_15    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_14    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_13    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_12    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_11    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_10    : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_9     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_8     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_7     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_6     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_5     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_4     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_3     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_2     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_1     : std_logic;  -- ufix1
  SIGNAL Data_Type_Conversion1_out1_0     : std_logic;  -- ufix1
  SIGNAL y                                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL Delay12_reg                      : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL delayMatch10_reg                 : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL zero_payload                     : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Delay14_reg                      : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL Delay14_out1                     : std_logic;
  SIGNAL delayMatch11_reg                 : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL one_payload                      : std_logic;
  SIGNAL payloadNumOFDMSamples_2          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay2_out1                 : std_logic;
  SIGNAL Switch2_out1                     : std_logic;
  SIGNAL Switch2_out1_1                   : std_logic;
  SIGNAL Unit_Delay3_out1                 : std_logic;
  SIGNAL Switch4_out1                     : std_logic;
  SIGNAL Switch4_out1_1                   : std_logic;
  SIGNAL wait_for_header_out2             : std_logic;
  SIGNAL b                                : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL From_out1                        : std_logic;
  SIGNAL From_out1_1                      : std_logic;
  SIGNAL From_out1_2                      : std_logic;
  SIGNAL From_out1_3                      : std_logic;
  SIGNAL From_out1_4                      : std_logic;
  SIGNAL From_out1_5                      : std_logic;
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL From_out1_6                      : std_logic;
  SIGNAL Switch3_out1                     : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch3_out1_1                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Counter_payload_out1             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_6                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_7                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL count_8                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Counter_payload_out              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL hit                              : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL hit_1                            : std_logic;
  SIGNAL wait_for_header_out1_re          : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL wait_for_header_out1_im          : std_logic_vector(13 DOWNTO 0);  -- ufix14

BEGIN
  -- high number to avoid a false "hit" on the payload counter (could be any)
  -- Note: the payload is formed for a single "block0"
  -- FIFO delay

  u_rising_edge_detector : rx_demod_optimized_src_rising_edge_detector_block2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => peak,
              Out_rsvd => peak_1
              );

  u_psdu_size_to_payload_len : rx_demod_optimized_src_psdu_size_to_payload_len
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              bits_per_subcarrier => payload_bits_per_subcarrier,  -- uint8
              psdu_size => psdu_size,  -- boolean [24]
              payload_len_in_ofdm_symbols => psdu_size_to_payload_len_out1  -- uint16
              );

  u_Compare_To_Constant : rx_demod_optimized_src_Compare_To_Constant
    PORT MAP( u => std_logic_vector(y),  -- ufix24
              y => Compare_To_Constant_out1
              );

  u_Compare_To_Constant1 : rx_demod_optimized_src_Compare_To_Constant1
    PORT MAP( u => psdu_size_to_payload_len_out1,  -- uint16
              y => Compare_To_Constant1_out1
              );

  u_falling_edge_detector : rx_demod_optimized_src_falling_edge_detector_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in_rsvd => wait_for_header_out2,
              out_rsvd => b
              );

  u_wait_for_header : rx_demod_optimized_src_wait_for_header
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => std_logic_vector(data_in_re_1),  -- sfix14_En12
              data_in_im => std_logic_vector(data_in_im_1),  -- sfix14_En12
              header_ready => header_ready_2,
              valid_payload => Switch2_out1,
              zero_payload => zero_payload,
              one_payload => one_payload,
              ofdm_samples => std_logic_vector(payloadNumOFDMSamples_2),  -- uint32
              data_out_re => wait_for_header_out1_re,  -- sfix14_En12
              data_out_im => wait_for_header_out1_im,  -- sfix14_En12
              valid_payload_out => wait_for_header_out2
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  delayMatch8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch8_reg_re <= (OTHERS => to_signed(16#0000#, 14));
        delayMatch8_reg_im <= (OTHERS => to_signed(16#0000#, 14));
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch8_reg_im(0) <= data_in_im_signed;
        delayMatch8_reg_im(1) <= delayMatch8_reg_im(0);
        delayMatch8_reg_re(0) <= data_in_re_signed;
        delayMatch8_reg_re(1) <= delayMatch8_reg_re(0);
      END IF;
    END IF;
  END PROCESS delayMatch8_process;

  data_in_re_1 <= delayMatch8_reg_re(1);
  data_in_im_1 <= delayMatch8_reg_im(1);

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay16_reg(0) <= header_ready;
        Delay16_reg(1) <= Delay16_reg(0);
      END IF;
    END IF;
  END PROCESS Delay16_process;

  Delay16_out1 <= Delay16_reg(1);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_reg(0) <= Delay16_out1;
        Delay7_reg(5 DOWNTO 1) <= Delay7_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  header_ready_1 <= Delay7_reg(5);

  delayMatch9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch9_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch9_reg(0) <= header_ready_1;
        delayMatch9_reg(1) <= delayMatch9_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch9_process;

  header_ready_2 <= delayMatch9_reg(1);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 638
  count_step <= to_unsigned(16#001#, 10);

  count_from <= to_unsigned(16#000#, 10);

  count_reset <= to_unsigned(16#000#, 10);

  zero_1 <= '0';

  
  range_hit <= '1' WHEN Counter_channel_out1 > to_unsigned(16#3FE#, 10) ELSE
      '0';

  count <= Counter_channel_out1 + count_step;

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  Unit_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Unit_Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Logical_Operator_out1 <= peak_1 OR Counter_channel_out2;

  
  Switch_out1 <= Unit_Delay_out1 WHEN Logical_Operator_out1 = '0' ELSE
      peak_1;

  
  count_1 <= Counter_channel_out1 WHEN Switch_out1 = '0' ELSE
      count_value;

  
  count_2 <= count_1 WHEN peak_1 = '0' ELSE
      count_reset;

  Counter_channel_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_channel_out1 <= to_unsigned(16#000#, 10);
      ELSIF enb_1_2_0 = '1' THEN
        Counter_channel_out1 <= count_2;
      END IF;
    END IF;
  END PROCESS Counter_channel_process;


  
  need_to_wrap <= '1' WHEN Counter_channel_out1 = to_unsigned(16#27E#, 10) ELSE
      '0';

  count_hit <= need_to_wrap OR range_hit;

  
  Counter_channel_out2_1 <= count_hit WHEN peak_1 = '0' ELSE
      zero_1;

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_channel_out2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Counter_channel_out2 <= Counter_channel_out2_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 318
  count_step_1 <= to_unsigned(16#001#, 9);

  count_from_1 <= to_unsigned(16#000#, 9);

  count_reset_1 <= to_unsigned(16#000#, 9);

  zero_3 <= '0';

  
  range_hit_1 <= '1' WHEN Counter_header_out1 > to_unsigned(16#1FE#, 9) ELSE
      '0';

  count_3 <= Counter_header_out1 + count_step_1;

  
  count_value_1 <= count_3 WHEN need_to_wrap_1 = '0' ELSE
      count_from_1;

  Unit_Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay1_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Unit_Delay1_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  Logical_Operator1_out1 <= Counter_channel_out2 OR Counter_header_out2;

  
  Switch1_out1 <= Unit_Delay1_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Counter_channel_out2;

  
  count_4 <= Counter_header_out1 WHEN Switch1_out1 = '0' ELSE
      count_value_1;

  
  count_5 <= count_4 WHEN Counter_channel_out2 = '0' ELSE
      count_reset_1;

  Counter_header_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_header_out1 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        Counter_header_out1 <= count_5;
      END IF;
    END IF;
  END PROCESS Counter_header_process;


  
  need_to_wrap_1 <= '1' WHEN Counter_header_out1 = to_unsigned(16#13E#, 9) ELSE
      '0';

  count_hit_1 <= need_to_wrap_1 OR range_hit_1;

  
  Counter_header_out2_1 <= count_hit_1 WHEN Counter_channel_out2 = '0' ELSE
      zero_3;

  reduced_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_header_out2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Counter_header_out2 <= Counter_header_out2_1;
      END IF;
    END IF;
  END PROCESS reduced_1_process;


  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch6_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch6_reg(0) <= Counter_header_out2;
        delayMatch6_reg(1) <= delayMatch6_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch6_process;

  Delay6_out1 <= delayMatch6_reg(1);

  stateControl <= '1';

  delayMatch7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch7_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch7_reg(0) <= stateControl;
        delayMatch7_reg(1) <= delayMatch7_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch7_process;

  stateControl_1 <= delayMatch7_reg(1);

  Counter_payload_ctrl_const_out <= '1';

  Counter_payload_ctrl_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_payload_ctrl_delay_out <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Counter_payload_ctrl_delay_out <= Counter_payload_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS Counter_payload_ctrl_delay_process;


  Counter_payload_Initial_Val_out <= to_unsigned(2, 32);

  -- Free running, Unsigned Counter
  --  initial value   = 2
  --  step value      = 1
  count_step_2 <= to_unsigned(1, 32);

  count_reset_2 <= to_unsigned(2, 32);

  stateControl_2 <= '1';

  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch4_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch4_reg(0) <= stateControl_2;
        delayMatch4_reg(1) <= delayMatch4_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch4_process;

  stateControl_3 <= delayMatch4_reg(1);

  stateControl_4 <= '1';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch3_reg(0) <= stateControl_4;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  stateControl_5 <= delayMatch3_reg(1);

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch2_reg(0) <= Delay16_out1;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  From3_out1 <= delayMatch2_reg(1);

  stateControl_6 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch1_reg(0) <= stateControl_6;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  stateControl_7 <= delayMatch1_reg(1);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= Delay16_out1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  From4_out1 <= delayMatch_reg(1);

  Constant2_out1 <= to_unsigned(65535, 32);

  psdu_size_to_payload_len_out1_unsigned <= unsigned(psdu_size_to_payload_len_out1);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        psdu_size_to_payload_len_out1_1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        psdu_size_to_payload_len_out1_1 <= psdu_size_to_payload_len_out1_unsigned;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  payload_cp_len_unsigned <= unsigned(payload_cp_len);

  Constant1_out1 <= to_unsigned(16#100#, 9);

  Add_out1 <= resize(resize(payload_cp_len_unsigned, 10) + resize(Constant1_out1, 10), 16);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1_1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  payloadNumOFDMSamples <= psdu_size_to_payload_len_out1_1 * Delay3_out1_1;

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        payloadNumOFDMSamples_1 <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        payloadNumOFDMSamples_1 <= payloadNumOFDMSamples;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  stateControl_9 <= '1';

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch5_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch5_reg(0) <= stateControl_9;
        delayMatch5_reg(1) <= delayMatch5_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch5_process;

  stateControl_10 <= delayMatch5_reg(1);

  Data_Type_Conversion1_out1 <= psdu_size;

  Data_Type_Conversion1_out1_23 <= Data_Type_Conversion1_out1(23);

  Data_Type_Conversion1_out1_22 <= Data_Type_Conversion1_out1(22);

  Data_Type_Conversion1_out1_21 <= Data_Type_Conversion1_out1(21);

  Data_Type_Conversion1_out1_20 <= Data_Type_Conversion1_out1(20);

  Data_Type_Conversion1_out1_19 <= Data_Type_Conversion1_out1(19);

  Data_Type_Conversion1_out1_18 <= Data_Type_Conversion1_out1(18);

  Data_Type_Conversion1_out1_17 <= Data_Type_Conversion1_out1(17);

  Data_Type_Conversion1_out1_16 <= Data_Type_Conversion1_out1(16);

  Data_Type_Conversion1_out1_15 <= Data_Type_Conversion1_out1(15);

  Data_Type_Conversion1_out1_14 <= Data_Type_Conversion1_out1(14);

  Data_Type_Conversion1_out1_13 <= Data_Type_Conversion1_out1(13);

  Data_Type_Conversion1_out1_12 <= Data_Type_Conversion1_out1(12);

  Data_Type_Conversion1_out1_11 <= Data_Type_Conversion1_out1(11);

  Data_Type_Conversion1_out1_10 <= Data_Type_Conversion1_out1(10);

  Data_Type_Conversion1_out1_9 <= Data_Type_Conversion1_out1(9);

  Data_Type_Conversion1_out1_8 <= Data_Type_Conversion1_out1(8);

  Data_Type_Conversion1_out1_7 <= Data_Type_Conversion1_out1(7);

  Data_Type_Conversion1_out1_6 <= Data_Type_Conversion1_out1(6);

  Data_Type_Conversion1_out1_5 <= Data_Type_Conversion1_out1(5);

  Data_Type_Conversion1_out1_4 <= Data_Type_Conversion1_out1(4);

  Data_Type_Conversion1_out1_3 <= Data_Type_Conversion1_out1(3);

  Data_Type_Conversion1_out1_2 <= Data_Type_Conversion1_out1(2);

  Data_Type_Conversion1_out1_1 <= Data_Type_Conversion1_out1(1);

  Data_Type_Conversion1_out1_0 <= Data_Type_Conversion1_out1(0);

  y <= unsigned'(Data_Type_Conversion1_out1_23 & Data_Type_Conversion1_out1_22 & Data_Type_Conversion1_out1_21 & Data_Type_Conversion1_out1_20 & Data_Type_Conversion1_out1_19 & Data_Type_Conversion1_out1_18 & Data_Type_Conversion1_out1_17 & Data_Type_Conversion1_out1_16 & Data_Type_Conversion1_out1_15 & Data_Type_Conversion1_out1_14 & Data_Type_Conversion1_out1_13 & Data_Type_Conversion1_out1_12 & Data_Type_Conversion1_out1_11 & Data_Type_Conversion1_out1_10 & Data_Type_Conversion1_out1_9 & Data_Type_Conversion1_out1_8 & Data_Type_Conversion1_out1_7 & Data_Type_Conversion1_out1_6 & Data_Type_Conversion1_out1_5 & Data_Type_Conversion1_out1_4 & Data_Type_Conversion1_out1_3 & Data_Type_Conversion1_out1_2 & Data_Type_Conversion1_out1_1 & Data_Type_Conversion1_out1_0);

  AND_out1 <= Compare_To_Constant_out1 AND Delay16_out1;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_reg(0) <= AND_out1;
        Delay12_reg(5 DOWNTO 1) <= Delay12_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(5);

  delayMatch10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch10_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch10_reg(0) <= Delay12_out1;
        delayMatch10_reg(1) <= delayMatch10_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch10_process;

  zero_payload <= delayMatch10_reg(1);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_reg(0) <= Compare_To_Constant1_out1;
        Delay14_reg(2 DOWNTO 1) <= Delay14_reg(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay14_process;

  Delay14_out1 <= Delay14_reg(2);

  delayMatch11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch11_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch11_reg(0) <= Delay14_out1;
        delayMatch11_reg(1) <= delayMatch11_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch11_process;

  one_payload <= delayMatch11_reg(1);

  
  Switch2_out1_1 <= Unit_Delay2_out1 WHEN stateControl_10 = '0' ELSE
      Switch2_out1;

  Unit_Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay2_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Unit_Delay2_out1 <= Switch2_out1_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  
  Switch4_out1_1 <= Unit_Delay3_out1 WHEN stateControl_7 = '0' ELSE
      Switch4_out1;

  Unit_Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay3_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Unit_Delay3_out1 <= Switch4_out1_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;


  Logical_Operator3_out1 <= b OR From3_out1;

  
  Switch4_out1 <= Unit_Delay3_out1 WHEN Logical_Operator3_out1 = '0' ELSE
      From4_out1;

  
  From_out1_1 <= From_out1 WHEN stateControl_5 = '0' ELSE
      Switch4_out1;

  Delay81_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        From_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        From_out1 <= From_out1_1;
      END IF;
    END IF;
  END PROCESS Delay81_process;


  
  From_out1_3 <= From_out1_2 WHEN stateControl_5 = '0' ELSE
      From_out1;

  Delay82_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        From_out1_2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        From_out1_2 <= From_out1_3;
      END IF;
    END IF;
  END PROCESS Delay82_process;


  
  From_out1_5 <= From_out1_4 WHEN stateControl_5 = '0' ELSE
      From_out1_2;

  Delay83_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        From_out1_4 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        From_out1_4 <= From_out1_5;
      END IF;
    END IF;
  END PROCESS Delay83_process;


  
  From_out1_6 <= Delay8_out1 WHEN stateControl_5 = '0' ELSE
      From_out1_4;

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay8_out1 <= From_out1_6;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  
  Switch3_out1 <= Constant2_out1 WHEN Delay8_out1 = '0' ELSE
      payloadNumOFDMSamples_1;

  
  Switch3_out1_1 <= payloadNumOFDMSamples_2 WHEN stateControl_3 = '0' ELSE
      Switch3_out1;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        payloadNumOFDMSamples_2 <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        payloadNumOFDMSamples_2 <= Switch3_out1_1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  count_6 <= Counter_payload_out1 + count_step_2;

  
  count_7 <= Counter_payload_out1 WHEN Switch2_out1 = '0' ELSE
      count_6;

  
  count_8 <= count_7 WHEN Logical_Operator2_out1 = '0' ELSE
      count_reset_2;

  Counter_payload_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Counter_payload_out <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        Counter_payload_out <= count_8;
      END IF;
    END IF;
  END PROCESS Counter_payload_process;


  
  Counter_payload_out1 <= Counter_payload_Initial_Val_out WHEN Counter_payload_ctrl_delay_out = '0' ELSE
      Counter_payload_out;

  
  hit <= '1' WHEN Counter_payload_out1 >= payloadNumOFDMSamples_2 ELSE
      '0';

  
  hit_1 <= Delay2_out1 WHEN stateControl_1 = '0' ELSE
      hit;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= hit_1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator2_out1 <= Delay6_out1 OR Delay2_out1;

  
  Switch2_out1 <= Unit_Delay2_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      Delay6_out1;

  data_out_re <= wait_for_header_out1_re;

  data_out_im <= wait_for_header_out1_im;

  valid_channel <= Switch_out1;

  valid_header <= Switch1_out1;

  valid_payload <= wait_for_header_out2;

  payload_num_ofdm_symbols <= psdu_size_to_payload_len_out1;

END rtl;

