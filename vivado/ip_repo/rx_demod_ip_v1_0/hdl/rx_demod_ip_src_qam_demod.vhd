-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_qam_demod.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_qam_demod
-- Source Path: HDLRxDemodulator/rx_demodulator_full/qam_demod
-- Hierarchy Level: 1
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_qam_demod IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_in                          :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        data_out                          :   OUT   vector_of_std_logic_vector16(0 TO 3);  -- sfix16_En10 [4]
        valid_out                         :   OUT   std_logic
        );
END rx_demod_ip_src_qam_demod;


ARCHITECTURE rtl OF rx_demod_ip_src_qam_demod IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_Symbol_Demodulator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in0_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in0_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in1                             :   IN    std_logic;
          out0                            :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En14
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_Symbol_Demodulator1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in0_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in0_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in1                             :   IN    std_logic;
          out0                            :   OUT   vector_of_std_logic_vector20(0 TO 1)  -- sfix20_En14 [2]
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_Symbol_Demodulator2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in0_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in0_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          in1                             :   IN    std_logic;
          out0                            :   OUT   vector_of_std_logic_vector20(0 TO 3)  -- sfix20_En14 [4]
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_to_12bit_integer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          alpha1bit                       :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En14
          alpha2bit                       :   IN    vector_of_std_logic_vector20(0 TO 1);  -- sfix20_En14 [2]
          alpha4bit                       :   IN    vector_of_std_logic_vector20(0 TO 3);  -- sfix20_En14 [4]
          alpha1bit_out                   :   OUT   vector_of_std_logic_vector20(0 TO 3);  -- sfix20_En14 [4]
          alpha2bit_out                   :   OUT   vector_of_std_logic_vector20(0 TO 3);  -- sfix20_En14 [4]
          alpha4bit_out                   :   OUT   vector_of_std_logic_vector20(0 TO 3)  -- sfix20_En14 [4]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_ip_src_Symbol_Demodulator
    USE ENTITY work.rx_demod_ip_src_Symbol_Demodulator(rtl);

  FOR ALL : rx_demod_ip_src_Symbol_Demodulator1
    USE ENTITY work.rx_demod_ip_src_Symbol_Demodulator1(rtl);

  FOR ALL : rx_demod_ip_src_Symbol_Demodulator2
    USE ENTITY work.rx_demod_ip_src_Symbol_Demodulator2(rtl);

  FOR ALL : rx_demod_ip_src_to_12bit_integer
    USE ENTITY work.rx_demod_ip_src_to_12bit_integer(rtl);

  -- Signals
  SIGNAL bits_per_subcarrier_unsigned     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL rd_0_reg                         : vector_of_unsigned4(0 TO 5);  -- ufix4 [6]
  SIGNAL bits_per_subcarrier_1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay7_out1                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay7_out1_1                    : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Symbol_Demodulator_out1          : std_logic_vector(19 DOWNTO 0);  -- ufix20
  SIGNAL Symbol_Demodulator_out1_1        : signed(19 DOWNTO 0);  -- sfix20_En14
  SIGNAL Symbol_Demodulator1_out1         : vector_of_std_logic_vector20(0 TO 1);  -- ufix20 [2]
  SIGNAL Symbol_Demodulator1_out1_signed  : vector_of_signed20(0 TO 1);  -- sfix20_En14 [2]
  SIGNAL Symbol_Demodulator2_out1         : vector_of_std_logic_vector20(0 TO 3);  -- ufix20 [4]
  SIGNAL Symbol_Demodulator2_out1_signed  : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Symbol_Demodulator2_out1_1       : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Symbol_Demodulator_out1_2        : signed(19 DOWNTO 0);  -- sfix20_En14
  SIGNAL Symbol_Demodulator1_out1_1       : vector_of_signed20(0 TO 1);  -- sfix20_En14 [2]
  SIGNAL Delay3_out1                      : vector_of_signed20(0 TO 1);  -- sfix20_En14 [2]
  SIGNAL Delay3_out1_1                    : vector_of_std_logic_vector20(0 TO 1);  -- ufix20 [2]
  SIGNAL Symbol_Demodulator2_out1_2       : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Delay4_out1                      : vector_of_std_logic_vector20(0 TO 3);  -- ufix20 [4]
  SIGNAL to_12bit_integer_out1            : vector_of_std_logic_vector20(0 TO 3);  -- ufix20 [4]
  SIGNAL to_12bit_integer_out2            : vector_of_std_logic_vector20(0 TO 3);  -- ufix20 [4]
  SIGNAL to_12bit_integer_out3            : vector_of_std_logic_vector20(0 TO 3);  -- ufix20 [4]
  SIGNAL to_12bit_integer_out1_signed     : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL to_12bit_integer_out2_signed     : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Constant2_out1                   : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL to_12bit_integer_out3_signed     : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Constant1_out1                   : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Constant4_out1                   : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Constant5_out1                   : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Multiport_Switch_out1            : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Delay_bypass_reg                 : vector_of_signed20(0 TO 3);  -- sfix20 [4]
  SIGNAL Delay_out1                       : vector_of_signed20(0 TO 3);  -- sfix20_En14 [4]
  SIGNAL Data_Type_Conversion3_out1       : vector_of_signed16(0 TO 3);  -- sfix16_En10 [4]
  SIGNAL valid_in_1                       : std_logic;
  SIGNAL Delay5_bypass_reg                : std_logic;  -- ufix1
  SIGNAL valid_in_2                       : std_logic;

