-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_y_u_1.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_y_u_1
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized1/y = u(1
-- Hierarchy Level: 5
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_y_u_1 IS
  PORT( u                                 :   IN    std_logic;
        y                                 :   OUT   std_logic
        );
END rx_demod_optimized_src_y_u_1;


ARCHITECTURE rtl OF rx_demod_optimized_src_y_u_1 IS

BEGIN
  y <= u;

END rtl;
