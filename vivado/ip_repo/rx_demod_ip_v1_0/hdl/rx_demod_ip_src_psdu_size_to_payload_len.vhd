-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_psdu_size_to_payload_len.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_psdu_size_to_payload_len
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_separator/psdu_size_to_payload_len
-- Hierarchy Level: 2
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_psdu_size_to_payload_len IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        payload_len_in_ofdm_symbols       :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END rx_demod_ip_src_psdu_size_to_payload_len;


ARCHITECTURE rtl OF rx_demod_ip_src_psdu_size_to_payload_len IS

  -- Signals
  SIGNAL bits_per_subcarrier_1            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL bits_per_subcarrier_2            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rd_0_reg                         : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL bits_per_subcarrier_3            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay1_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay1_out1_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL psdu_size_1                      : std_logic_vector(23 DOWNTO 0);  -- boolean [24]
  SIGNAL psdu_size_2                      : std_logic_vector(23 DOWNTO 0);  -- boolean [24]
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
  SIGNAL Bit_Shift_out1                   : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift_out1_1                 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift_out1_2                 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay_out1                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift2_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift2_out1_1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift3_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift3_out1_1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift3_out1_2                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift5_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift5_out1_1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Multiport_Switch_out1            : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_bypass_reg                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_out1                      : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_out1_1                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_out1_2                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL kconst                           : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL kconst_1                         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Gain_cast                        : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Gain_mul_temp                    : signed(40 DOWNTO 0);  -- sfix41_En15
  SIGNAL Gain_cast_1                      : signed(39 DOWNTO 0);  -- sfix40_En15
  SIGNAL Gain_out1                        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Gain_out1_1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay2_bypass_reg                : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL Delay2_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay2_out1_1                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay2_out1_2                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant4_out1                   : std_logic;  -- ufix1
  SIGNAL Constant4_out1_1                 : std_logic;  -- ufix1
  SIGNAL Add1_add_cast                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL payloadNumOFDMSymbols            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay6_bypass_reg                : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL Delay6_out1                      : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  -- Get length of the payload expressed in OFDM Symbols:
  -- 
  -- bitsInPsdu = psduSize * 8 * fecRate [bits/payload]
  -- bitsInOFDMSymbol = numDataCarriers * bitsPerSubcarrier [bits/OFDM]
  -- 
  -- payloadLenInOFDMSymbols = ceil( bitsInPsdu / bitsInOFDMSymbol ) [OFDM/payload]
  -- Repetition not supported
  -- Adding "1" is the same as doing a "ceil()" operation,
  -- because the divider "floors" the previous result.
  -- It is assumed that the division will never be an integer

  bits_per_subcarrier_1 <= unsigned(bits_per_subcarrier);

  Delay1_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        bits_per_subcarrier_2 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_1 = '1' THEN
        bits_per_subcarrier_2 <= bits_per_subcarrier_1;
      END IF;
    END IF;
  END PROCESS Delay1_output_process;


  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_0_reg <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb_1_2_0 = '1' THEN
        rd_0_reg(0) <= bits_per_subcarrier_2;
        rd_0_reg(1) <= rd_0_reg(0);
      END IF;
    END IF;
  END PROCESS rd_0_process;

  bits_per_subcarrier_3 <= rd_0_reg(1);

  Delay1_out1 <= bits_per_subcarrier_3;

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Delay1_out1_1 <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  psdu_size_1 <= psdu_size;

  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        psdu_size_2 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        psdu_size_2 <= psdu_size_1;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  Data_Type_Conversion1_out1 <= psdu_size_2;

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

  Bit_Shift_out1 <= y sll 4;

  Delay_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_2_1 = '1' THEN
        Bit_Shift_out1_1 <= Bit_Shift_out1;
      END IF;
    END IF;
  END PROCESS Delay_output_process;


  rd_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift_out1_2 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        Bit_Shift_out1_2 <= Bit_Shift_out1_1;
      END IF;
    END IF;
  END PROCESS rd_3_process;


  Delay_out1 <= Bit_Shift_out1_2;

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift2_out1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift2_out1 <= Delay_out1;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  rd_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift2_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift2_out1_1 <= Delay_out1;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  Bit_Shift3_out1 <= SHIFT_RIGHT(Delay_out1, 1);

  rd_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift3_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift3_out1_1 <= Bit_Shift3_out1;
      END IF;
    END IF;
  END PROCESS rd_6_process;


  rd_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift3_out1_2 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift3_out1_2 <= Bit_Shift3_out1;
      END IF;
    END IF;
  END PROCESS rd_7_process;


  Bit_Shift5_out1 <= SHIFT_RIGHT(Delay_out1, 4);

  rd_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift5_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift5_out1_1 <= Bit_Shift5_out1;
      END IF;
    END IF;
  END PROCESS rd_8_process;


  
  Multiport_Switch_out1 <= Bit_Shift2_out1 WHEN Delay1_out1_1 = to_unsigned(16#00#, 8) ELSE
      Bit_Shift2_out1_1 WHEN Delay1_out1_1 = to_unsigned(16#01#, 8) ELSE
      Bit_Shift3_out1_1 WHEN Delay1_out1_1 = to_unsigned(16#02#, 8) ELSE
      Bit_Shift3_out1_2 WHEN Delay1_out1_1 = to_unsigned(16#03#, 8) ELSE
      Bit_Shift5_out1_1;

  Delay3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_bypass_reg <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_2_1 = '1' THEN
        Delay3_bypass_reg <= Multiport_Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay3_bypass_process;

  
  Delay3_out1 <= Multiport_Switch_out1 WHEN enb_1_2_1 = '1' ELSE
      Delay3_bypass_reg;

  Delay3_out1_1 <= Delay3_out1;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_2 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay3_out1_2 <= Delay3_out1_1;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  kconst <= to_signed(16#00A0#, 16);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        kconst_1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        kconst_1 <= kconst;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Gain_cast <= signed(resize(Delay3_out1_2, 25));
  Gain_mul_temp <= Gain_cast * kconst_1;
  Gain_cast_1 <= Gain_mul_temp(39 DOWNTO 0);
  Gain_out1 <= unsigned(Gain_cast_1(30 DOWNTO 15));

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Gain_out1_1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Gain_out1_1 <= Gain_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  Delay2_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_bypass_reg <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_1 = '1' THEN
        Delay2_bypass_reg <= Gain_out1_1;
      END IF;
    END IF;
  END PROCESS Delay2_bypass_process;

  
  Delay2_out1 <= Gain_out1_1 WHEN enb_1_2_1 = '1' ELSE
      Delay2_bypass_reg;

  Delay2_out1_1 <= Delay2_out1;

  rd_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1_2 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay2_out1_2 <= Delay2_out1_1;
      END IF;
    END IF;
  END PROCESS rd_9_process;


  Constant4_out1 <= '1';

  rd_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Constant4_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Constant4_out1_1 <= Constant4_out1;
      END IF;
    END IF;
  END PROCESS rd_10_process;


  Add1_add_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Constant4_out1_1;
  payloadNumOFDMSymbols <= Delay2_out1_2 + Add1_add_cast;

  Delay6_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_bypass_reg <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_1 = '1' THEN
        Delay6_bypass_reg <= payloadNumOFDMSymbols;
      END IF;
    END IF;
  END PROCESS Delay6_bypass_process;

  
  Delay6_out1 <= payloadNumOFDMSymbols WHEN enb_1_2_1 = '1' ELSE
      Delay6_bypass_reg;

  payload_len_in_ofdm_symbols <= std_logic_vector(Delay6_out1);

END rtl;
