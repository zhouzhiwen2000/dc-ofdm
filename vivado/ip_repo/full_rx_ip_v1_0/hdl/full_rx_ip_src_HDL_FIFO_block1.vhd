-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_HDL_FIFO_block1.vhd
-- Created: 2024-10-02 12:29:28
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_HDL_FIFO_block1
-- Source Path: HDLRx/full_rx/prepare_payload_data/HDL_FIFO
-- Hierarchy Level: 2
-- Model version: 1.100
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_HDL_FIFO_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In_rsvd                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        Push                              :   IN    std_logic;
        Pop                               :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En12
        Empty                             :   OUT   std_logic  -- ufix1
        );
END full_rx_ip_src_HDL_FIFO_block1;


ARCHITECTURE rtl OF full_rx_ip_src_HDL_FIFO_block1 IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_SimpleDualPortRAM_generic_block4
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_SimpleDualPortRAM_generic_block4
    USE ENTITY work.full_rx_ip_src_SimpleDualPortRAM_generic_block4(rtl);

  -- Signals
  SIGNAL fifo_front_indx                  : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_front_dir                   : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_back_indx                   : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_back_dir                    : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_sample_count                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_front_indx_next             : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_front_dir_next              : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_back_indx_next              : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_back_dir_next               : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_sample_count_next           : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_out3                        : std_logic;
  SIGNAL fifo_out4                        : std_logic;
  SIGNAL fifo_write_enable                : std_logic;
  SIGNAL fifo_read_enable                 : std_logic;
  SIGNAL fifo_front_indx_temp             : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL fifo_back_indx_temp              : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL w_waddr                          : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL w_we                             : std_logic;  -- ufix1
  SIGNAL w_raddr                          : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL w_full                           : std_logic;  -- ufix1
  SIGNAL Num                              : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL w_cz                             : std_logic;
  SIGNAL w_const                          : std_logic;  -- ufix1
  SIGNAL w_mux1                           : std_logic;  -- ufix1
  SIGNAL w_d1                             : std_logic;  -- ufix1
  SIGNAL w_waddr_1                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL w_waddr_signed                   : signed(15 DOWNTO 0);  -- sfix16_En12
  SIGNAL w_d2                             : signed(15 DOWNTO 0);  -- sfix16_En12
  SIGNAL w_out                            : signed(15 DOWNTO 0);  -- sfix16_En12

BEGIN
  -- us1: Upsample by 1, Sample offset 0 
  u_HDL_FIFO_ram : full_rx_ip_src_SimpleDualPortRAM_generic_block4
    GENERIC MAP( AddrWidth => 14,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => In_rsvd,
              wr_addr => std_logic_vector(w_waddr),
              wr_en => w_we,  -- ufix1
              rd_addr => std_logic_vector(w_raddr),
              dout => w_waddr_1
              );

  -- FIFO logic controller
  -- us2: Upsample by 1, Sample offset 0 
  -- us3: Upsample by 1, Sample offset 0 
  fifo_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fifo_front_indx <= to_unsigned(16#0000#, 14);
        fifo_front_dir <= to_unsigned(16#0001#, 14);
        fifo_back_indx <= to_unsigned(16#0000#, 14);
        fifo_back_dir <= to_unsigned(16#0001#, 14);
        fifo_sample_count <= to_unsigned(16#0000#, 14);
      ELSIF enb = '1' THEN
        fifo_front_indx <= fifo_front_indx_next;
        fifo_front_dir <= fifo_front_dir_next;
        fifo_back_indx <= fifo_back_indx_next;
        fifo_back_dir <= fifo_back_dir_next;
        fifo_sample_count <= fifo_sample_count_next;
      END IF;
    END IF;
  END PROCESS fifo_process;

  
  fifo_out4 <= '1' WHEN fifo_sample_count = to_unsigned(16#3E80#, 14) ELSE
      '0';
  
  fifo_out3 <= '1' WHEN fifo_sample_count = to_unsigned(16#0000#, 14) ELSE
      '0';
  fifo_write_enable <= Push AND (Pop OR ( NOT fifo_out4));
  fifo_read_enable <= Pop AND ( NOT fifo_out3);
  
  fifo_front_indx_temp <= fifo_front_indx + fifo_front_dir WHEN fifo_read_enable = '1' ELSE
      fifo_front_indx;
  
  fifo_front_dir_next <= to_unsigned(16#0181#, 14) WHEN fifo_front_indx_temp = to_unsigned(16#3E7F#, 14) ELSE
      to_unsigned(16#0001#, 14);
  
  fifo_back_indx_temp <= fifo_back_indx + fifo_back_dir WHEN fifo_write_enable = '1' ELSE
      fifo_back_indx;
  
  fifo_back_dir_next <= to_unsigned(16#0181#, 14) WHEN fifo_back_indx_temp = to_unsigned(16#3E7F#, 14) ELSE
      to_unsigned(16#0001#, 14);
  
  fifo_sample_count_next <= fifo_sample_count + to_unsigned(16#0001#, 14) WHEN (fifo_write_enable AND ( NOT fifo_read_enable)) = '1' ELSE
      fifo_sample_count + to_unsigned(16#3FFF#, 14) WHEN (( NOT fifo_write_enable) AND fifo_read_enable) = '1' ELSE
      fifo_sample_count;
  w_waddr <= fifo_back_indx;
  w_we <= fifo_write_enable;
  w_raddr <= fifo_front_indx;
  Empty <= fifo_out3;
  w_full <= fifo_out4;
  Num <= fifo_sample_count;
  fifo_front_indx_next <= fifo_front_indx_temp;
  fifo_back_indx_next <= fifo_back_indx_temp;

  
  w_cz <= '1' WHEN Num > to_unsigned(16#0000#, 14) ELSE
      '0';

  w_const <= '0';

  
  w_mux1 <= w_const WHEN w_cz = '0' ELSE
      Pop;

  f_d1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        w_d1 <= '0';
      ELSIF enb = '1' THEN
        w_d1 <= w_mux1;
      END IF;
    END IF;
  END PROCESS f_d1_process;


  w_waddr_signed <= signed(w_waddr_1);

  f_d2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        w_d2 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' AND w_d1 = '1' THEN
        w_d2 <= w_waddr_signed;
      END IF;
    END IF;
  END PROCESS f_d2_process;


  
  w_out <= w_d2 WHEN w_d1 = '0' ELSE
      w_waddr_signed;

  Out_rsvd <= std_logic_vector(w_out);

END rtl;
