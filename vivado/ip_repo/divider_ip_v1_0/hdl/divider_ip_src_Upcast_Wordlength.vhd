-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_Upcast_Wordlength.vhd
-- Created: 2024-10-03 19:36:10
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_Upcast_Wordlength
-- Source Path: test/divider/Complex Divide HDL Optimized/ForEach - Complex Divide/Upcast Wordlength
-- Hierarchy Level: 3
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY divider_ip_src_Upcast_Wordlength IS
  PORT( x_re                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        x_im                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        y_re                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        y_im                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        u_re                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        u_im                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        v_re                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        v_im                              :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
        );
END divider_ip_src_Upcast_Wordlength;


ARCHITECTURE rtl OF divider_ip_src_Upcast_Wordlength IS

  -- Signals
  SIGNAL x_re_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL x_im_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL y_re_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL y_im_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL u_re_tmp                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL u_im_tmp                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL v_re_tmp                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL v_im_tmp                         : signed(15 DOWNTO 0);  -- sfix16_En10

BEGIN
  x_re_signed <= signed(x_re);

  x_im_signed <= signed(x_im);

  y_re_signed <= signed(y_re);

  y_im_signed <= signed(y_im);

  -- Copyright 2019 The MathWorks, Inc.
  u_re_tmp <= x_re_signed;
  u_im_tmp <= x_im_signed;
  v_re_tmp <= y_re_signed;
  v_im_tmp <= y_im_signed;

  u_re <= std_logic_vector(u_re_tmp);

  u_im <= std_logic_vector(u_im_tmp);

  v_re <= std_logic_vector(v_re_tmp);

  v_im <= std_logic_vector(v_im_tmp);

END rtl;

