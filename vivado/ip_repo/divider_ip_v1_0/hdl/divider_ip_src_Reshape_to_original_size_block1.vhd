-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_Reshape_to_original_size_block1.vhd
-- Created: 2024-10-03 19:36:11
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_Reshape_to_original_size_block1
-- Source Path: test/divider/in_8_out_16/Reshape to original size
-- Hierarchy Level: 2
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY divider_ip_src_Reshape_to_original_size_block1 IS
  PORT( y                                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En10
        u                                 :   IN    std_logic_vector(7 DOWNTO 0);  -- sfix8_En6
        z                                 :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En10
        );
END divider_ip_src_Reshape_to_original_size_block1;


ARCHITECTURE rtl OF divider_ip_src_Reshape_to_original_size_block1 IS

  -- Signals
  SIGNAL y_signed                         : signed(17 DOWNTO 0);  -- sfix18_En10
  SIGNAL u_signed                         : signed(7 DOWNTO 0);  -- sfix8_En6
  SIGNAL z_tmp                            : signed(17 DOWNTO 0);  -- sfix18_En10

BEGIN
  y_signed <= signed(y);

  u_signed <= signed(u);

  z_tmp <= y_signed;

  z <= std_logic_vector(z_tmp);

END rtl;
