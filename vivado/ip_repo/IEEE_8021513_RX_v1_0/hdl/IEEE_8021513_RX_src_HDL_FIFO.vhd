-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_HDL_FIFO.vhd
-- Created: 2024-10-27 23:05:38
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_HDL_FIFO
-- Source Path: HDLRx/full_rx/prepare_payload_data/HDL_FIFO
-- Hierarchy Level: 2
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_HDL_FIFO IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In_rsvd                           :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        Push                              :   IN    std_logic;
        Pop                               :   IN    std_logic;
        rst                               :   IN    std_logic;  -- ufix1
        Out_rsvd                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        Empty                             :   OUT   std_logic  -- ufix1
        );
END IEEE_8021513_RX_src_HDL_FIFO;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_HDL_FIFO IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
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
  FOR ALL : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    USE ENTITY work.IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1(rtl);

  -- Signals
  SIGNAL fifo_front_indx                  : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_front_dir                   : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_back_indx                   : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_back_dir                    : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_sample_count                : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL fifo_front_indx_next             : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_front_dir_next              : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_back_indx_next              : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_back_dir_next               : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_sample_count_next           : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL fifo_out3                        : std_logic;
  SIGNAL fifo_out4                        : std_logic;
  SIGNAL fifo_write_enable                : std_logic;
  SIGNAL fifo_read_enable                 : std_logic;
  SIGNAL fifo_front_indx_temp             : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL fifo_back_indx_temp              : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL w_waddr                          : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL w_we                             : std_logic;  -- ufix1
  SIGNAL w_raddr                          : unsigned(14 DOWNTO 0);  -- ufix15
  SIGNAL w_full                           : std_logic;  -- ufix1
  SIGNAL Num                              : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL w_cz                             : std_logic;
  SIGNAL w_const                          : std_logic;  -- ufix1
  SIGNAL rst_neg                          : std_logic;  -- ufix1
  SIGNAL rst_neg_1                        : std_logic;  -- ufix1
  SIGNAL w_mux1                           : std_logic;  -- ufix1
  SIGNAL w_d1                             : std_logic;  -- ufix1
  SIGNAL w_waddr_1                        : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL w_waddr_signed                   : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL w_const_0                        : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL w_out_1                          : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL w_out                            : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL w_d2                             : signed(3 DOWNTO 0);  -- sfix4_En1

BEGIN
  -- us1: Upsample by 1, Sample offset 0 
  u_HDL_FIFO_ram : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 15,
                 DataWidth => 4
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
        fifo_front_indx <= to_unsigned(16#0000#, 15);
        fifo_front_dir <= to_unsigned(16#0001#, 15);
        fifo_back_indx <= to_unsigned(16#0000#, 15);
        fifo_back_dir <= to_unsigned(16#0001#, 15);
        fifo_sample_count <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        fifo_front_indx <= fifo_front_indx_next;
        fifo_front_dir <= fifo_front_dir_next;
        fifo_back_indx <= fifo_back_indx_next;
        fifo_back_dir <= fifo_back_dir_next;
        fifo_sample_count <= fifo_sample_count_next;
      END IF;
    END IF;
  END PROCESS fifo_process;

  
  fifo_out4 <= '1' WHEN fifo_sample_count = to_unsigned(16#8000#, 16) ELSE
      '0';
  
  fifo_out3 <= '1' WHEN fifo_sample_count = to_unsigned(16#0000#, 16) ELSE
      '0';
  fifo_write_enable <= Push AND (Pop OR ( NOT fifo_out4));
  fifo_read_enable <= Pop AND ( NOT fifo_out3);
  
  fifo_front_indx_temp <= to_unsigned(16#0000#, 15) WHEN rst /= '0' ELSE
      fifo_front_indx + fifo_front_dir WHEN fifo_read_enable = '1' ELSE
      fifo_front_indx;
  
  fifo_front_dir_next <= to_unsigned(16#0001#, 15) WHEN fifo_front_indx_temp = to_unsigned(16#7FFF#, 15) ELSE
      to_unsigned(16#0001#, 15);
  
  fifo_back_indx_temp <= to_unsigned(16#0000#, 15) WHEN rst /= '0' ELSE
      fifo_back_indx + fifo_back_dir WHEN fifo_write_enable = '1' ELSE
      fifo_back_indx;
  
  fifo_back_dir_next <= to_unsigned(16#0001#, 15) WHEN fifo_back_indx_temp = to_unsigned(16#7FFF#, 15) ELSE
      to_unsigned(16#0001#, 15);
  
  fifo_sample_count_next <= to_unsigned(16#0000#, 16) WHEN rst /= '0' ELSE
      fifo_sample_count + to_unsigned(16#0001#, 16) WHEN (fifo_write_enable AND ( NOT fifo_read_enable)) = '1' ELSE
      fifo_sample_count + to_unsigned(16#FFFF#, 16) WHEN (( NOT fifo_write_enable) AND fifo_read_enable) = '1' ELSE
      fifo_sample_count;
  w_waddr <= fifo_back_indx;
  w_we <= fifo_write_enable;
  w_raddr <= fifo_front_indx;
  Empty <= fifo_out3;
  w_full <= fifo_out4;
  Num <= fifo_sample_count;
  fifo_front_indx_next <= fifo_front_indx_temp;
  fifo_back_indx_next <= fifo_back_indx_temp;

  
  w_cz <= '1' WHEN Num > to_unsigned(16#0000#, 16) ELSE
      '0';

  w_const <= '0';

  rst_neg <=  NOT rst;

  rst_neg_1 <= rst_neg AND Pop;

  
  w_mux1 <= w_const WHEN w_cz = '0' ELSE
      rst_neg_1;

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

  w_const_0 <= to_signed(16#0#, 4);

  
  w_out_1 <= w_waddr_signed WHEN rst = '0' ELSE
      w_const_0;

  f_d2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        w_d2 <= to_signed(16#0#, 4);
      ELSIF enb = '1' AND w_d1 = '1' THEN
        w_d2 <= w_out;
      END IF;
    END IF;
  END PROCESS f_d2_process;


  
  w_out <= w_d2 WHEN w_d1 = '0' ELSE
      w_out_1;

  Out_rsvd <= std_logic_vector(w_out);

END rtl;