BEGIN
  -- Note: using not a defailt QAM constellation results in an error while doing the HDL Code Generation

  u_Symbol_Demodulator : rx_demod_ip_src_Symbol_Demodulator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in0_re => data_in_re,  -- sfix16_En14
              in0_im => data_in_im,  -- sfix16_En14
              in1 => valid_in,
              out0 => Symbol_Demodulator_out1  -- sfix20_En14
              );

  u_Symbol_Demodulator1 : rx_demod_ip_src_Symbol_Demodulator1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in0_re => data_in_re,  -- sfix16_En14
              in0_im => data_in_im,  -- sfix16_En14
              in1 => valid_in,
              out0 => Symbol_Demodulator1_out1  -- sfix20_En14 [2]
              );

  u_Symbol_Demodulator2 : rx_demod_ip_src_Symbol_Demodulator2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in0_re => data_in_re,  -- sfix16_En14
              in0_im => data_in_im,  -- sfix16_En14
              in1 => valid_in,
              out0 => Symbol_Demodulator2_out1  -- sfix20_En14 [4]
              );

  u_to_12bit_integer : rx_demod_ip_src_to_12bit_integer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              alpha1bit => std_logic_vector(Symbol_Demodulator_out1_2),  -- sfix20_En14
              alpha2bit => Delay3_out1_1,  -- sfix20_En14 [2]
              alpha4bit => Delay4_out1,  -- sfix20_En14 [4]
              alpha1bit_out => to_12bit_integer_out1,  -- sfix20_En14 [4]
              alpha2bit_out => to_12bit_integer_out2,  -- sfix20_En14 [4]
              alpha4bit_out => to_12bit_integer_out3  -- sfix20_En14 [4]
              );

  bits_per_subcarrier_unsigned <= unsigned(bits_per_subcarrier);

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_0_reg <= (OTHERS => to_unsigned(16#0#, 4));
      ELSIF enb_1_2_0 = '1' THEN
        rd_0_reg(0) <= bits_per_subcarrier_unsigned;
        rd_0_reg(1 TO 5) <= rd_0_reg(0 TO 4);
      END IF;
    END IF;
  END PROCESS rd_0_process;

  bits_per_subcarrier_1 <= rd_0_reg(5);

  Delay7_out1 <= bits_per_subcarrier_1;

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_1 <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' THEN
        Delay7_out1_1 <= Delay7_out1;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  Symbol_Demodulator_out1_1 <= signed(Symbol_Demodulator_out1);

  outputgen7: FOR k IN 0 TO 1 GENERATE
    Symbol_Demodulator1_out1_signed(k) <= signed(Symbol_Demodulator1_out1(k));
  END GENERATE;

  outputgen6: FOR k IN 0 TO 3 GENERATE
    Symbol_Demodulator2_out1_signed(k) <= signed(Symbol_Demodulator2_out1(k));
  END GENERATE;

  Symbol_Demodulator2_out1_1 <= Symbol_Demodulator2_out1_signed;

  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Symbol_Demodulator_out1_2 <= to_signed(16#00000#, 20);
      ELSIF enb = '1' THEN
        Symbol_Demodulator_out1_2 <= Symbol_Demodulator_out1_1;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  rd_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Symbol_Demodulator1_out1_1 <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_1_2_0 = '1' THEN
        Symbol_Demodulator1_out1_1 <= Symbol_Demodulator1_out1_signed;
      END IF;
    END IF;
  END PROCESS rd_3_process;


  Delay3_out1 <= Symbol_Demodulator1_out1_1;

  outputgen5: FOR k IN 0 TO 1 GENERATE
    Delay3_out1_1(k) <= std_logic_vector(Delay3_out1(k));
  END GENERATE;

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Symbol_Demodulator2_out1_2 <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb = '1' THEN
        Symbol_Demodulator2_out1_2 <= Symbol_Demodulator2_out1_1;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  outputgen4: FOR k IN 0 TO 3 GENERATE
    Delay4_out1(k) <= std_logic_vector(Symbol_Demodulator2_out1_2(k));
  END GENERATE;

  outputgen3: FOR k IN 0 TO 3 GENERATE
    to_12bit_integer_out1_signed(k) <= signed(to_12bit_integer_out1(k));
  END GENERATE;

  outputgen2: FOR k IN 0 TO 3 GENERATE
    to_12bit_integer_out2_signed(k) <= signed(to_12bit_integer_out2(k));
  END GENERATE;

  Constant2_out1 <= (OTHERS => to_signed(16#00000#, 20));

  outputgen1: FOR k IN 0 TO 3 GENERATE
    to_12bit_integer_out3_signed(k) <= signed(to_12bit_integer_out3(k));
  END GENERATE;

  Constant1_out1 <= (OTHERS => to_signed(16#00000#, 20));

  Constant4_out1 <= (OTHERS => to_signed(16#00000#, 20));

  Constant5_out1 <= (OTHERS => to_signed(16#00000#, 20));

  Multiport_Switch_output : PROCESS (Constant1_out1, Constant2_out1, Constant4_out1, Constant5_out1, Delay7_out1_1,
       to_12bit_integer_out1_signed, to_12bit_integer_out2_signed,
       to_12bit_integer_out3_signed)
  BEGIN
    IF Delay7_out1_1 = to_unsigned(16#0#, 4) THEN 
      Multiport_Switch_out1 <= to_12bit_integer_out1_signed;
    ELSIF Delay7_out1_1 = to_unsigned(16#1#, 4) THEN 
      Multiport_Switch_out1 <= to_12bit_integer_out1_signed;
    ELSIF Delay7_out1_1 = to_unsigned(16#2#, 4) THEN 
      Multiport_Switch_out1 <= to_12bit_integer_out2_signed;
    ELSIF Delay7_out1_1 = to_unsigned(16#3#, 4) THEN 
      Multiport_Switch_out1 <= Constant2_out1;
    ELSIF Delay7_out1_1 = to_unsigned(16#4#, 4) THEN 
      Multiport_Switch_out1 <= to_12bit_integer_out3_signed;
    ELSIF Delay7_out1_1 = to_unsigned(16#5#, 4) THEN 
      Multiport_Switch_out1 <= Constant1_out1;
    ELSIF Delay7_out1_1 = to_unsigned(16#6#, 4) THEN 
      Multiport_Switch_out1 <= Constant4_out1;
    ELSE 
      Multiport_Switch_out1 <= Constant5_out1;
    END IF;
  END PROCESS Multiport_Switch_output;


  Delay_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_bypass_reg <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_1_2_1 = '1' THEN
        Delay_bypass_reg <= Multiport_Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay_bypass_process;

  
  Delay_out1 <= Multiport_Switch_out1 WHEN enb_1_2_1 = '1' ELSE
      Delay_bypass_reg;


  Data_Type_Conversion3_out1_gen: FOR ii IN 0 TO 3 GENERATE
    Data_Type_Conversion3_out1(ii) <= Delay_out1(ii)(19 DOWNTO 4);
  END GENERATE Data_Type_Conversion3_out1_gen;


  outputgen: FOR k IN 0 TO 3 GENERATE
    data_out(k) <= std_logic_vector(Data_Type_Conversion3_out1(k));
  END GENERATE;

  valid_in_1 <= valid_in;

  Delay5_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_bypass_reg <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Delay5_bypass_reg <= valid_in_1;
      END IF;
    END IF;
  END PROCESS Delay5_bypass_process;

  
  valid_in_2 <= valid_in_1 WHEN enb_1_2_1 = '1' ELSE
      Delay5_bypass_reg;

  valid_out <= valid_in_2;

END rtl;
