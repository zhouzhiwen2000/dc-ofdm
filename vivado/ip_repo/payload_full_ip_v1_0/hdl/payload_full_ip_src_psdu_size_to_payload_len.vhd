-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLPayloadFull/payload_full_ip_src_psdu_size_to_payload_len.vhd
-- Created: 2024-08-31 17:52:44
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: payload_full_ip_src_psdu_size_to_payload_len
-- Source Path: HDLPayloadFull/payload_full/psdu_size_to_payload_len
-- Hierarchy Level: 1
-- Model version: 1.46
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.payload_full_ip_src_payload_full_pac.ALL;

ENTITY payload_full_ip_src_psdu_size_to_payload_len IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_8_1                         :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        payload_len_in_ofdm_symbols       :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END payload_full_ip_src_psdu_size_to_payload_len;


ARCHITECTURE rtl OF payload_full_ip_src_psdu_size_to_payload_len IS

  -- Signals
  SIGNAL bits_per_subcarrier_1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL bits_per_subcarrier_2            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay1_reg                       : vector_of_unsigned4(0 TO 1);  -- ufix4 [2]
  SIGNAL Delay1_out1                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay1_out1_1                    : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL rd_11_reg                        : vector_of_unsigned4(0 TO 1);  -- ufix4 [2]
  SIGNAL Delay1_out1_2                    : unsigned(3 DOWNTO 0);  -- ufix4
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
  SIGNAL Delay_out1                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay_out1_1                     : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay_out1_2                     : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift2_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift3_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift3_out1_1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift5_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift5_out1_1                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Multiport_Switch_out1            : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_bypass_reg                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_out1                      : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Delay3_out1_1                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL HwModeRegister_reg               : vector_of_unsigned24(0 TO 1);  -- ufix24 [2]
  SIGNAL Delay3_out1_2                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL kconst                           : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL HwModeRegister1_reg              : vector_of_signed16(0 TO 1);  -- sfix16 [2]
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
  -- Adding "1" is the same as doing a "ceil()" operation,
  -- because the divider "floors" the previous result.
  -- It is assumed that the division will never be an integer
  -- Repetition not supported
  -- Get length of the payload expressed in OFDM Symbols:
  -- 
  -- bitsInPsdu = psduSize * 8 * fecRate [bits/payload]
  -- bitsInOFDMSymbol = numDataCarriers * bitsPerSubcarrier [bits/OFDM]
  -- 
  -- payloadLenInOFDMSymbols = ceil( bitsInPsdu / bitsInOFDMSymbol ) [OFDM/payload]

  bits_per_subcarrier_1 <= unsigned(bits_per_subcarrier);

  Delay11_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        bits_per_subcarrier_2 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_8_1 = '1' THEN
        bits_per_subcarrier_2 <= bits_per_subcarrier_1;
      END IF;
    END IF;
  END PROCESS Delay11_output_process;


  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg <= (OTHERS => to_unsigned(16#0#, 4));
      ELSIF enb_1_8_0 = '1' THEN
        Delay1_reg(0) <= bits_per_subcarrier_2;
        Delay1_reg(1) <= Delay1_reg(0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(1);

  Delay1_out1_1 <= Delay1_out1;

  rd_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_11_reg <= (OTHERS => to_unsigned(16#0#, 4));
      ELSIF enb = '1' THEN
        rd_11_reg(0) <= Delay1_out1_1;
        rd_11_reg(1) <= rd_11_reg(0);
      END IF;
    END IF;
  END PROCESS rd_11_process;

  Delay1_out1_2 <= rd_11_reg(1);

  psdu_size_1 <= psdu_size;

  rd_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        psdu_size_2 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        psdu_size_2 <= psdu_size_1;
      END IF;
    END IF;
  END PROCESS rd_13_process;


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

  Delay4_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_8_1 = '1' THEN
        Bit_Shift_out1_1 <= Bit_Shift_out1;
      END IF;
    END IF;
  END PROCESS Delay4_output_process;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_8_0 = '1' THEN
        Delay_out1 <= Bit_Shift_out1_1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay_out1_1 <= Delay_out1;

  rd_01_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_2 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Delay_out1_2 <= Delay_out1_1;
      END IF;
    END IF;
  END PROCESS rd_01_process;


  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift2_out1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift2_out1 <= Delay_out1_2;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  Bit_Shift3_out1 <= SHIFT_RIGHT(Delay_out1_2, 1);

  rd_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift3_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift3_out1_1 <= Bit_Shift3_out1;
      END IF;
    END IF;
  END PROCESS rd_3_process;


  Bit_Shift5_out1 <= SHIFT_RIGHT(Delay_out1_2, 4);

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Bit_Shift5_out1_1 <= to_unsigned(16#000000#, 24);
      ELSIF enb = '1' THEN
        Bit_Shift5_out1_1 <= Bit_Shift5_out1;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  
  Multiport_Switch_out1 <= Bit_Shift2_out1 WHEN Delay1_out1_2 = to_unsigned(16#0#, 4) ELSE
      Bit_Shift2_out1 WHEN Delay1_out1_2 = to_unsigned(16#1#, 4) ELSE
      Bit_Shift3_out1_1 WHEN Delay1_out1_2 = to_unsigned(16#2#, 4) ELSE
      Bit_Shift3_out1_1 WHEN Delay1_out1_2 = to_unsigned(16#3#, 4) ELSE
      Bit_Shift5_out1_1;

  Delay3_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_bypass_reg <= to_unsigned(16#000000#, 24);
      ELSIF enb_1_8_1 = '1' THEN
        Delay3_bypass_reg <= Multiport_Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay3_bypass_process;

  
  Delay3_out1 <= Multiport_Switch_out1 WHEN enb_1_8_1 = '1' ELSE
      Delay3_bypass_reg;

  Delay3_out1_1 <= Delay3_out1;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister_reg <= (OTHERS => to_unsigned(16#000000#, 24));
      ELSIF enb = '1' THEN
        HwModeRegister_reg(0) <= Delay3_out1_1;
        HwModeRegister_reg(1) <= HwModeRegister_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;

  Delay3_out1_2 <= HwModeRegister_reg(1);

  kconst <= to_signed(16#00A9#, 16);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister1_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        HwModeRegister1_reg(0) <= kconst;
        HwModeRegister1_reg(1) <= HwModeRegister1_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;

  kconst_1 <= HwModeRegister1_reg(1);

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
      ELSIF enb_1_8_1 = '1' THEN
        Delay2_bypass_reg <= Gain_out1_1;
      END IF;
    END IF;
  END PROCESS Delay2_bypass_process;

  
  Delay2_out1 <= Gain_out1_1 WHEN enb_1_8_1 = '1' ELSE
      Delay2_bypass_reg;

  Delay2_out1_1 <= Delay2_out1;

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1_2 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay2_out1_2 <= Delay2_out1_1;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  Constant4_out1 <= '1';

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Constant4_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Constant4_out1_1 <= Constant4_out1;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  Add1_add_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Constant4_out1_1;
  payloadNumOFDMSymbols <= Delay2_out1_2 + Add1_add_cast;

  Delay6_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_bypass_reg <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_8_1 = '1' THEN
        Delay6_bypass_reg <= payloadNumOFDMSymbols;
      END IF;
    END IF;
  END PROCESS Delay6_bypass_process;

  
  Delay6_out1 <= payloadNumOFDMSymbols WHEN enb_1_8_1 = '1' ELSE
      Delay6_bypass_reg;

  payload_len_in_ofdm_symbols <= std_logic_vector(Delay6_out1);

END rtl;
