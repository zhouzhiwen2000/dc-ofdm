-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_channel_estimation_and_equalization.vhd
-- Created: 2024-08-10 11:14:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_channel_estimation_and_equalization
-- Source Path: HDLRx/full_rx/rx_demodulator_full/channel_estimation_and_equalization
-- Hierarchy Level: 2
-- Model version: 1.14
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_rx_ip_src_full_rx_pac.ALL;

ENTITY full_rx_ip_src_channel_estimation_and_equalization IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        data_in_im                        :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        valid_data                        :   IN    std_logic;
        valid_channel                     :   IN    std_logic;
        dont_use_equalizer                :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        data_out_im                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
        valid_out                         :   OUT   std_logic
        );
END full_rx_ip_src_channel_estimation_and_equalization;


ARCHITECTURE rtl OF full_rx_ip_src_channel_estimation_and_equalization IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_Channel_Estimation
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          data_in_im                      :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          valid_in                        :   IN    std_logic;
          channel_estimate_re             :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          channel_estimate_im             :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          valid_estimate                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Channel_Equalization
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          data_in_im                      :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          valid_data                      :   IN    std_logic;
          channel_estimate_in_re          :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          channel_estimate_in_im          :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          valid_channel_estimate          :   IN    std_logic;
          dont_use_equalizer              :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          data_out_im                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En12
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_Channel_Estimation
    USE ENTITY work.full_rx_ip_src_Channel_Estimation(rtl);

  FOR ALL : full_rx_ip_src_Channel_Equalization
    USE ENTITY work.full_rx_ip_src_Channel_Equalization(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL data_in_im_signed                : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay1_out1_re                   : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay1_out1_im                   : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay21_reg_re                   : vector_of_signed24(0 TO 1);  -- sfix24_En12 [2]
  SIGNAL Delay21_reg_im                   : vector_of_signed24(0 TO 1);  -- sfix24_En12 [2]
  SIGNAL Delay21_out1_re                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay21_out1_im                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay10_out1_re                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay10_out1_im                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay22_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay22_out1                     : std_logic;
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL channelEstimates_re              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL channelEstimates_im              : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL channelEstimatesValid            : std_logic;
  SIGNAL channelEstimates_re_signed       : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL channelEstimates_im_signed       : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay13_out1_re                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay13_out1_im                  : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay14_out1                     : std_logic;
  SIGNAL Channel_Equalization_out1_re     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL Channel_Equalization_out1_im     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL Channel_Equalization_out2        : std_logic;
  SIGNAL Channel_Equalization_out1_re_signed : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Channel_Equalization_out1_im_signed : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay5_out1_re                   : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay5_out1_im                   : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL Delay6_out1                      : std_logic;

BEGIN
  -- Estimates the channel frequency response for each frame.
  -- Stores the estimate from Channel Estimation subsystem for each frame and perform channel equalization.

  u_Channel_Estimation : full_rx_ip_src_Channel_Estimation
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in_re => std_logic_vector(Delay1_out1_re),  -- sfix24_En12
              data_in_im => std_logic_vector(Delay1_out1_im),  -- sfix24_En12
              valid_in => Delay2_out1,
              channel_estimate_re => channelEstimates_re,  -- sfix24_En12
              channel_estimate_im => channelEstimates_im,  -- sfix24_En12
              valid_estimate => channelEstimatesValid
              );

  u_Channel_Equalization : full_rx_ip_src_Channel_Equalization
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in_re => std_logic_vector(Delay10_out1_re),  -- sfix24_En12
              data_in_im => std_logic_vector(Delay10_out1_im),  -- sfix24_En12
              valid_data => Delay11_out1,
              channel_estimate_in_re => std_logic_vector(Delay13_out1_re),  -- sfix24_En12
              channel_estimate_in_im => std_logic_vector(Delay13_out1_im),  -- sfix24_En12
              valid_channel_estimate => Delay14_out1,
              dont_use_equalizer => dont_use_equalizer,
              data_out_re => Channel_Equalization_out1_re,  -- sfix24_En12
              data_out_im => Channel_Equalization_out1_im,  -- sfix24_En12
              valid_out => Channel_Equalization_out2
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  Delay1_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay1_out1_re <= to_signed(16#000000#, 24);
      Delay1_out1_im <= to_signed(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay1_out1_re <= data_in_re_signed;
        Delay1_out1_im <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Delay21_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay21_reg_re <= (OTHERS => to_signed(16#000000#, 24));
      Delay21_reg_im <= (OTHERS => to_signed(16#000000#, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay21_reg_im(0) <= Delay1_out1_im;
        Delay21_reg_im(1) <= Delay21_reg_im(0);
        Delay21_reg_re(0) <= Delay1_out1_re;
        Delay21_reg_re(1) <= Delay21_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay21_process;

  Delay21_out1_re <= Delay21_reg_re(1);
  Delay21_out1_im <= Delay21_reg_im(1);

  Delay10_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay10_out1_re <= to_signed(16#000000#, 24);
      Delay10_out1_im <= to_signed(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay10_out1_re <= Delay21_out1_re;
        Delay10_out1_im <= Delay21_out1_im;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  Delay3_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay3_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay3_out1 <= valid_data;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay22_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay22_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay22_reg(0) <= Delay3_out1;
        Delay22_reg(1) <= Delay22_reg(0);
      END IF;
    END IF;
  END PROCESS Delay22_process;

  Delay22_out1 <= Delay22_reg(1);

  Delay11_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay11_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay11_out1 <= Delay22_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  Delay2_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay2_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay2_out1 <= valid_channel;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  channelEstimates_re_signed <= signed(channelEstimates_re);

  channelEstimates_im_signed <= signed(channelEstimates_im);

  Delay13_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay13_out1_re <= to_signed(16#000000#, 24);
      Delay13_out1_im <= to_signed(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay13_out1_re <= channelEstimates_re_signed;
        Delay13_out1_im <= channelEstimates_im_signed;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  Delay14_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay14_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay14_out1 <= channelEstimatesValid;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  Channel_Equalization_out1_re_signed <= signed(Channel_Equalization_out1_re);

  Channel_Equalization_out1_im_signed <= signed(Channel_Equalization_out1_im);

  Delay5_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay5_out1_re <= to_signed(16#000000#, 24);
      Delay5_out1_im <= to_signed(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay5_out1_re <= Channel_Equalization_out1_re_signed;
        Delay5_out1_im <= Channel_Equalization_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  data_out_re <= std_logic_vector(Delay5_out1_re);

  data_out_im <= std_logic_vector(Delay5_out1_im);

  Delay6_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      Delay6_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        Delay6_out1 <= Channel_Equalization_out2;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  valid_out <= Delay6_out1;

END rtl;
