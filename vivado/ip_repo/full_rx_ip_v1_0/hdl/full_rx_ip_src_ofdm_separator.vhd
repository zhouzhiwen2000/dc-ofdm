-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_ofdm_separator.vhd
-- Created: 2024-08-10 11:14:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_ofdm_separator
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_separator
-- Hierarchy Level: 2
-- Model version: 1.14
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_ofdm_separator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        peak                              :   IN    std_logic;
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
        payload_bits_per_subcarrier       :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        payload_cp_len                    :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        valid_channel                     :   OUT   std_logic;
        valid_header                      :   OUT   std_logic;
        valid_payload                     :   OUT   std_logic;
        payload_num_ofdm_symbols          :   OUT   std_logic_vector(16 DOWNTO 0)  -- sfix17
        );
END full_rx_ip_src_ofdm_separator;


ARCHITECTURE rtl OF full_rx_ip_src_ofdm_separator IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_rising_edge_detector_block2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Real_Divide_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          num                             :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
          den                             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- int16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_rising_edge_detector_block2
    USE ENTITY work.full_rx_ip_src_rising_edge_detector_block2(rtl);

  FOR ALL : full_rx_ip_src_Real_Divide_HDL_Optimized
    USE ENTITY work.full_rx_ip_src_Real_Divide_HDL_Optimized(rtl);

  -- Signals
  SIGNAL peak_1                           : std_logic;
  SIGNAL count_step                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_from                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_reset                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL zero_1                           : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL Counter_channel_out1             : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL range_hit                        : std_logic;
  SIGNAL count                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_1                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_2                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_hit                        : std_logic;
  SIGNAL Counter_channel_out2             : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL count_step_1                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_from_1                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_reset_1                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL zero_2                           : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL Counter_header_out1              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL range_hit_1                      : std_logic;
  SIGNAL count_3                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL need_to_wrap_1                   : std_logic;
  SIGNAL count_value_1                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_4                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_5                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_hit_1                      : std_logic;
  SIGNAL Counter_header_out2              : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL Counter_payload_ctrl_const_out   : std_logic;
  SIGNAL Counter_payload_ctrl_delay_out   : std_logic;
  SIGNAL Counter_payload_Initial_Val_out  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_step_2                     : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_reset_2                    : unsigned(31 DOWNTO 0);  -- uint32
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
  SIGNAL Bit_Shift_out1                   : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL payload_bits_per_subcarrier_unsigned : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Data_Type_Conversion2_out1       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Gain_out1                        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Real_Divide_HDL_Optimized_out1   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Real_Divide_HDL_Optimized_out1_signed : signed(15 DOWNTO 0);  -- int16
  SIGNAL Constant2_out1                   : std_logic;  -- ufix1
  SIGNAL Add1_add_cast                    : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL payloadNumOFDMSymbols            : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL payload_cp_len_unsigned          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant1_out1                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Add_out1                         : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Product_cast                     : signed(10 DOWNTO 0);  -- sfix11
  SIGNAL Product_mul_temp                 : signed(27 DOWNTO 0);  -- sfix28
  SIGNAL payloadNumOFDMSamples            : signed(26 DOWNTO 0);  -- sfix27
  SIGNAL valid_payload_1                  : std_logic;
  SIGNAL Unit_Delay2_out1                 : std_logic;
  SIGNAL Counter_payload_out1             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_6                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_7                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL count_8                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Counter_payload_out              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Relational_Operator_cast         : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL hit                              : std_logic;
  SIGNAL Delay2_out1                      : std_logic;

