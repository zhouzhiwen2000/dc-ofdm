-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_symDemodQPSKVector.vhd
-- Created: 2024-08-11 11:00:05
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_symDemodQPSKVector
-- Source Path: HDLRx/full_rx/rx_demodulator_full/qam_demod/Symbol Demodulator1/symDemodQPSKVector
-- Hierarchy Level: 4
-- Model version: 1.44
-- 
-- QPSK vector Demodulation
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_rx_ip_src_full_rx_pac.ALL;

ENTITY full_rx_ip_src_symDemodQPSKVector IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_4_0                         :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        dataIn_im                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        validIn                           :   IN    std_logic;  -- ufix1
        dataOut                           :   OUT   vector_of_std_logic_vector28(0 TO 1)  -- sfix28_En12 [2]
        );
END full_rx_ip_src_symDemodQPSKVector;


ARCHITECTURE rtl OF full_rx_ip_src_symDemodQPSKVector IS

  -- Signals
  SIGNAL delayMatch2_reg                  : std_logic_vector(4 DOWNTO 0);  -- ufix1 [5]
  SIGNAL delayMatch2_out1                 : std_logic;
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL cos_out1                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL HwModeRegister14_out1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataIn_im_signed                 : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL HwModeRegister15_out1            : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Product7_out1                    : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL PipelineRegister7_out1           : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL dataIn_re_signed                 : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL HwModeRegister12_out1            : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL sin_out1                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL HwModeRegister13_out1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product6_out1                    : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL PipelineRegister6_out1           : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL Add3_add_cast                    : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Add3_add_cast_1                  : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Add3_out1                        : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL PipelineRegister9_out1           : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Data_Type_Conversion12_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL delayMatch_out1                  : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL HwModeRegister8_out1             : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL HwModeRegister9_out1             : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Product4_out1                    : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL PipelineRegister4_out1           : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL HwModeRegister10_out1            : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL HwModeRegister11_out1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Product5_out1                    : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL PipelineRegister5_out1           : signed(39 DOWNTO 0);  -- sfix40_En26
  SIGNAL Add2_sub_cast                    : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Add2_sub_cast_1                  : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Add2_out1                        : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL PipelineRegister8_out1           : signed(40 DOWNTO 0);  -- sfix41_En26
  SIGNAL Data_Type_Conversion11_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Abs_rsvd_y                       : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Abs_rsvd_cast                    : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Abs_out1                         : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL lookUpTable11_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Subtract3_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract3_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract3_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion1_out1       : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL concatenate2_out1                : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister_out1              : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister1_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Product_out1                     : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL Abs1_y                           : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Abs1_cast                        : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Abs1_out1                        : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL lookUpTable12_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Subtract5_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract5_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract5_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion13_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL concatenate4_out1                : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister2_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister3_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Product1_out1                    : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL lookUpTable21_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lookUpTable31_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Subtract1_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract1_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract1_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion2_out1       : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Subtract2_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract2_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract2_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion10_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL concatenate3_out1                : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister4_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister5_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Product2_out1                    : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL lookUpTable22_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lookUpTable32_out1               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Subtract6_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract6_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract6_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion14_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Subtract7_sub_cast               : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract7_sub_cast_1             : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Subtract7_out1                   : signed(30 DOWNTO 0);  -- sfix31_En14
  SIGNAL Data_Type_Conversion15_out1      : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL concatenate5_out1                : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister6_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL HwModeRegister7_out1             : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Product3_out1                    : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL PipelineRegister_out1            : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL Data_Type_Conversion3_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL PipelineRegister1_out1           : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL Data_Type_Conversion4_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Add_add_cast                     : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Add_add_cast_1                   : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Add_out1                         : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Data_Type_Conversion7_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL PipelineRegister2_out1           : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL Data_Type_Conversion5_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL PipelineRegister3_out1           : vector_of_signed56(0 TO 1);  -- sfix56_En24 [2]
  SIGNAL Data_Type_Conversion6_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Add1_add_cast                    : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Add1_add_cast_1                  : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Add1_out1                        : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Data_Type_Conversion8_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Subtract4_sub_cast               : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Subtract4_sub_cast_1             : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Subtract4_out1                   : vector_of_signed29(0 TO 1);  -- sfix29_En12 [2]
  SIGNAL Data_Type_Conversion9_out1       : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Data_Type_Conversion9_out1_1     : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Unary_Minus1_cast                : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Unary_Minus1_cast_1              : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Unary_Minus1_out1                : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Switch3_out1                     : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL delayMatch1_out1                 : std_logic;
  SIGNAL switch_compare_1_2               : std_logic;
  SIGNAL Data_Type_Conversion9_out1_0     : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Unary_Minus_cast                 : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Unary_Minus_cast_1               : signed(28 DOWNTO 0);  -- sfix29_En12
  SIGNAL Unary_Minus_out1                 : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL Constant5_out1                   : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Switch2_out1                     : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL concatenate_out1                 : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]
  SIGNAL Switch10_out1                    : vector_of_signed28(0 TO 1);  -- sfix28_En12 [2]

