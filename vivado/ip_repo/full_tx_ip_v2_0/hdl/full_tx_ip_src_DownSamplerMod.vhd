-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_DownSamplerMod.vhd
-- Created: 2024-08-11 18:37:16
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_DownSamplerMod
-- Source Path: 
-- Hierarchy Level: 4
-- Model version: 4.91
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_tx_ip_src_full_tx_pac.ALL;

ENTITY full_tx_ip_src_DownSamplerMod IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        varargin_1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        varargin_1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        varargin_2                        :   IN    std_logic;
        varargin_3                        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        varargin_4                        :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        varargout_1_re                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        varargout_1_im                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        varargout_2                       :   OUT   std_logic;
        varargout_3                       :   OUT   std_logic_vector(9 DOWNTO 0);  -- ufix10
        varargout_4                       :   OUT   std_logic_vector(9 DOWNTO 0)  -- ufix10
        );
END full_tx_ip_src_DownSamplerMod;


ARCHITECTURE rtl OF full_tx_ip_src_DownSamplerMod IS

  -- Constants
  CONSTANT nc                             : vector_of_unsigned9(0 TO 7) := 
    (to_unsigned(16#002#, 9), to_unsigned(16#004#, 9), to_unsigned(16#008#, 9), to_unsigned(16#010#, 9),
     to_unsigned(16#020#, 9), to_unsigned(16#040#, 9), to_unsigned(16#080#, 9), to_unsigned(16#100#, 9));  -- ufix9 [8]
  CONSTANT nc_2                           : vector_of_unsigned9(0 TO 7) := 
    (to_unsigned(16#007#, 9), to_unsigned(16#006#, 9), to_unsigned(16#005#, 9), to_unsigned(16#004#, 9),
     to_unsigned(16#003#, 9), to_unsigned(16#002#, 9), to_unsigned(16#001#, 9), to_unsigned(16#000#, 9));  -- ufix9 [8]

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL varargout_3_1                    : std_logic;
  SIGNAL obj_DownSamplerModObj_resetSig   : std_logic;
  SIGNAL obj_DownSamplerModObj_resetSig_1 : std_logic;
  SIGNAL tmp                              : std_logic;
  SIGNAL obj_DownSamplerModObj_validInReg : std_logic;
  SIGNAL tmp_1                            : std_logic;
  SIGNAL obj_DownSamplerModObj_validInReg_1 : std_logic;
  SIGNAL obj_DownSamplerModObj_validInReg1 : std_logic;
  SIGNAL tmp_2                            : std_logic;
  SIGNAL obj_DownSamplerModObj_validInReg1_1 : std_logic;
  SIGNAL obj_DownSamplerModObj_sampCount  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_sampCount_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_sampCount_2 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_3                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s                                : std_logic;
  SIGNAL tmp_4                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_5                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_6                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_1                              : std_logic;
  SIGNAL obj_DownSamplerModObj_FFTArr     : vector_of_unsigned9(0 TO 7);  -- ufix9 [8]
  SIGNAL obj_DownSamplerModObj_diffBits   : vector_of_unsigned9(0 TO 7);  -- ufix9 [8]
  SIGNAL varargin_3_unsigned              : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_FFTReg     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_count      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_count_1    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_count_2    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_7                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL k                                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p214k_cast                       : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL p214k_cast_1                     : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL p214k_cast_2                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL k_1                              : std_logic;
  SIGNAL tmp_8                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL k_2                              : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL k_3                              : std_logic;
  SIGNAL tmp_9                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_2                              : std_logic;
  SIGNAL s_3                              : std_logic;
  SIGNAL y                                : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_10                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL y_1                              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_11                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_12                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL c                                : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_13                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upFac      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upFac_1    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_14                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_15                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_4                              : std_logic;
  SIGNAL s_5                              : std_logic;
  SIGNAL obj_DownSamplerModObj_upFacMinVec : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_6                              : std_logic;
  SIGNAL obj_DownSamplerModObj_upCount    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upCount_1  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upCount_2  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upCount_3  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_upCount_4  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_16                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_17                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_7                              : std_logic;
  SIGNAL tmp_18                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_19                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_20                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_21                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_8                              : std_logic;
  SIGNAL varargin_1_re_signed             : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL varargin_1_im_signed             : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataReg_re : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataReg_im : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re                           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im                           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataReg_re_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataReg_im_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataInReg_re : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataInReg_im : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_1                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_1                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataInReg_re_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataInReg_im_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_buffer_re  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_buffer_im  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_buffer_re_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_buffer_im_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_2                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_2                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_3                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_3                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_4                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_4                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_5                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_5                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataOut_re : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataOut_im : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_re_6                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tmp_im_6                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataOut_re_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_dataOut_im_1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL obj_DownSamplerModObj_validOutReg : std_logic;
  SIGNAL obj_DownSamplerModObj_validOutReg_1 : std_logic;
  SIGNAL obj_DownSamplerModObj_inCount    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_inCount_1  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_inCount_2  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_22                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_9                              : std_logic;
  SIGNAL tmp_23                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_24                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_25                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_26                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_27                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_validOutReg_2 : std_logic;
  SIGNAL obj_DownSamplerModObj_validOutReg_3 : std_logic;
  SIGNAL tmp_28                           : std_logic;
  SIGNAL tmp_29                           : std_logic;
  SIGNAL obj_DownSamplerModObj_filledVecCnt : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_10                             : std_logic;
  SIGNAL obj_DownSamplerModObj_storedIdx  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_30                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_filledVecCnt_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_31                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_32                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_33                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_validOutReg_4 : std_logic;
  SIGNAL obj_DownSamplerModObj_validOutReg_5 : std_logic;
  SIGNAL tmp_34                           : std_logic;
  SIGNAL tmp_35                           : std_logic;
  SIGNAL tmp_36                           : std_logic;
  SIGNAL obj_DownSamplerModObj_validOutReg_6 : std_logic;
  SIGNAL tmp_37                           : std_logic;
  SIGNAL obj_DownSamplerModObj_validOutReg_7 : std_logic;
  SIGNAL obj_DownSamplerModObj_validOut   : std_logic;
  SIGNAL tmp_38                           : std_logic;
  SIGNAL obj_DownSamplerModObj_validOut_1 : std_logic;
  SIGNAL obj_DownSamplerModObj_FFTReg_1   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_39                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_FFTReg_2   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_FFTReg1    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_FFTReg1_1  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_40                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_41                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_outCount   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_outCount_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_outCount_2 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_42                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_11                             : std_logic;
  SIGNAL tmp_43                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_44                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_45                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL s_12                             : std_logic;
  SIGNAL obj_DownSamplerModObj_FFTReg3    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_FFTReg3_1  : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_46                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_47                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_48                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_FFTLengthOut : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_FFTLengthOut_1 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_49                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_FFTLengthOut_2 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL varargin_4_unsigned              : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_cpLen      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_50                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_cpLen_1    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_51                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_CPLenSampled : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_CPLenSampled_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_52                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_53                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_CPLenSampled2 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_CPLenSampled2_1 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_54                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_55                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_56                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL obj_DownSamplerModObj_CPLengthOut : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_CPLengthOut_1 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_57                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL obj_DownSamplerModObj_CPLengthOut_2 : unsigned(9 DOWNTO 0);  -- ufix10

BEGIN
  varargout_3_1 <= varargin_2;

  obj_DownSamplerModObj_resetSig <= '0';

  
  tmp <= obj_DownSamplerModObj_resetSig_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_resetSig;

  obj_DownSamplerModObj_resetSig_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_resetSig_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_resetSig_1 <= tmp;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_resetSig_reg_process;


  obj_DownSamplerModObj_validInReg <= '0';

  
  tmp_1 <= varargout_3_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_validInReg;

  obj_DownSamplerModObj_validInReg_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_validInReg_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_validInReg_1 <= tmp_1;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_validInReg_reg_process;


  obj_DownSamplerModObj_validInReg1 <= '0';

  
  tmp_2 <= obj_DownSamplerModObj_validInReg_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_validInReg1;

  obj_DownSamplerModObj_validInReg1_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_validInReg1_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_validInReg1_1 <= tmp_2;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_validInReg1_reg_process;


  obj_DownSamplerModObj_sampCount <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_sampCount_1 <= to_unsigned(16#000#, 9);

  tmp_3 <= obj_DownSamplerModObj_sampCount_2 + to_unsigned(16#001#, 9);

  
  s <= '1' WHEN resize(obj_DownSamplerModObj_sampCount_2, 10) = to_unsigned(16#0FF#, 10) ELSE
      '0';

  
  tmp_4 <= tmp_3 WHEN s = '0' ELSE
      obj_DownSamplerModObj_sampCount;

  
  tmp_5 <= obj_DownSamplerModObj_sampCount_2 WHEN obj_DownSamplerModObj_validInReg_1 = '0' ELSE
      tmp_4;

  
  tmp_6 <= tmp_5 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_sampCount_1;

  obj_DownSamplerModObj_sampCount_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_sampCount_2 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_sampCount_2 <= tmp_6;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_sampCount_reg_process;


  s_1 <= hdlcoder_to_stdlogic(obj_DownSamplerModObj_sampCount_2 = to_unsigned(16#000#, 9)) AND obj_DownSamplerModObj_validInReg_1;

  obj_DownSamplerModObj_FFTArr <= nc;

  obj_DownSamplerModObj_diffBits <= nc_2;

  varargin_3_unsigned <= unsigned(varargin_3);

  obj_DownSamplerModObj_FFTReg <= varargin_3_unsigned(8 DOWNTO 0);

  obj_DownSamplerModObj_count <= to_unsigned(16#000#, 9);

  p139_output : PROCESS (obj_DownSamplerModObj_FFTArr, obj_DownSamplerModObj_FFTReg,
       obj_DownSamplerModObj_count_1, obj_DownSamplerModObj_diffBits)
    VARIABLE obj_DownSamplerModObj_count1 : unsigned(8 DOWNTO 0);
    VARIABLE obj_downsamplermodobj_count_0 : unsigned(8 DOWNTO 0);
  BEGIN
    obj_downsamplermodobj_count_0 := to_unsigned(16#000#, 9);
    obj_DownSamplerModObj_count1 := obj_DownSamplerModObj_count_1;

    FOR ind IN 0 TO 7 LOOP
      IF obj_DownSamplerModObj_FFTArr(ind) = obj_DownSamplerModObj_FFTReg THEN 
        obj_downsamplermodobj_count_0 := obj_DownSamplerModObj_diffBits(ind);
      ELSE 
        obj_downsamplermodobj_count_0 := obj_DownSamplerModObj_count1;
      END IF;
      obj_DownSamplerModObj_count1 := obj_downsamplermodobj_count_0;
    END LOOP;

    obj_DownSamplerModObj_count_2 <= obj_DownSamplerModObj_count1;
  END PROCESS p139_output;


  
  tmp_7 <= obj_DownSamplerModObj_count_2 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_count;

  obj_DownSamplerModObj_count_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_count_1 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_count_1 <= tmp_7;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_count_reg_process;


  p214k_cast <= signed(resize(obj_DownSamplerModObj_count_1, 10));
  p214k_cast_1 <=  - (p214k_cast);
  p214k_cast_2 <= unsigned(p214k_cast_1(8 DOWNTO 0));
  
  k <= "11111111" WHEN p214k_cast_2(8) /= '0' ELSE
      p214k_cast_2(7 DOWNTO 0);

  
  k_1 <= '1' WHEN k >= to_unsigned(16#00000009#, 8) ELSE
      '0';

  tmp_8 <= SHIFT_RIGHT(to_unsigned(16#001#, 9), to_integer(k));

  
  k_2 <= "11111111" WHEN obj_DownSamplerModObj_count_1(8) /= '0' ELSE
      obj_DownSamplerModObj_count_1(7 DOWNTO 0);

  
  k_3 <= '1' WHEN k_2 >= to_unsigned(16#00000009#, 8) ELSE
      '0';

  tmp_9 <= to_unsigned(16#001#, 9) sll to_integer(k_2);

  
  s_2 <= '1' WHEN obj_DownSamplerModObj_count_1 = to_unsigned(16#000#, 9) ELSE
      '0';

  
  s_3 <= '1' WHEN obj_DownSamplerModObj_count_1 > to_unsigned(16#000#, 9) ELSE
      '0';

  y <= to_unsigned(16#000#, 9);

  
  tmp_10 <= tmp_8 WHEN k_1 = '0' ELSE
      y;

  y_1 <= to_unsigned(16#000#, 9);

  
  tmp_11 <= tmp_9 WHEN k_3 = '0' ELSE
      y_1;

  
  tmp_12 <= tmp_10 WHEN s_3 = '0' ELSE
      tmp_11;

  c <= to_unsigned(16#001#, 9);

  
  tmp_13 <= tmp_12 WHEN s_2 = '0' ELSE
      c;

  obj_DownSamplerModObj_upFac <= to_unsigned(16#000#, 9);

  
  tmp_14 <= obj_DownSamplerModObj_upFac_1 WHEN s_1 = '0' ELSE
      tmp_13;

  
  tmp_15 <= tmp_14 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_upFac;

  obj_DownSamplerModObj_upFac_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_upFac_1 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_upFac_1 <= tmp_15;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_upFac_reg_process;


  
  s_4 <= '1' WHEN obj_DownSamplerModObj_upFac_1 < to_unsigned(16#001#, 9) ELSE
      '0';

  
  s_5 <= '1' WHEN obj_DownSamplerModObj_upFac_1 >= to_unsigned(16#001#, 9) ELSE
      '0';

  obj_DownSamplerModObj_upFacMinVec <= obj_DownSamplerModObj_upFac_1 - to_unsigned(16#001#, 9);

  
  s_6 <= '1' WHEN obj_DownSamplerModObj_upFac_1 = to_unsigned(16#001#, 9) ELSE
      '0';

  obj_DownSamplerModObj_upCount <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_upCount_1 <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_upCount_2 <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_upCount_3 <= to_unsigned(16#000#, 9);

  tmp_16 <= obj_DownSamplerModObj_upCount_4 + to_unsigned(16#001#, 9);

  
  tmp_17 <= tmp_16 WHEN s_6 = '0' ELSE
      obj_DownSamplerModObj_upCount;

  
  s_7 <= '1' WHEN obj_DownSamplerModObj_upCount_4 = obj_DownSamplerModObj_upFacMinVec ELSE
      '0';

  
  tmp_18 <= tmp_17 WHEN s_7 = '0' ELSE
      obj_DownSamplerModObj_upCount_2;

  
  tmp_19 <= obj_DownSamplerModObj_upCount_1 WHEN s_5 = '0' ELSE
      tmp_18;

  
  tmp_20 <= obj_DownSamplerModObj_upCount_4 WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_19;

  
  tmp_21 <= tmp_20 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_upCount_3;

  obj_DownSamplerModObj_upCount_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_upCount_4 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_upCount_4 <= tmp_21;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_upCount_reg_process;


  
  s_8 <= '1' WHEN obj_DownSamplerModObj_upCount_4 = to_unsigned(16#000#, 9) ELSE
      '0';

  varargin_1_re_signed <= signed(varargin_1_re);

  varargin_1_im_signed <= signed(varargin_1_im);

  obj_DownSamplerModObj_dataReg_re <= to_signed(16#0000#, 16);
  obj_DownSamplerModObj_dataReg_im <= to_signed(16#0000#, 16);

  
  tmp_re <= varargin_1_re_signed WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataReg_re;
  
  tmp_im <= varargin_1_im_signed WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataReg_im;

  obj_DownSamplerModObj_dataReg_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_dataReg_re_1 <= to_signed(16#0000#, 16);
        obj_DownSamplerModObj_dataReg_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_dataReg_re_1 <= tmp_re;
        obj_DownSamplerModObj_dataReg_im_1 <= tmp_im;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_dataReg_reg_process;


  obj_DownSamplerModObj_dataInReg_re <= to_signed(16#0000#, 16);
  obj_DownSamplerModObj_dataInReg_im <= to_signed(16#0000#, 16);

  
  tmp_re_1 <= obj_DownSamplerModObj_dataReg_re_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_re;
  
  tmp_im_1 <= obj_DownSamplerModObj_dataReg_im_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_im;

  obj_DownSamplerModObj_dataInReg_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_dataInReg_re_1 <= to_signed(16#0000#, 16);
        obj_DownSamplerModObj_dataInReg_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_dataInReg_re_1 <= tmp_re_1;
        obj_DownSamplerModObj_dataInReg_im_1 <= tmp_im_1;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_dataInReg_reg_process;


  obj_DownSamplerModObj_buffer_re <= to_signed(16#0000#, 16);
  obj_DownSamplerModObj_buffer_im <= to_signed(16#0000#, 16);

  
  tmp_re_2 <= obj_DownSamplerModObj_buffer_re_1 WHEN s_8 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_re_1;
  
  tmp_im_2 <= obj_DownSamplerModObj_buffer_im_1 WHEN s_8 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_im_1;

  
  tmp_re_3 <= tmp_re_2 WHEN s_4 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_re_1;
  
  tmp_im_3 <= tmp_im_2 WHEN s_4 = '0' ELSE
      obj_DownSamplerModObj_dataInReg_im_1;

  
  tmp_re_4 <= obj_DownSamplerModObj_buffer_re_1 WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_re_3;
  
  tmp_im_4 <= obj_DownSamplerModObj_buffer_im_1 WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_im_3;

  
  tmp_re_5 <= tmp_re_4 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_buffer_re;
  
  tmp_im_5 <= tmp_im_4 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_buffer_im;

  obj_DownSamplerModObj_buffer_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_buffer_re_1 <= to_signed(16#0000#, 16);
        obj_DownSamplerModObj_buffer_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_buffer_re_1 <= tmp_re_5;
        obj_DownSamplerModObj_buffer_im_1 <= tmp_im_5;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_buffer_reg_process;


  obj_DownSamplerModObj_dataOut_re <= to_signed(16#0000#, 16);
  obj_DownSamplerModObj_dataOut_im <= to_signed(16#0000#, 16);

  
  tmp_re_6 <= obj_DownSamplerModObj_buffer_re_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataOut_re;
  
  tmp_im_6 <= obj_DownSamplerModObj_buffer_im_1 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_dataOut_im;

  obj_DownSamplerModObj_dataOut_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_dataOut_re_1 <= to_signed(16#0000#, 16);
        obj_DownSamplerModObj_dataOut_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_dataOut_re_1 <= tmp_re_6;
        obj_DownSamplerModObj_dataOut_im_1 <= tmp_im_6;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_dataOut_reg_process;


  varargout_1_re <= std_logic_vector(obj_DownSamplerModObj_dataOut_re_1);

  varargout_1_im <= std_logic_vector(obj_DownSamplerModObj_dataOut_im_1);

  obj_DownSamplerModObj_validOutReg <= '0';

  obj_DownSamplerModObj_validOutReg_1 <= '0';

  obj_DownSamplerModObj_inCount <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_inCount_1 <= to_unsigned(16#000#, 9);

  tmp_22 <= obj_DownSamplerModObj_inCount_2 + to_unsigned(16#001#, 9);

  
  tmp_23 <= tmp_22 WHEN s_9 = '0' ELSE
      obj_DownSamplerModObj_inCount;

  
  tmp_24 <= obj_DownSamplerModObj_inCount_2 WHEN s_8 = '0' ELSE
      tmp_23;

  
  tmp_25 <= tmp_24 WHEN s_4 = '0' ELSE
      obj_DownSamplerModObj_inCount_2;

  
  tmp_26 <= obj_DownSamplerModObj_inCount_2 WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_25;

  
  tmp_27 <= tmp_26 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_inCount_1;

  obj_DownSamplerModObj_inCount_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_inCount_2 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_inCount_2 <= tmp_27;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_inCount_reg_process;


  
  s_9 <= '1' WHEN resize(obj_DownSamplerModObj_inCount_2, 10) = to_unsigned(16#000#, 10) ELSE
      '0';

  obj_DownSamplerModObj_validOutReg_2 <= '0';

  obj_DownSamplerModObj_validOutReg_3 <= '1';

  
  tmp_28 <= obj_DownSamplerModObj_validOutReg_2 WHEN s_9 = '0' ELSE
      obj_DownSamplerModObj_validOutReg_3;

  
  tmp_29 <= obj_DownSamplerModObj_validOutReg_1 WHEN s_8 = '0' ELSE
      tmp_28;

  obj_DownSamplerModObj_filledVecCnt <= to_unsigned(16#000#, 9);

  
  tmp_30 <= obj_DownSamplerModObj_storedIdx WHEN s_10 = '0' ELSE
      obj_DownSamplerModObj_filledVecCnt;

  
  tmp_31 <= obj_DownSamplerModObj_filledVecCnt_1 WHEN s_4 = '0' ELSE
      tmp_30;

  obj_DownSamplerModObj_filledVecCnt_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_filledVecCnt_1 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_filledVecCnt_1 <= tmp_32;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_filledVecCnt_reg_process;


  
  tmp_32 <= obj_DownSamplerModObj_filledVecCnt_1 WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_31;

  tmp_33 <= tmp_32 + to_unsigned(16#001#, 9);

  obj_DownSamplerModObj_storedIdx_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_storedIdx <= to_unsigned(16#001#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_storedIdx <= tmp_33;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_storedIdx_reg_process;


  
  s_10 <= '1' WHEN obj_DownSamplerModObj_storedIdx = to_unsigned(16#001#, 9) ELSE
      '0';

  obj_DownSamplerModObj_validOutReg_4 <= '0';

  obj_DownSamplerModObj_validOutReg_5 <= '1';

  
  tmp_34 <= obj_DownSamplerModObj_validOutReg_4 WHEN s_10 = '0' ELSE
      obj_DownSamplerModObj_validOutReg_5;

  
  tmp_35 <= tmp_29 WHEN s_4 = '0' ELSE
      tmp_34;

  
  tmp_36 <= obj_DownSamplerModObj_validOutReg WHEN obj_DownSamplerModObj_validInReg1_1 = '0' ELSE
      tmp_35;

  obj_DownSamplerModObj_validOutReg_6 <= '0';

  
  tmp_37 <= tmp_36 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_validOutReg_6;

  obj_DownSamplerModObj_validOutReg_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_validOutReg_7 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_validOutReg_7 <= tmp_37;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_validOutReg_reg_process;


  obj_DownSamplerModObj_validOut <= '0';

  
  tmp_38 <= obj_DownSamplerModObj_validOutReg_7 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_validOut;

  obj_DownSamplerModObj_validOut_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_validOut_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_validOut_1 <= tmp_38;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_validOut_reg_process;


  obj_DownSamplerModObj_FFTReg_1 <= to_unsigned(16#010#, 9);

  
  tmp_39 <= obj_DownSamplerModObj_FFTReg WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_FFTReg_1;

  obj_DownSamplerModObj_FFTReg_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_FFTReg_2 <= to_unsigned(16#010#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_FFTReg_2 <= tmp_39;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_FFTReg_reg_process;


  obj_DownSamplerModObj_FFTReg1 <= to_unsigned(16#010#, 9);

  
  tmp_40 <= obj_DownSamplerModObj_FFTReg1_1 WHEN s_1 = '0' ELSE
      obj_DownSamplerModObj_FFTReg_2;

  
  tmp_41 <= tmp_40 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_FFTReg1;

  obj_DownSamplerModObj_FFTReg1_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_FFTReg1_1 <= to_unsigned(16#010#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_FFTReg1_1 <= tmp_41;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_FFTReg1_reg_process;


  obj_DownSamplerModObj_outCount <= to_unsigned(16#000#, 9);

  obj_DownSamplerModObj_outCount_1 <= to_unsigned(16#000#, 9);

  tmp_42 <= obj_DownSamplerModObj_outCount_2 + to_unsigned(16#001#, 9);

  
  s_11 <= '1' WHEN obj_DownSamplerModObj_outCount_2 = (obj_DownSamplerModObj_FFTReg1_1 - to_unsigned(16#001#, 9)) ELSE
      '0';

  
  tmp_43 <= tmp_42 WHEN s_11 = '0' ELSE
      obj_DownSamplerModObj_outCount;

  
  tmp_44 <= obj_DownSamplerModObj_outCount_2 WHEN tmp_36 = '0' ELSE
      tmp_43;

  
  tmp_45 <= tmp_44 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_outCount_1;

  obj_DownSamplerModObj_outCount_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_outCount_2 <= to_unsigned(16#000#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_outCount_2 <= tmp_45;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_outCount_reg_process;


  
  s_12 <= '1' WHEN obj_DownSamplerModObj_outCount_2 = to_unsigned(16#000#, 9) ELSE
      '0';

  obj_DownSamplerModObj_FFTReg3 <= to_unsigned(16#010#, 9);

  
  tmp_46 <= obj_DownSamplerModObj_FFTReg3_1 WHEN s_12 = '0' ELSE
      obj_DownSamplerModObj_FFTReg1_1;

  
  tmp_47 <= obj_DownSamplerModObj_FFTReg3_1 WHEN tmp_36 = '0' ELSE
      tmp_46;

  
  tmp_48 <= tmp_47 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_FFTReg3;

  obj_DownSamplerModObj_FFTReg3_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_FFTReg3_1 <= to_unsigned(16#010#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_FFTReg3_1 <= tmp_48;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_FFTReg3_reg_process;


  obj_DownSamplerModObj_FFTLengthOut <= resize(obj_DownSamplerModObj_FFTReg3_1, 10);

  obj_DownSamplerModObj_FFTLengthOut_1 <= to_unsigned(16#040#, 10);

  
  tmp_49 <= obj_DownSamplerModObj_FFTLengthOut WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_FFTLengthOut_1;

  obj_DownSamplerModObj_FFTLengthOut_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_FFTLengthOut_2 <= to_unsigned(16#040#, 10);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_FFTLengthOut_2 <= tmp_49;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_FFTLengthOut_reg_process;


  varargout_3 <= std_logic_vector(obj_DownSamplerModObj_FFTLengthOut_2);

  varargin_4_unsigned <= unsigned(varargin_4);

  obj_DownSamplerModObj_cpLen <= to_unsigned(16#006#, 10);

  
  tmp_50 <= varargin_4_unsigned WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_cpLen;

  obj_DownSamplerModObj_cpLen_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_cpLen_1 <= to_unsigned(16#006#, 10);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_cpLen_1 <= tmp_50;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_cpLen_reg_process;


  tmp_51 <= obj_DownSamplerModObj_cpLen_1(8 DOWNTO 0);

  obj_DownSamplerModObj_CPLenSampled <= to_unsigned(16#008#, 9);

  
  tmp_52 <= obj_DownSamplerModObj_CPLenSampled_1 WHEN s_1 = '0' ELSE
      tmp_51;

  
  tmp_53 <= tmp_52 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_CPLenSampled;

  obj_DownSamplerModObj_CPLenSampled_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_CPLenSampled_1 <= to_unsigned(16#008#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_CPLenSampled_1 <= tmp_53;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_CPLenSampled_reg_process;


  obj_DownSamplerModObj_CPLenSampled2 <= to_unsigned(16#008#, 9);

  
  tmp_54 <= obj_DownSamplerModObj_CPLenSampled2_1 WHEN s_12 = '0' ELSE
      obj_DownSamplerModObj_CPLenSampled_1;

  
  tmp_55 <= obj_DownSamplerModObj_CPLenSampled2_1 WHEN tmp_36 = '0' ELSE
      tmp_54;

  
  tmp_56 <= tmp_55 WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_CPLenSampled2;

  obj_DownSamplerModObj_CPLenSampled2_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_CPLenSampled2_1 <= to_unsigned(16#008#, 9);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_CPLenSampled2_1 <= tmp_56;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_CPLenSampled2_reg_process;


  obj_DownSamplerModObj_CPLengthOut <= resize(obj_DownSamplerModObj_CPLenSampled2_1, 10);

  obj_DownSamplerModObj_CPLengthOut_1 <= to_unsigned(16#006#, 10);

  
  tmp_57 <= obj_DownSamplerModObj_CPLengthOut WHEN obj_DownSamplerModObj_resetSig_1 = '0' ELSE
      obj_DownSamplerModObj_CPLengthOut_1;

  obj_DownSamplerModObj_CPLengthOut_reg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        obj_DownSamplerModObj_CPLengthOut_2 <= to_unsigned(16#006#, 10);
      ELSIF enb_1_2_0 = '1' THEN
        obj_DownSamplerModObj_CPLengthOut_2 <= tmp_57;
      END IF;
    END IF;
  END PROCESS obj_DownSamplerModObj_CPLengthOut_reg_process;


  varargout_4 <= std_logic_vector(obj_DownSamplerModObj_CPLengthOut_2);

  varargout_2 <= obj_DownSamplerModObj_validOut_1;

END rtl;
