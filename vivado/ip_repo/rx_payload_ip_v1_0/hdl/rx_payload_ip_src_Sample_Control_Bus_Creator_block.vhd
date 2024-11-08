-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxPayload/rx_payload_ip_src_Sample_Control_Bus_Creator_block.vhd
-- Created: 2024-10-03 13:09:50
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_payload_ip_src_Sample_Control_Bus_Creator_block
-- Source Path: HDLRxPayload/rx_payload_full/remove_tone_mapping/valid_to_ctrl/Sample Control Bus Creator
-- Hierarchy Level: 3
-- Model version: 1.67
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_payload_ip_src_Sample_Control_Bus_Creator_block IS
  PORT( In1                               :   IN    std_logic;
        In2                               :   IN    std_logic;
        In3                               :   IN    std_logic;
        Out1_start                        :   OUT   std_logic;
        Out1_end                          :   OUT   std_logic;
        Out1_valid                        :   OUT   std_logic
        );
END rx_payload_ip_src_Sample_Control_Bus_Creator_block;


ARCHITECTURE rtl OF rx_payload_ip_src_Sample_Control_Bus_Creator_block IS

BEGIN
  Out1_start <= In1;

  Out1_end <= In2;

  Out1_valid <= In3;

END rtl;

