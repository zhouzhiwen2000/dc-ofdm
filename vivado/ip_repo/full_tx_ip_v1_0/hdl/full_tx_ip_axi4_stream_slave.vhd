-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_axi4_stream_slave.vhd
-- Created: 2024-06-30 19:39:47
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_axi4_stream_slave
-- Source Path: full_tx_ip/full_tx_ip_axi4_stream_slave
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_axi4_stream_slave IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        AXI4_Stream_Slave_TDATA           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI4_Stream_Slave_TVALID          :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TLAST           :   IN    std_logic;  -- ufix1
        user_ready                        :   IN    std_logic;  -- ufix1
        AXI4_Stream_Slave_TREADY          :   OUT   std_logic;  -- ufix1
        user_data                         :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        user_valid                        :   OUT   std_logic;  -- ufix1
        user_TLAST                        :   OUT   std_logic  -- ufix1
        );
END full_tx_ip_axi4_stream_slave;


ARCHITECTURE rtl OF full_tx_ip_axi4_stream_slave IS

  -- Component Declarations
  COMPONENT full_tx_ip_fifo_data
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          Empty                           :   OUT   std_logic;  -- ufix1
          Full                            :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT full_tx_ip_fifo_TLAST
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;  -- ufix1
          Push                            :   IN    std_logic;  -- ufix1
          Pop                             :   IN    std_logic;  -- ufix1
          Out_rsvd                        :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_tx_ip_fifo_data
    USE ENTITY work.full_tx_ip_fifo_data(rtl);

  FOR ALL : full_tx_ip_fifo_TLAST
    USE ENTITY work.full_tx_ip_fifo_TLAST(rtl);

  -- Signals
  SIGNAL count_check_slave                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL count_match_slave                : std_logic;  -- ufix1
  SIGNAL fifo_rd_ack                      : std_logic;  -- ufix1
  SIGNAL stream_in_fifo_user_data         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_empty                       : std_logic;  -- ufix1
  SIGNAL fifo_full                        : std_logic;  -- ufix1
  SIGNAL stream_in_fifo_user_data_unsigned : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL stream_in_fifo_en_user_data      : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL fifo_empty_neg                   : std_logic;  -- ufix1
  SIGNAL fifo_multirate_empty_neg         : std_logic;  -- ufix1
  SIGNAL fifo_rd_ack_multirate            : std_logic;  -- ufix1
  SIGNAL stream_in_user_valid             : std_logic;  -- ufix1

BEGIN
  u_full_tx_ip_fifo_data_inst : full_tx_ip_fifo_data
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => AXI4_Stream_Slave_TDATA,  -- ufix8
              Push => AXI4_Stream_Slave_TVALID,  -- ufix1
              Pop => fifo_rd_ack,  -- ufix1
              Out_rsvd => stream_in_fifo_user_data,  -- ufix8
              Empty => fifo_empty,  -- ufix1
              Full => fifo_full  -- ufix1
              );

  u_full_tx_ip_fifo_TLAST_inst : full_tx_ip_fifo_TLAST
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => AXI4_Stream_Slave_TLAST,  -- ufix1
              Push => AXI4_Stream_Slave_TVALID,  -- ufix1
              Pop => fifo_rd_ack,  -- ufix1
              Out_rsvd => user_TLAST  -- ufix1
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 7
  multirate_counter_slave_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_check_slave <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        IF count_check_slave >= to_unsigned(16#07#, 8) THEN 
          count_check_slave <= to_unsigned(16#00#, 8);
        ELSE 
          count_check_slave <= count_check_slave + to_unsigned(16#01#, 8);
        END IF;
      END IF;
    END IF;
  END PROCESS multirate_counter_slave_process;


  
  count_match_slave <= '1' WHEN count_check_slave = to_unsigned(16#07#, 8) ELSE
      '0';

  fifo_rd_ack <= count_match_slave AND user_ready;

  AXI4_Stream_Slave_TREADY <=  NOT fifo_full;

  stream_in_fifo_user_data_unsigned <= unsigned(stream_in_fifo_user_data);

  multirate_user_data_slave_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stream_in_fifo_en_user_data <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' AND fifo_rd_ack = '1' THEN
        stream_in_fifo_en_user_data <= stream_in_fifo_user_data_unsigned;
      END IF;
    END IF;
  END PROCESS multirate_user_data_slave_process;


  user_data <= std_logic_vector(stream_in_fifo_en_user_data);

  fifo_empty_neg <=  NOT fifo_empty;

  multirate_user_data_valid_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fifo_multirate_empty_neg <= '0';
      ELSIF enb = '1' AND fifo_rd_ack = '1' THEN
        fifo_multirate_empty_neg <= fifo_empty_neg;
      END IF;
    END IF;
  END PROCESS multirate_user_data_valid_process;


  multirate_fifo_rd_ack_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fifo_rd_ack_multirate <= '0';
      ELSIF enb = '1' AND count_match_slave = '1' THEN
        fifo_rd_ack_multirate <= fifo_rd_ack;
      END IF;
    END IF;
  END PROCESS multirate_fifo_rd_ack_process;


  stream_in_user_valid <= fifo_multirate_empty_neg AND fifo_rd_ack_multirate;

  user_valid <= stream_in_user_valid;

END rtl;
