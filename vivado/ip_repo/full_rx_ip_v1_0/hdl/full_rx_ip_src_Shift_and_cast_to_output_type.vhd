-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Shift_and_cast_to_output_type.vhd
-- Created: 2024-10-02 12:29:27
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Shift_and_cast_to_output_type
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Shift and cast to output typ
-- Hierarchy Level: 6
-- Model version: 1.100
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Shift_and_cast_to_output_type IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        x                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
        shiftValue                        :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34
        y                                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END full_rx_ip_src_Shift_and_cast_to_output_type;


ARCHITECTURE rtl OF full_rx_ip_src_Shift_and_cast_to_output_type IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_Cast_to_Union_of_Types
    PORT( Xref                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Cin                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          Cout                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En30
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Variable_Right_Shift
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          x                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          rightShift                      :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En30
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Variable_Left_Shift
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          x                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          leftShift                       :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En30
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_Cast_to_Union_of_Types
    USE ENTITY work.full_rx_ip_src_Cast_to_Union_of_Types(rtl);

  FOR ALL : full_rx_ip_src_Variable_Right_Shift
    USE ENTITY work.full_rx_ip_src_Variable_Right_Shift(rtl);

  FOR ALL : full_rx_ip_src_Variable_Left_Shift
    USE ENTITY work.full_rx_ip_src_Variable_Left_Shift(rtl);

  -- Signals
  SIGNAL shiftValue_signed                : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Constant_out1                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Cout                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Abs_rsvd_y                       : signed(34 DOWNTO 0);  -- sfix35
  SIGNAL Abs_out1                         : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay3_out1                      : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Variable_Right_Shift_out1        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Variable_Right_Shift_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Variable_Left_Shift_out1         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Variable_Left_Shift_out1_signed  : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Switch_out1                      : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay1_out1                      : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Data_Type_Conversion_out1        : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  u_Cast_to_Union_of_Types : full_rx_ip_src_Cast_to_Union_of_Types
    PORT MAP( Xref => std_logic_vector(Constant_out1),  -- sfix16_En14
              Cin => x,  -- sfix32_En30
              Cout => Cout  -- sfix32_En30
              );

  u_Variable_Right_Shift : full_rx_ip_src_Variable_Right_Shift
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              x => Cout,  -- sfix32_En30
              rightShift => std_logic_vector(Abs_out1),  -- int32
              y => Variable_Right_Shift_out1  -- sfix32_En30
              );

  u_Variable_Left_Shift : full_rx_ip_src_Variable_Left_Shift
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              x => Cout,  -- sfix32_En30
              leftShift => std_logic_vector(Abs_out1),  -- int32
              y => Variable_Left_Shift_out1  -- sfix32_En30
              );

  shiftValue_signed <= signed(shiftValue);

  Constant_out1 <= to_signed(16#0000#, 16);

  
  Abs_rsvd_y <=  - (resize(shiftValue_signed, 35)) WHEN shiftValue_signed < to_signed(0, 34) ELSE
      resize(shiftValue_signed, 35);
  Abs_out1 <= Abs_rsvd_y(31 DOWNTO 0);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_signed(0, 34);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= shiftValue_signed;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  
  switch_compare_1 <= '1' WHEN Delay3_out1 >= to_signed(0, 34) ELSE
      '0';

  Variable_Right_Shift_out1_signed <= signed(Variable_Right_Shift_out1);

  Variable_Left_Shift_out1_signed <= signed(Variable_Left_Shift_out1);

  
  Switch_out1 <= Variable_Right_Shift_out1_signed WHEN switch_compare_1 = '0' ELSE
      Variable_Left_Shift_out1_signed;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_signed(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Data_Type_Conversion_out1 <= Delay1_out1(31 DOWNTO 16);

  y <= std_logic_vector(Data_Type_Conversion_out1);

END rtl;
