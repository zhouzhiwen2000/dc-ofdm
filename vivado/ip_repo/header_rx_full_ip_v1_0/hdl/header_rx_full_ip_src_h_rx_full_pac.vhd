-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxHeader/header_rx_full_ip_src_h_rx_full_pac.vhd
-- Created: 2024-10-03 10:46:52
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE header_rx_full_ip_src_h_rx_full_pac IS
  TYPE vector_of_signed4 IS ARRAY (NATURAL RANGE <>) OF signed(3 DOWNTO 0);
  TYPE vector_of_std_logic_vector6 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(5 DOWNTO 0);
  TYPE vector_of_signed6 IS ARRAY (NATURAL RANGE <>) OF signed(5 DOWNTO 0);
  TYPE vector_of_std_logic_vector3 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(2 DOWNTO 0);
  TYPE vector_of_std_logic_vector4 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(3 DOWNTO 0);
  TYPE vector_of_unsigned3 IS ARRAY (NATURAL RANGE <>) OF unsigned(2 DOWNTO 0);
  TYPE vector_of_unsigned4 IS ARRAY (NATURAL RANGE <>) OF unsigned(3 DOWNTO 0);
  TYPE vector_of_signed5 IS ARRAY (NATURAL RANGE <>) OF signed(4 DOWNTO 0);
  TYPE vector_of_std_logic_vector7 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(6 DOWNTO 0);
  TYPE vector_of_unsigned7 IS ARRAY (NATURAL RANGE <>) OF unsigned(6 DOWNTO 0);
  TYPE vector_of_unsigned6 IS ARRAY (NATURAL RANGE <>) OF unsigned(5 DOWNTO 0);
  TYPE vector_of_signed7 IS ARRAY (NATURAL RANGE <>) OF signed(6 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_unsigned5 IS ARRAY (NATURAL RANGE <>) OF unsigned(4 DOWNTO 0);
END header_rx_full_ip_src_h_rx_full_pac;