BEGIN
  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb_1_4_0 = '1' THEN
        delayMatch2_reg(0) <= validIn;
        delayMatch2_reg(4 DOWNTO 1) <= delayMatch2_reg(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  delayMatch2_out1 <= delayMatch2_reg(4);

  
  switch_compare_1 <= '1' WHEN delayMatch2_out1 > '0' ELSE
      '0';

  cos_out1 <= to_signed(16#0000#, 16);

  HwModeRegister14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister14_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister14_out1 <= cos_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister14_process;


  dataIn_im_signed <= signed(dataIn_im);

  HwModeRegister15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister15_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister15_out1 <= dataIn_im_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister15_process;


  Product7_out1 <= HwModeRegister14_out1 * HwModeRegister15_out1;

  PipelineRegister7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister7_out1 <= to_signed(0, 40);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister7_out1 <= Product7_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister7_process;


  dataIn_re_signed <= signed(dataIn_re);

  HwModeRegister12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister12_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister12_out1 <= dataIn_re_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister12_process;


  sin_out1 <= to_signed(16#4000#, 16);

  HwModeRegister13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister13_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister13_out1 <= sin_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister13_process;


  Product6_out1 <= HwModeRegister12_out1 * HwModeRegister13_out1;

  PipelineRegister6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister6_out1 <= to_signed(0, 40);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister6_out1 <= Product6_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister6_process;


  Add3_add_cast <= resize(PipelineRegister7_out1, 41);
  Add3_add_cast_1 <= resize(PipelineRegister6_out1, 41);
  Add3_out1 <= Add3_add_cast + Add3_add_cast_1;

  PipelineRegister9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister9_out1 <= to_signed(0, 41);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister9_out1 <= Add3_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister9_process;


  Data_Type_Conversion12_out1 <= resize(PipelineRegister9_out1(40 DOWNTO 14), 28);

  
  Compare_To_Constant1_out1 <= '1' WHEN Data_Type_Conversion12_out1 > to_signed(16#0000000#, 28) ELSE
      '0';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_4_0 = '1' THEN
        delayMatch_reg(0) <= Compare_To_Constant1_out1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  delayMatch_out1 <= delayMatch_reg(1);

  
  switch_compare_1_1 <= '1' WHEN delayMatch_out1 > '0' ELSE
      '0';

  HwModeRegister8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister8_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister8_out1 <= cos_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister8_process;


  HwModeRegister9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister9_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister9_out1 <= dataIn_re_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister9_process;


  Product4_out1 <= HwModeRegister8_out1 * HwModeRegister9_out1;

  PipelineRegister4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister4_out1 <= to_signed(0, 40);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister4_out1 <= Product4_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister4_process;


  HwModeRegister10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister10_out1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister10_out1 <= dataIn_im_signed;
      END IF;
    END IF;
  END PROCESS HwModeRegister10_process;


  HwModeRegister11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister11_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister11_out1 <= sin_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister11_process;


  Product5_out1 <= HwModeRegister10_out1 * HwModeRegister11_out1;

  PipelineRegister5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister5_out1 <= to_signed(0, 40);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister5_out1 <= Product5_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister5_process;


  Add2_sub_cast <= resize(PipelineRegister4_out1, 41);
  Add2_sub_cast_1 <= resize(PipelineRegister5_out1, 41);
  Add2_out1 <= Add2_sub_cast - Add2_sub_cast_1;

  PipelineRegister8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister8_out1 <= to_signed(0, 41);
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister8_out1 <= Add2_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister8_process;


  Data_Type_Conversion11_out1 <= resize(PipelineRegister8_out1(40 DOWNTO 14), 28);

  Abs_rsvd_cast <= resize(Data_Type_Conversion11_out1, 29);
  
  Abs_rsvd_y <=  - (Abs_rsvd_cast) WHEN Data_Type_Conversion11_out1 < to_signed(16#0000000#, 28) ELSE
      resize(Data_Type_Conversion11_out1, 29);
  Abs_out1 <= Abs_rsvd_y(27 DOWNTO 0);

  lookUpTable11_out1 <= to_signed(16#2D41#, 16);

  Subtract3_sub_cast <= resize(Abs_out1 & '0' & '0', 31);
  Subtract3_sub_cast_1 <= resize(lookUpTable11_out1, 31);
  Subtract3_out1 <= Subtract3_sub_cast - Subtract3_sub_cast_1;

  Data_Type_Conversion1_out1 <= Subtract3_out1(29 DOWNTO 2);

  concatenate2_out1(0) <= Data_Type_Conversion1_out1;
  concatenate2_out1(1) <= Data_Type_Conversion1_out1;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister_out1 <= concatenate2_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister1_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister1_out1 <= concatenate2_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;



  Product_out1_gen: FOR t_0 IN 0 TO 1 GENERATE
    Product_out1(t_0) <= HwModeRegister_out1(t_0) * HwModeRegister1_out1(t_0);
  END GENERATE Product_out1_gen;


  Abs1_cast <= resize(Data_Type_Conversion12_out1, 29);
  
  Abs1_y <=  - (Abs1_cast) WHEN Data_Type_Conversion12_out1 < to_signed(16#0000000#, 28) ELSE
      resize(Data_Type_Conversion12_out1, 29);
  Abs1_out1 <= Abs1_y(27 DOWNTO 0);

  lookUpTable12_out1 <= to_signed(16#2D41#, 16);

  Subtract5_sub_cast <= resize(Abs1_out1 & '0' & '0', 31);
  Subtract5_sub_cast_1 <= resize(lookUpTable12_out1, 31);
  Subtract5_out1 <= Subtract5_sub_cast - Subtract5_sub_cast_1;

  Data_Type_Conversion13_out1 <= Subtract5_out1(29 DOWNTO 2);

  concatenate4_out1(0) <= Data_Type_Conversion13_out1;
  concatenate4_out1(1) <= Data_Type_Conversion13_out1;

  HwModeRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister2_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister2_out1 <= concatenate4_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister2_process;


  HwModeRegister3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister3_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister3_out1 <= concatenate4_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister3_process;



  Product1_out1_gen: FOR t_01 IN 0 TO 1 GENERATE
    Product1_out1(t_01) <= HwModeRegister2_out1(t_01) * HwModeRegister3_out1(t_01);
  END GENERATE Product1_out1_gen;


  lookUpTable21_out1 <= to_signed(-16#2D42#, 16);

  lookUpTable31_out1 <= to_signed(16#2D41#, 16);

  Subtract1_sub_cast <= resize(Abs_out1 & '0' & '0', 31);
  Subtract1_sub_cast_1 <= resize(lookUpTable21_out1, 31);
  Subtract1_out1 <= Subtract1_sub_cast - Subtract1_sub_cast_1;

  Data_Type_Conversion2_out1 <= Subtract1_out1(29 DOWNTO 2);

  Subtract2_sub_cast <= resize(Abs_out1 & '0' & '0', 31);
  Subtract2_sub_cast_1 <= resize(lookUpTable31_out1, 31);
  Subtract2_out1 <= Subtract2_sub_cast - Subtract2_sub_cast_1;

  Data_Type_Conversion10_out1 <= Subtract2_out1(29 DOWNTO 2);

  concatenate3_out1(0) <= Data_Type_Conversion2_out1;
  concatenate3_out1(1) <= Data_Type_Conversion10_out1;

  HwModeRegister4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister4_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister4_out1 <= concatenate3_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister4_process;


  HwModeRegister5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister5_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister5_out1 <= concatenate3_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister5_process;



  Product2_out1_gen: FOR t_02 IN 0 TO 1 GENERATE
    Product2_out1(t_02) <= HwModeRegister4_out1(t_02) * HwModeRegister5_out1(t_02);
  END GENERATE Product2_out1_gen;


  lookUpTable22_out1 <= to_signed(16#2D41#, 16);

  lookUpTable32_out1 <= to_signed(-16#2D42#, 16);

  Subtract6_sub_cast <= resize(Abs1_out1 & '0' & '0', 31);
  Subtract6_sub_cast_1 <= resize(lookUpTable22_out1, 31);
  Subtract6_out1 <= Subtract6_sub_cast - Subtract6_sub_cast_1;

  Data_Type_Conversion14_out1 <= Subtract6_out1(29 DOWNTO 2);

  Subtract7_sub_cast <= resize(Abs1_out1 & '0' & '0', 31);
  Subtract7_sub_cast_1 <= resize(lookUpTable32_out1, 31);
  Subtract7_out1 <= Subtract7_sub_cast - Subtract7_sub_cast_1;

  Data_Type_Conversion15_out1 <= Subtract7_out1(29 DOWNTO 2);

  concatenate5_out1(0) <= Data_Type_Conversion14_out1;
  concatenate5_out1(1) <= Data_Type_Conversion15_out1;

  HwModeRegister6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister6_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister6_out1 <= concatenate5_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister6_process;


  HwModeRegister7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister7_out1 <= (OTHERS => to_signed(16#0000000#, 28));
      ELSIF enb_1_4_0 = '1' THEN
        HwModeRegister7_out1 <= concatenate5_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister7_process;



  Product3_out1_gen: FOR t_03 IN 0 TO 1 GENERATE
    Product3_out1(t_03) <= HwModeRegister6_out1(t_03) * HwModeRegister7_out1(t_03);
  END GENERATE Product3_out1_gen;


  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister_out1 <= (OTHERS => to_signed(0, 56));
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister_out1 <= Product_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;



  Data_Type_Conversion3_out1_gen: FOR ii IN 0 TO 1 GENERATE
    Data_Type_Conversion3_out1(ii) <= PipelineRegister_out1(ii)(39 DOWNTO 12);
  END GENERATE Data_Type_Conversion3_out1_gen;


  PipelineRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister1_out1 <= (OTHERS => to_signed(0, 56));
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister1_out1 <= Product1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;



  Data_Type_Conversion4_out1_gen: FOR ii1 IN 0 TO 1 GENERATE
    Data_Type_Conversion4_out1(ii1) <= PipelineRegister1_out1(ii1)(39 DOWNTO 12);
  END GENERATE Data_Type_Conversion4_out1_gen;



  Add_out1_gen: FOR t_04 IN 0 TO 1 GENERATE
    Add_add_cast(t_04) <= resize(Data_Type_Conversion3_out1(t_04), 29);
    Add_add_cast_1(t_04) <= resize(Data_Type_Conversion4_out1(t_04), 29);
    Add_out1(t_04) <= Add_add_cast(t_04) + Add_add_cast_1(t_04);
  END GENERATE Add_out1_gen;



  Data_Type_Conversion7_out1_gen: FOR ii2 IN 0 TO 1 GENERATE
    Data_Type_Conversion7_out1(ii2) <= Add_out1(ii2)(27 DOWNTO 0);
  END GENERATE Data_Type_Conversion7_out1_gen;


  PipelineRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister2_out1 <= (OTHERS => to_signed(0, 56));
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister2_out1 <= Product2_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister2_process;



  Data_Type_Conversion5_out1_gen: FOR ii3 IN 0 TO 1 GENERATE
    Data_Type_Conversion5_out1(ii3) <= PipelineRegister2_out1(ii3)(39 DOWNTO 12);
  END GENERATE Data_Type_Conversion5_out1_gen;


  PipelineRegister3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        PipelineRegister3_out1 <= (OTHERS => to_signed(0, 56));
      ELSIF enb_1_4_0 = '1' THEN
        PipelineRegister3_out1 <= Product3_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister3_process;



  Data_Type_Conversion6_out1_gen: FOR ii4 IN 0 TO 1 GENERATE
    Data_Type_Conversion6_out1(ii4) <= PipelineRegister3_out1(ii4)(39 DOWNTO 12);
  END GENERATE Data_Type_Conversion6_out1_gen;



  Add1_out1_gen: FOR t_05 IN 0 TO 1 GENERATE
    Add1_add_cast(t_05) <= resize(Data_Type_Conversion5_out1(t_05), 29);
    Add1_add_cast_1(t_05) <= resize(Data_Type_Conversion6_out1(t_05), 29);
    Add1_out1(t_05) <= Add1_add_cast(t_05) + Add1_add_cast_1(t_05);
  END GENERATE Add1_out1_gen;



  Data_Type_Conversion8_out1_gen: FOR ii5 IN 0 TO 1 GENERATE
    Data_Type_Conversion8_out1(ii5) <= Add1_out1(ii5)(27 DOWNTO 0);
  END GENERATE Data_Type_Conversion8_out1_gen;



  Subtract4_out1_gen: FOR t_06 IN 0 TO 1 GENERATE
    Subtract4_sub_cast(t_06) <= resize(Data_Type_Conversion7_out1(t_06), 29);
    Subtract4_sub_cast_1(t_06) <= resize(Data_Type_Conversion8_out1(t_06), 29);
    Subtract4_out1(t_06) <= Subtract4_sub_cast(t_06) - Subtract4_sub_cast_1(t_06);
  END GENERATE Subtract4_out1_gen;



  Data_Type_Conversion9_out1_gen: FOR ii6 IN 0 TO 1 GENERATE
    Data_Type_Conversion9_out1(ii6) <= Subtract4_out1(ii6)(27 DOWNTO 0);
  END GENERATE Data_Type_Conversion9_out1_gen;


  Data_Type_Conversion9_out1_1 <= Data_Type_Conversion9_out1(1);

  Unary_Minus1_cast <= resize(Data_Type_Conversion9_out1_1, 29);
  Unary_Minus1_cast_1 <=  - (Unary_Minus1_cast);
  Unary_Minus1_out1 <= Unary_Minus1_cast_1(27 DOWNTO 0);

  
  Switch3_out1 <= Data_Type_Conversion9_out1_1 WHEN switch_compare_1_1 = '0' ELSE
      Unary_Minus1_out1;

  
  Compare_To_Constant_out1 <= '1' WHEN Data_Type_Conversion11_out1 > to_signed(16#0000000#, 28) ELSE
      '0';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_4_0 = '1' THEN
        delayMatch1_reg(0) <= Compare_To_Constant_out1;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  delayMatch1_out1 <= delayMatch1_reg(1);

  
  switch_compare_1_2 <= '1' WHEN delayMatch1_out1 > '0' ELSE
      '0';

  Data_Type_Conversion9_out1_0 <= Data_Type_Conversion9_out1(0);

  Unary_Minus_cast <= resize(Data_Type_Conversion9_out1_0, 29);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(27 DOWNTO 0);

  Constant5_out1 <= (OTHERS => to_signed(16#0000000#, 28));

  
  Switch2_out1 <= Data_Type_Conversion9_out1_0 WHEN switch_compare_1_2 = '0' ELSE
      Unary_Minus_out1;

  concatenate_out1(0) <= Switch3_out1;
  concatenate_out1(1) <= Switch2_out1;

  
  Switch10_out1 <= Constant5_out1 WHEN switch_compare_1 = '0' ELSE
      concatenate_out1;

  outputgen: FOR k IN 0 TO 1 GENERATE
    dataOut(k) <= std_logic_vector(Switch10_out1(k));
  END GENERATE;

END rtl;
