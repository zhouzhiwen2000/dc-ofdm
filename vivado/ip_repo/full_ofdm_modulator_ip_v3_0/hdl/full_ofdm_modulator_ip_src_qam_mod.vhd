-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_qam_mod.vhd
-- Created: 2024-09-01 12:13:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_qam_mod
-- Source Path: HDLModulatorFull/full_ofdm_modulator/enabled_qam_and_scrambler/qam_mod
-- Hierarchy Level: 2
-- Model version: 1.43
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_ofdm_modulator_ip_src_full_ofdm_modulator_pac.ALL;

ENTITY full_ofdm_modulator_ip_src_qam_mod IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        valid_in                          :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        ready_out                         :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic
        );
END full_ofdm_modulator_ip_src_qam_mod;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_qam_mod IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_src_BPSK_Modulator_Baseband
    PORT( in0                             :   IN    std_logic;  -- ufix1
          out0_re                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          out0_im                         :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_src_BPSK_Modulator_Baseband
    USE ENTITY work.full_ofdm_modulator_ip_src_BPSK_Modulator_Baseband(rtl);

  -- Constants
  CONSTANT alpha_table_data_re            : vector_of_signed12(0 TO 3) := 
    (to_signed(16#2D4#, 12), to_signed(16#2D4#, 12), to_signed(-16#2D4#, 12), to_signed(-16#2D4#, 12));  -- sfix12 [4]
  CONSTANT alpha_table_data_im            : vector_of_signed12(0 TO 3) := 
    (to_signed(-16#2D4#, 12), to_signed(16#2D4#, 12), to_signed(-16#2D4#, 12), to_signed(16#2D4#, 12));  -- sfix12 [4]
  CONSTANT alpha_table_data_re_2          : vector_of_signed12(0 TO 15) := 
    (to_signed(-16#3CB#, 12), to_signed(-16#3CB#, 12), to_signed(-16#3CB#, 12), to_signed(-16#3CB#, 12),
     to_signed(-16#144#, 12), to_signed(-16#144#, 12), to_signed(-16#144#, 12), to_signed(-16#144#, 12),
     to_signed(16#3CB#, 12), to_signed(16#3CB#, 12), to_signed(16#3CB#, 12), to_signed(16#3CB#, 12),
     to_signed(16#144#, 12), to_signed(16#144#, 12), to_signed(16#144#, 12), to_signed(16#144#, 12));  -- sfix12 [16]
  CONSTANT alpha_table_data_im_2          : vector_of_signed12(0 TO 15) := 
    (to_signed(-16#3CB#, 12), to_signed(-16#144#, 12), to_signed(16#3CB#, 12), to_signed(16#144#, 12),
     to_signed(-16#3CB#, 12), to_signed(-16#144#, 12), to_signed(16#3CB#, 12), to_signed(16#144#, 12),
     to_signed(-16#3CB#, 12), to_signed(-16#144#, 12), to_signed(16#3CB#, 12), to_signed(16#144#, 12),
     to_signed(-16#3CB#, 12), to_signed(-16#144#, 12), to_signed(16#3CB#, 12), to_signed(16#144#, 12));  -- sfix12 [16]

  -- Signals
  SIGNAL bits_per_subcarrier_unsigned     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL bits_per_subcarrier_1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Constant3_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant5_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL data_in_unsigned                 : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL BPSK_Modulator_Baseband_out1_re  : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL BPSK_Modulator_Baseband_out1_im  : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL BPSK_Modulator_Baseband_out1_re_signed : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL BPSK_Modulator_Baseband_out1_im_signed : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Bit_Slice1_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL batID_1_out1_re                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL batID_1_out1_im                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant2_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant4_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Bit_Slice2_out1                  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL batID_8_out1_re                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL batID_8_out1_im                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant6_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant7_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant9_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant10_out1                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant1_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Constant8_out1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Multiport_Switch_out1_re         : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Multiport_Switch_out1_im         : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL ready_out_1                      : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL Delay_out1_re                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay_out1_im                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL valid_in_1                       : std_logic;
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  u_BPSK_Modulator_Baseband : full_ofdm_modulator_ip_src_BPSK_Modulator_Baseband
    PORT MAP( in0 => Bit_Slice_out1,  -- ufix1
              out0_re => BPSK_Modulator_Baseband_out1_re,  -- sfix12_En10
              out0_im => BPSK_Modulator_Baseband_out1_im  -- sfix12_En10
              );

  bits_per_subcarrier_unsigned <= unsigned(bits_per_subcarrier);

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        bits_per_subcarrier_1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        bits_per_subcarrier_1 <= bits_per_subcarrier_unsigned;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  Constant3_out1 <= to_signed(16#000#, 12);

  Constant5_out1 <= to_signed(16#000#, 12);

  data_in_unsigned <= unsigned(data_in);

  Bit_Slice_out1 <= data_in_unsigned(0);

  BPSK_Modulator_Baseband_out1_re_signed <= signed(BPSK_Modulator_Baseband_out1_re);

  BPSK_Modulator_Baseband_out1_im_signed <= signed(BPSK_Modulator_Baseband_out1_im);

  Bit_Slice1_out1 <= data_in_unsigned(1 DOWNTO 0);

  batID_1_out1_re <= alpha_table_data_re(to_integer(Bit_Slice1_out1));
  batID_1_out1_im <= alpha_table_data_im(to_integer(Bit_Slice1_out1));

  Constant2_out1 <= to_signed(16#000#, 12);

  Constant4_out1 <= to_signed(16#000#, 12);

  Bit_Slice2_out1 <= data_in_unsigned(3 DOWNTO 0);

  batID_8_out1_re <= alpha_table_data_re_2(to_integer(Bit_Slice2_out1));
  batID_8_out1_im <= alpha_table_data_im_2(to_integer(Bit_Slice2_out1));

  Constant6_out1 <= to_signed(16#000#, 12);

  Constant7_out1 <= to_signed(16#000#, 12);

  Constant9_out1 <= to_signed(16#000#, 12);

  Constant10_out1 <= to_signed(16#000#, 12);

  Constant1_out1 <= to_signed(16#000#, 12);

  Constant8_out1 <= to_signed(16#000#, 12);

  
  Multiport_Switch_out1_re <= Constant3_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#0#, 4) ELSE
      BPSK_Modulator_Baseband_out1_re_signed WHEN bits_per_subcarrier_1 = to_unsigned(16#1#, 4) ELSE
      batID_1_out1_re WHEN bits_per_subcarrier_1 = to_unsigned(16#2#, 4) ELSE
      Constant2_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#3#, 4) ELSE
      batID_8_out1_re WHEN bits_per_subcarrier_1 = to_unsigned(16#4#, 4) ELSE
      Constant6_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#5#, 4) ELSE
      Constant9_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#6#, 4) ELSE
      Constant1_out1;
  
  Multiport_Switch_out1_im <= Constant5_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#0#, 4) ELSE
      BPSK_Modulator_Baseband_out1_im_signed WHEN bits_per_subcarrier_1 = to_unsigned(16#1#, 4) ELSE
      batID_1_out1_im WHEN bits_per_subcarrier_1 = to_unsigned(16#2#, 4) ELSE
      Constant4_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#3#, 4) ELSE
      batID_8_out1_im WHEN bits_per_subcarrier_1 = to_unsigned(16#4#, 4) ELSE
      Constant7_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#5#, 4) ELSE
      Constant10_out1 WHEN bits_per_subcarrier_1 = to_unsigned(16#6#, 4) ELSE
      Constant8_out1;

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ready_out_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        ready_out_1 <= ready_out;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  enb_1_2_0_gated <= ready_out_1 AND enb_1_2_0;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_re <= to_signed(16#000#, 12);
        Delay_out1_im <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay_out1_re <= Multiport_Switch_out1_re;
        Delay_out1_im <= Multiport_Switch_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  data_out_re <= std_logic_vector(Delay_out1_re);

  data_out_im <= std_logic_vector(Delay_out1_im);

  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_in_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        valid_in_1 <= valid_in;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  enb_1_2_0_gated_1 <= ready_out_1 AND enb_1_2_0;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay1_out1 <= valid_in_1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  valid_out <= Delay1_out1;

END rtl;
