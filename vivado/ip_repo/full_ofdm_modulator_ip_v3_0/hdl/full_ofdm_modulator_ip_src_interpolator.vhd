-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_interpolator.vhd
-- Created: 2024-09-01 12:13:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_interpolator
-- Source Path: HDLModulatorFull/full_ofdm_modulator/interpolator
-- Hierarchy Level: 1
-- Model version: 1.43
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_ofdm_modulator_ip_src_full_ofdm_modulator_pac.ALL;

ENTITY full_ofdm_modulator_ip_src_interpolator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_in_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_in                          :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic
        );
END full_ofdm_modulator_ip_src_interpolator;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_interpolator IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_src_FIR_Interpolator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dataIn_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dataOut_im                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_ofdm_modulator_ip_src_falling_edge_detector
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          in_rsvd                         :   IN    std_logic;
          out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_src_FIR_Interpolator
    USE ENTITY work.full_ofdm_modulator_ip_src_FIR_Interpolator(rtl);

  FOR ALL : full_ofdm_modulator_ip_src_falling_edge_detector
    USE ENTITY work.full_ofdm_modulator_ip_src_falling_edge_detector(rtl);

  -- Signals
  SIGNAL Upsample_muxsel                  : std_logic;  -- ufix1
  SIGNAL data_in_re_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL data_in_im_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay5_reg_re                    : vector_of_signed12(0 TO 1);  -- sfix12_En10 [2]
  SIGNAL Delay5_reg_im                    : vector_of_signed12(0 TO 1);  -- sfix12_En10 [2]
  SIGNAL Delay5_out1_re                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay5_out1_im                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Upsample_zero_re                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Upsample_zero_im                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Upsample_out1_re                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Upsample_out1_im                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Upsample1_muxsel                 : std_logic;  -- ufix1
  SIGNAL Delay3_reg                       : std_logic_vector(8 DOWNTO 0);  -- ufix1 [9]
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Delay2_reg                       : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Upsample1_zero                   : std_logic;
  SIGNAL Upsample1_out1                   : std_logic;
  SIGNAL FIR_Interpolator_out1_re         : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL FIR_Interpolator_out1_im         : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL FIR_Interpolator_out2            : std_logic;
  SIGNAL FIR_Interpolator_out1_re_signed  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL FIR_Interpolator_out1_im_signed  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay4_out1_re                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay4_out1_im                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay1_reg                       : std_logic_vector(16 DOWNTO 0);  -- ufix1 [17]
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL falling_edge_detector_out1       : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;

BEGIN
  u_FIR_Interpolator : full_ofdm_modulator_ip_src_FIR_Interpolator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => std_logic_vector(Upsample_out1_re),  -- sfix12_En10
              dataIn_im => std_logic_vector(Upsample_out1_im),  -- sfix12_En10
              validIn => Upsample1_out1,
              dataOut_re => FIR_Interpolator_out1_re,  -- sfix12_En10
              dataOut_im => FIR_Interpolator_out1_im,  -- sfix12_En10
              validOut => FIR_Interpolator_out2
              );

  u_falling_edge_detector : full_ofdm_modulator_ip_src_falling_edge_detector
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              in_rsvd => Logical_Operator1_out1,
              out_rsvd => falling_edge_detector_out1
              );

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  Upsample_cnt_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Upsample_muxsel <= '1';
      ELSIF enb = '1' THEN
        Upsample_muxsel <=  NOT Upsample_muxsel;
      END IF;
    END IF;
  END PROCESS Upsample_cnt_process;


  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg_re <= (OTHERS => to_signed(16#000#, 12));
        Delay5_reg_im <= (OTHERS => to_signed(16#000#, 12));
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_reg_im(0) <= data_in_im_signed;
        Delay5_reg_im(1) <= Delay5_reg_im(0);
        Delay5_reg_re(0) <= data_in_re_signed;
        Delay5_reg_re(1) <= Delay5_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1_re <= Delay5_reg_re(1);
  Delay5_out1_im <= Delay5_reg_im(1);

  Upsample_zero_re <= to_signed(16#000#, 12);
  Upsample_zero_im <= to_signed(16#000#, 12);

  -- Upsample: Upsample by 2, Sample offset 0 
  
  Upsample_out1_re <= Delay5_out1_re WHEN Upsample_muxsel = '1' ELSE
      Upsample_zero_re;
  
  Upsample_out1_im <= Delay5_out1_im WHEN Upsample_muxsel = '1' ELSE
      Upsample_zero_im;

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  Upsample1_cnt_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Upsample1_muxsel <= '1';
      ELSIF enb = '1' THEN
        Upsample1_muxsel <=  NOT Upsample1_muxsel;
      END IF;
    END IF;
  END PROCESS Upsample1_cnt_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_reg(0) <= valid_in;
        Delay3_reg(8 DOWNTO 1) <= Delay3_reg(7 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(8);

  Logical_Operator_out1 <= valid_in OR Delay3_out1;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg(0) <= Logical_Operator_out1;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  Upsample1_zero <= '0';

  -- Upsample1: Upsample by 2, Sample offset 0 
  
  Upsample1_out1 <= Delay2_out1 WHEN Upsample1_muxsel = '1' ELSE
      Upsample1_zero;

  FIR_Interpolator_out1_re_signed <= signed(FIR_Interpolator_out1_re);

  FIR_Interpolator_out1_im_signed <= signed(FIR_Interpolator_out1_im);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1_re <= to_signed(16#000#, 12);
        Delay4_out1_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        Delay4_out1_re <= FIR_Interpolator_out1_re_signed;
        Delay4_out1_im <= FIR_Interpolator_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  data_out_re <= std_logic_vector(Delay4_out1_re);

  data_out_im <= std_logic_vector(Delay4_out1_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay1_reg(0) <= FIR_Interpolator_out2;
        Delay1_reg(16 DOWNTO 1) <= Delay1_reg(15 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(16);

  Logical_Operator1_out1 <= FIR_Interpolator_out2 AND Delay1_out1;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay_out1 <= Logical_Operator1_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator3_out1 <=  NOT falling_edge_detector_out1;

  Logical_Operator2_out1 <= Delay_out1 AND Logical_Operator3_out1;

  valid_out <= Logical_Operator2_out1;

END rtl;

