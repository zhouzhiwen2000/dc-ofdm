-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Compare_To_Zero_block.vhd
-- Created: 2024-10-02 12:29:27
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Compare_To_Zero_block
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Divide by zero handler/Compare To Zer
-- Hierarchy Level: 7
-- Model version: 1.100
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Compare_To_Zero_block IS
  PORT( u                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        y                                 :   OUT   std_logic
        );
END full_rx_ip_src_Compare_To_Zero_block;


ARCHITECTURE rtl OF full_rx_ip_src_Compare_To_Zero_block IS

  -- Signals
  SIGNAL u_signed                         : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Constant_out1                    : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Compare_out1                     : std_logic;

BEGIN
  u_signed <= signed(u);

  Constant_out1 <= to_signed(0, 32);

  
  Compare_out1 <= '1' WHEN u_signed >= Constant_out1 ELSE
      '0';

  y <= Compare_out1;

END rtl;
