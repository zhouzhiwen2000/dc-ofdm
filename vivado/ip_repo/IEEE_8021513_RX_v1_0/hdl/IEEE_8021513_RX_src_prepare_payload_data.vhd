-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_prepare_payload_data.vhd
-- Created: 2024-10-27 23:05:38
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_prepare_payload_data
-- Source Path: HDLRx/full_rx/prepare_payload_data
-- Hierarchy Level: 1
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_prepare_payload_data IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
        valid_payload                     :   IN    std_logic;
        payload_ready                     :   IN    std_logic;
        reset                             :   IN    std_logic;
        dataOut                           :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        valid_in                          :   OUT   std_logic;
        new_frame                         :   OUT   std_logic
        );
END IEEE_8021513_RX_src_prepare_payload_data;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_prepare_payload_data IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_payload_clock_x2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
          valid_in                        :   IN    std_logic;
          data_out                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_HDL_FIFO
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          rst                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_falling_edge_detector1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          in_rsvd                         :   IN    std_logic;
          out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_payload_clock_x2
    USE ENTITY work.IEEE_8021513_RX_src_payload_clock_x2(rtl);

  FOR ALL : IEEE_8021513_RX_src_HDL_FIFO
    USE ENTITY work.IEEE_8021513_RX_src_HDL_FIFO(rtl);

  FOR ALL : IEEE_8021513_RX_src_falling_edge_detector1
    USE ENTITY work.IEEE_8021513_RX_src_falling_edge_detector1(rtl);

  -- Signals
  SIGNAL dataIn                           : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL push                             : std_logic;
  SIGNAL fifo_empty                       : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL dataOut_tmp                      : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL falling_edge_detector1_out1      : std_logic;
  SIGNAL count_step                       : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL count_from                       : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL HDL_Counter1_out1                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL range_hit                        : std_logic;
  SIGNAL count                            : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL new_frame_1                      : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL OR1_out1                         : std_logic;
  SIGNAL count_1                          : unsigned(13 DOWNTO 0);  -- ufix14

BEGIN
  -- Maximum value is 3741
  -- Note_ this counter makes sure that the fifo always has data, and is not emptied in the middle of an LDPC block

  u_payload_clock_x2 : IEEE_8021513_RX_src_payload_clock_x2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => data_in,  -- sfix4_En1 [2]
              valid_in => valid_payload,
              data_out => dataIn,  -- sfix4_En1
              valid_out => push
              );

  u_HDL_FIFO : IEEE_8021513_RX_src_HDL_FIFO
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => dataIn,  -- sfix4_En1
              Push => push,
              Pop => Logical_Operator2_out1,
              rst => reset,
              Out_rsvd => dataOut_tmp,  -- sfix4_En1
              Empty => fifo_empty
              );

  u_falling_edge_detector1 : IEEE_8021513_RX_src_falling_edge_detector1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              in_rsvd => fifo_empty,
              out_rsvd => falling_edge_detector1_out1
              );

  Logical_Operator3_out1 <=  NOT fifo_empty;

  Logical_Operator2_out1 <= Logical_Operator3_out1 AND payload_ready;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_in <= '0';
      ELSIF enb = '1' THEN
        valid_in <= Logical_Operator2_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 600
  count_step <= to_unsigned(16#0001#, 14);

  count_from <= to_unsigned(16#0000#, 14);

  
  range_hit <= '1' WHEN HDL_Counter1_out1 > to_unsigned(16#3FFE#, 14) ELSE
      '0';

  count <= HDL_Counter1_out1 + count_step;

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  Unit_Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay1_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_out1 <= new_frame_1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  OR1_out1 <= falling_edge_detector1_out1 OR Delay2_out1;

  
  Switch1_out1 <= Unit_Delay1_out1 WHEN OR1_out1 = '0' ELSE
      falling_edge_detector1_out1;

  
  count_1 <= HDL_Counter1_out1 WHEN Switch1_out1 = '0' ELSE
      count_value;

  HDL_Counter1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter1_out1 <= to_unsigned(16#0000#, 14);
      ELSIF enb = '1' THEN
        HDL_Counter1_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  
  need_to_wrap <= '1' WHEN HDL_Counter1_out1 = to_unsigned(16#0258#, 14) ELSE
      '0';

  new_frame_1 <= need_to_wrap OR range_hit;

  dataOut <= dataOut_tmp;

  new_frame <= new_frame_1;

END rtl;