BEGIN
  -- This "+1" replaces the "ceil" operation

  u_rising_edge_detector : full_rx_ip_src_rising_edge_detector_block2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => peak,
              Out_rsvd => peak_1
              );

  u_Real_Divide_HDL_Optimized : full_rx_ip_src_Real_Divide_HDL_Optimized
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              num => std_logic_vector(Bit_Shift_out1),  -- ufix24
              den => std_logic_vector(Gain_out1),  -- uint16
              validIn => Constant_out1,
              y => Real_Divide_HDL_Optimized_out1  -- int16
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 638
  count_step <= to_unsigned(16#001#, 10);

  count_from <= to_unsigned(16#000#, 10);

  count_reset <= to_unsigned(16#000#, 10);

  zero_1 <= '0';

  Unit_Delay_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Unit_Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Unit_Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  
  range_hit <= '1' WHEN Counter_channel_out1 > to_unsigned(16#3FE#, 10) ELSE
      '0';

  count <= Counter_channel_out1 + count_step;

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= Counter_channel_out1 WHEN Switch_out1 = '0' ELSE
      count_value;

  
  count_2 <= count_1 WHEN peak_1 = '0' ELSE
      count_reset;

  Counter_channel_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Counter_channel_out1 <= to_unsigned(16#000#, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Counter_channel_out1 <= count_2;
      END IF;
    END IF;
  END PROCESS Counter_channel_process;


  
  need_to_wrap <= '1' WHEN Counter_channel_out1 = to_unsigned(16#27E#, 10) ELSE
      '0';

  count_hit <= need_to_wrap OR range_hit;

  
  Counter_channel_out2 <= count_hit WHEN peak_1 = '0' ELSE
      zero_1;

  Delay_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay_out1 <= Counter_channel_out2;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator_out1 <= peak_1 OR Delay_out1;

  
  Switch_out1 <= Unit_Delay_out1 WHEN Logical_Operator_out1 = '0' ELSE
      peak_1;

  Delay5_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay5_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay5_out1 <= Counter_channel_out2;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 318
  count_step_1 <= to_unsigned(16#001#, 9);

  count_from_1 <= to_unsigned(16#000#, 9);

  count_reset_1 <= to_unsigned(16#000#, 9);

  zero_2 <= '0';

  Unit_Delay1_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Unit_Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Unit_Delay1_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  
  range_hit_1 <= '1' WHEN Counter_header_out1 > to_unsigned(16#1FE#, 9) ELSE
      '0';

  count_3 <= Counter_header_out1 + count_step_1;

  
  count_value_1 <= count_3 WHEN need_to_wrap_1 = '0' ELSE
      count_from_1;

  
  count_4 <= Counter_header_out1 WHEN Switch1_out1 = '0' ELSE
      count_value_1;

  
  count_5 <= count_4 WHEN Delay5_out1 = '0' ELSE
      count_reset_1;

  Counter_header_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Counter_header_out1 <= to_unsigned(16#000#, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Counter_header_out1 <= count_5;
      END IF;
    END IF;
  END PROCESS Counter_header_process;


  
  need_to_wrap_1 <= '1' WHEN Counter_header_out1 = to_unsigned(16#13E#, 9) ELSE
      '0';

  count_hit_1 <= need_to_wrap_1 OR range_hit_1;

  
  Counter_header_out2 <= count_hit_1 WHEN Delay5_out1 = '0' ELSE
      zero_2;

  Delay1_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Counter_header_out2;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Logical_Operator1_out1 <= Delay5_out1 OR Delay1_out1;

  
  Switch1_out1 <= Unit_Delay1_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Delay5_out1;

  Delay6_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay6_out1 <= Counter_header_out2;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Counter_payload_ctrl_const_out <= '1';

  Counter_payload_ctrl_delay_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Counter_payload_ctrl_delay_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
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

  Data_Type_Conversion_out1_23 <= psdu_size(23);

  Data_Type_Conversion_out1_22 <= psdu_size(22);

  Data_Type_Conversion_out1_21 <= psdu_size(21);

  Data_Type_Conversion_out1_20 <= psdu_size(20);

  Data_Type_Conversion_out1_19 <= psdu_size(19);

  Data_Type_Conversion_out1_18 <= psdu_size(18);

  Data_Type_Conversion_out1_17 <= psdu_size(17);

  Data_Type_Conversion_out1_16 <= psdu_size(16);

  Data_Type_Conversion_out1_15 <= psdu_size(15);

  Data_Type_Conversion_out1_14 <= psdu_size(14);

  Data_Type_Conversion_out1_13 <= psdu_size(13);

  Data_Type_Conversion_out1_12 <= psdu_size(12);

  Data_Type_Conversion_out1_11 <= psdu_size(11);

  Data_Type_Conversion_out1_10 <= psdu_size(10);

  Data_Type_Conversion_out1_9 <= psdu_size(9);

  Data_Type_Conversion_out1_8 <= psdu_size(8);

  Data_Type_Conversion_out1_7 <= psdu_size(7);

  Data_Type_Conversion_out1_6 <= psdu_size(6);

  Data_Type_Conversion_out1_5 <= psdu_size(5);

  Data_Type_Conversion_out1_4 <= psdu_size(4);

  Data_Type_Conversion_out1_3 <= psdu_size(3);

  Data_Type_Conversion_out1_2 <= psdu_size(2);

  Data_Type_Conversion_out1_1 <= psdu_size(1);

  Data_Type_Conversion_out1_0 <= psdu_size(0);

  y <= unsigned'(Data_Type_Conversion_out1_23 & Data_Type_Conversion_out1_22 & Data_Type_Conversion_out1_21 & Data_Type_Conversion_out1_20 & Data_Type_Conversion_out1_19 & Data_Type_Conversion_out1_18 & Data_Type_Conversion_out1_17 & Data_Type_Conversion_out1_16 & Data_Type_Conversion_out1_15 & Data_Type_Conversion_out1_14 & Data_Type_Conversion_out1_13 & Data_Type_Conversion_out1_12 & Data_Type_Conversion_out1_11 & Data_Type_Conversion_out1_10 & Data_Type_Conversion_out1_9 & Data_Type_Conversion_out1_8 & Data_Type_Conversion_out1_7 & Data_Type_Conversion_out1_6 & Data_Type_Conversion_out1_5 & Data_Type_Conversion_out1_4 & Data_Type_Conversion_out1_3 & Data_Type_Conversion_out1_2 & Data_Type_Conversion_out1_1 & Data_Type_Conversion_out1_0);

  Bit_Shift_out1 <= y sll 4;

  payload_bits_per_subcarrier_unsigned <= unsigned(payload_bits_per_subcarrier);

  Data_Type_Conversion2_out1 <= resize(payload_bits_per_subcarrier_unsigned, 8);

  Gain_out1 <= to_unsigned(16#C2#, 8) * Data_Type_Conversion2_out1;

  Constant_out1 <= '1';

  Real_Divide_HDL_Optimized_out1_signed <= signed(Real_Divide_HDL_Optimized_out1);

  Constant2_out1 <= '1';

  Add1_add_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Constant2_out1;
  payloadNumOFDMSymbols <= resize(Real_Divide_HDL_Optimized_out1_signed, 17) + Add1_add_cast;

  payload_cp_len_unsigned <= unsigned(payload_cp_len);

  Constant1_out1 <= to_unsigned(16#100#, 9);

  Add_out1 <= resize(payload_cp_len_unsigned, 10) + resize(Constant1_out1, 10);

  Product_cast <= signed(resize(Add_out1, 11));
  Product_mul_temp <= payloadNumOFDMSymbols * Product_cast;
  payloadNumOFDMSamples <= Product_mul_temp(26 DOWNTO 0);

  Unit_Delay2_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Unit_Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Unit_Delay2_out1 <= valid_payload_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  count_6 <= Counter_payload_out1 + count_step_2;

  
  count_7 <= Counter_payload_out1 WHEN valid_payload_1 = '0' ELSE
      count_6;

  
  count_8 <= count_7 WHEN Logical_Operator2_out1 = '0' ELSE
      count_reset_2;

  Counter_payload_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Counter_payload_out <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Counter_payload_out <= count_8;
      END IF;
    END IF;
  END PROCESS Counter_payload_process;


  
  Counter_payload_out1 <= Counter_payload_Initial_Val_out WHEN Counter_payload_ctrl_delay_out = '0' ELSE
      Counter_payload_out;

  Relational_Operator_cast <= signed(resize(Counter_payload_out1, 33));
  
  hit <= '1' WHEN Relational_Operator_cast >= resize(payloadNumOFDMSamples, 33) ELSE
      '0';

  Delay2_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay2_out1 <= hit;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator2_out1 <= Delay6_out1 OR Delay2_out1;

  
  valid_payload_1 <= Unit_Delay2_out1 WHEN Logical_Operator2_out1 = '0' ELSE
      Delay6_out1;

  payload_num_ofdm_symbols <= std_logic_vector(payloadNumOFDMSymbols);

  data_out_re <= data_in_re;

  data_out_im <= data_in_im;

  valid_channel <= Switch_out1;

  valid_header <= Switch1_out1;

  valid_payload <= valid_payload_1;

END rtl;
