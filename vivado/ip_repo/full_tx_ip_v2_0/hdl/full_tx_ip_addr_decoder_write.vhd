-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_addr_decoder_write.vhd
-- Created: 2024-08-11 18:38:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_addr_decoder_write
-- Source Path: full_tx_ip/full_tx_ip_axi_lite/full_tx_ip_addr_decoder/full_tx_ip_addr_decoder_write
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_addr_decoder_write IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_GLOBAL_RESET               :   IN    std_logic;  -- ufix1
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_reg0                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reg1                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reg2                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_reg3                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_new_frame_in                :   OUT   std_logic  -- ufix1
        );
END full_tx_ip_addr_decoder_write;


ARCHITECTURE rtl OF full_tx_ip_addr_decoder_write IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_axi_enable_1_1        : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable_1_1           : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL data_reg_axi_enable_1_1          : std_logic;  -- ufix1
  SIGNAL decode_sel_reg0_1_1              : std_logic;  -- ufix1
  SIGNAL reg_enb_reg0_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_reg0_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_reg1_1_1              : std_logic;  -- ufix1
  SIGNAL reg_enb_reg1_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_reg1_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_reg2_1_1              : std_logic;  -- ufix1
  SIGNAL reg_enb_reg2_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_reg2_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_reg3_1_1              : std_logic;  -- ufix1
  SIGNAL reg_enb_reg3_1_1                 : std_logic;  -- ufix1
  SIGNAL data_reg_reg3_1_1                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_sel_new_frame_in_1_1      : std_logic;  -- ufix1
  SIGNAL reg_enb_new_frame_in_1_1         : std_logic;  -- ufix1
  SIGNAL data_in_new_frame_in             : std_logic;  -- ufix1
  SIGNAL data_reg_new_frame_in_1_1        : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_axi_enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0001#, 14) ELSE
      '0';

  reg_enb_axi_enable_1_1 <= decode_sel_axi_enable_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  const_1 <= '1';

  enb <= const_1;

  reg_axi_enable_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_axi_enable_1_1 <= '1';
      ELSIF enb = '1' AND reg_enb_axi_enable_1_1 = '1' THEN
        data_reg_axi_enable_1_1 <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_1_1_process;


  
  decode_sel_reg0_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  reg_enb_reg0_1_1 <= decode_sel_reg0_1_1 AND wr_enb;

  reg_reg0_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_reg0_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_reg0_1_1 = '1' THEN
        data_reg_reg0_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_reg0_1_1_process;


  write_reg0 <= std_logic_vector(data_reg_reg0_1_1);

  
  decode_sel_reg1_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  reg_enb_reg1_1_1 <= decode_sel_reg1_1_1 AND wr_enb;

  reg_reg1_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_reg1_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_reg1_1_1 = '1' THEN
        data_reg_reg1_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_reg1_1_1_process;


  write_reg1 <= std_logic_vector(data_reg_reg1_1_1);

  
  decode_sel_reg2_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0042#, 14) ELSE
      '0';

  reg_enb_reg2_1_1 <= decode_sel_reg2_1_1 AND wr_enb;

  reg_reg2_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_reg2_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_reg2_1_1 = '1' THEN
        data_reg_reg2_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_reg2_1_1_process;


  write_reg2 <= std_logic_vector(data_reg_reg2_1_1);

  
  decode_sel_reg3_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0043#, 14) ELSE
      '0';

  reg_enb_reg3_1_1 <= decode_sel_reg3_1_1 AND wr_enb;

  reg_reg3_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_reg3_1_1 <= to_unsigned(0, 32);
      ELSIF enb = '1' AND reg_enb_reg3_1_1 = '1' THEN
        data_reg_reg3_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_reg3_1_1_process;


  write_reg3 <= std_logic_vector(data_reg_reg3_1_1);

  
  decode_sel_new_frame_in_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0044#, 14) ELSE
      '0';

  reg_enb_new_frame_in_1_1 <= decode_sel_new_frame_in_1_1 AND wr_enb;

  data_in_new_frame_in <= data_write_unsigned(0);

  reg_new_frame_in_1_1_process : PROCESS (IPCORE_CLK)
  BEGIN
    IF IPCORE_CLK'EVENT AND IPCORE_CLK = '1' THEN
      IF IPCORE_GLOBAL_RESET = '1' THEN
        data_reg_new_frame_in_1_1 <= '0';
      ELSIF enb = '1' AND reg_enb_new_frame_in_1_1 = '1' THEN
        data_reg_new_frame_in_1_1 <= data_in_new_frame_in;
      END IF;
    END IF;
  END PROCESS reg_new_frame_in_1_1_process;


  write_axi_enable <= data_reg_axi_enable_1_1;

  write_new_frame_in <= data_reg_new_frame_in_1_1;

END rtl;
