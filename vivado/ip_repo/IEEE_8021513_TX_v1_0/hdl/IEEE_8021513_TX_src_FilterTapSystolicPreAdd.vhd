-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd
-- Created: 2024-09-15 21:02:44
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_FilterTapSystolicPreAdd
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR Interpolator/HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR 
-- Interpolator/FIRFilter1/FilterTapSystolicPreAd
-- Hierarchy Level: 5
-- Model version: 4.135
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_FilterTapSystolicPreAdd IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        preAddIn                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coeff                             :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En16
        sumIn                             :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34_En30
        sumOut                            :   OUT   std_logic_vector(33 DOWNTO 0)  -- sfix34_En30
        );
END IEEE_8021513_TX_src_FilterTapSystolicPreAdd;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_FilterTapSystolicPreAdd IS

  -- Signals
  SIGNAL din_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL preAddIn_signed                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL coeff_signed                     : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL sumIn_signed                     : signed(33 DOWNTO 0);  -- sfix34_En30
  SIGNAL fTap_din1_reg1                   : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_din1_reg2                   : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_din2_reg1                   : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_preAdd_reg                  : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL fTap_mult_reg                    : signed(36 DOWNTO 0);  -- sfix37
  SIGNAL fTap_addout_reg                  : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL fTap_coef_reg1                   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL fTap_coef_reg2                   : signed(19 DOWNTO 0);  -- sfix20
  SIGNAL fTap_preAdd_reg_next             : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL fTap_mult_reg_next               : signed(36 DOWNTO 0);  -- sfix37_En30
  SIGNAL fTap_addout_reg_next             : signed(33 DOWNTO 0);  -- sfix34_En30
  SIGNAL fTap_add_cast                    : signed(33 DOWNTO 0);  -- sfix34_En30
  SIGNAL fTap_add_cast_1                  : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL fTap_add_cast_2                  : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL sumOut_tmp                       : signed(33 DOWNTO 0);  -- sfix34_En30

BEGIN
  din_re_signed <= signed(din_re);

  preAddIn_signed <= signed(preAddIn);

  coeff_signed <= signed(coeff);

  sumIn_signed <= signed(sumIn);

  -- FilterTapSystolicPreAddS
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fTap_din1_reg1 <= to_signed(16#0000#, 16);
        fTap_din1_reg2 <= to_signed(16#0000#, 16);
        fTap_din2_reg1 <= to_signed(16#0000#, 16);
        fTap_preAdd_reg <= to_signed(16#00000#, 17);
        fTap_coef_reg1 <= to_signed(16#00000#, 20);
        fTap_coef_reg2 <= to_signed(16#00000#, 20);
        fTap_mult_reg <= to_signed(0, 37);
        fTap_addout_reg <= to_signed(0, 34);
      ELSIF enb = '1' THEN
        fTap_preAdd_reg <= fTap_preAdd_reg_next;
        fTap_mult_reg <= fTap_mult_reg_next;
        fTap_addout_reg <= fTap_addout_reg_next;
        fTap_din1_reg2 <= fTap_din1_reg1;
        fTap_din1_reg1 <= din_re_signed;
        fTap_din2_reg1 <= preAddIn_signed;
        fTap_coef_reg2 <= fTap_coef_reg1;
        fTap_coef_reg1 <= coeff_signed;
      END IF;
    END IF;
  END PROCESS fTap_process;

  sumOut_tmp <= fTap_addout_reg;
  fTap_add_cast <= fTap_mult_reg(33 DOWNTO 0);
  fTap_addout_reg_next <= fTap_add_cast + sumIn_signed;
  fTap_mult_reg_next <= fTap_preAdd_reg * fTap_coef_reg2;
  fTap_add_cast_1 <= resize(fTap_din1_reg2, 17);
  fTap_add_cast_2 <= resize(fTap_din2_reg1, 17);
  fTap_preAdd_reg_next <= fTap_add_cast_1 + fTap_add_cast_2;

  sumOut <= std_logic_vector(sumOut_tmp);

END rtl;
