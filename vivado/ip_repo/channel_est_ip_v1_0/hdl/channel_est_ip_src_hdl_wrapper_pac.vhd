-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLChannelEstimator/channel_est_ip_src_hdl_wrapper_pac.vhd
-- Created: 2024-10-02 11:31:35
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE channel_est_ip_src_hdl_wrapper_pac IS
  TYPE vector_of_signed12 IS ARRAY (NATURAL RANGE <>) OF signed(11 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
  TYPE vector_of_signed63 IS ARRAY (NATURAL RANGE <>) OF signed(62 DOWNTO 0);
  TYPE vector_of_signed87 IS ARRAY (NATURAL RANGE <>) OF signed(86 DOWNTO 0);
END channel_est_ip_src_hdl_wrapper_pac;
