-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_p_scrambler.vhd
-- Created: 2024-09-15 21:02:44
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_p_scrambler
-- Source Path: HDLTx/full_tx/payload_full/p_scrambler
-- Hierarchy Level: 2
-- Model version: 4.135
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_p_scrambler IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic;  -- ufix1
        ctrl_in_start                     :   IN    std_logic;
        ctrl_in_end                       :   IN    std_logic;
        ctrl_in_valid                     :   IN    std_logic;
        SI                                :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
        data_out                          :   OUT   std_logic;
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END IEEE_8021513_TX_src_p_scrambler;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_p_scrambler IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_end                        :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6
    USE ENTITY work.IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6(rtl);

  -- Signals
  SIGNAL Delay1_out1                      : std_logic;  -- ufix1
  SIGNAL valid                            : std_logic;
  SIGNAL start                            : std_logic;
  SIGNAL SI_0                             : std_logic;
  SIGNAL SI_1                             : std_logic;
  SIGNAL SI_2                             : std_logic;
  SIGNAL SI_3                             : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous3_out1 : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : std_logic;
  SIGNAL Switch2_out1                     : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : std_logic;
  SIGNAL Switch3_out1                     : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous2_out1 : std_logic;
  SIGNAL C5_out1                          : std_logic;
  SIGNAL C6_out1                          : std_logic;
  SIGNAL C7_out1                          : std_logic;
  SIGNAL C8_out1                          : std_logic;
  SIGNAL C9_out1                          : std_logic;
  SIGNAL C10_out1                         : std_logic;
  SIGNAL C11_out1                         : std_logic;
  SIGNAL C12_out1                         : std_logic;
  SIGNAL C13_out1                         : std_logic;
  SIGNAL C14_out1                         : std_logic;
  SIGNAL C15_out1                         : std_logic;
  SIGNAL C16_out1                         : std_logic;
  SIGNAL C17_out1                         : std_logic;
  SIGNAL C18_out1                         : std_logic;
  SIGNAL C19_out1                         : std_logic;
  SIGNAL C20_out1                         : std_logic;
  SIGNAL C21_out1                         : std_logic;
  SIGNAL C22_out1                         : std_logic;
  SIGNAL C23_out1                         : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_valid : std_logic;

BEGIN
  u_Sample_Control_Bus_Creator : IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6
    PORT MAP( In1 => Delay3_out1,
              In2 => Delay4_out1,
              In3 => Delay5_out1,
              Out1_start => Sample_Control_Bus_Creator_out1_start,
              Out1_end => Sample_Control_Bus_Creator_out1_end,
              Out1_valid => Sample_Control_Bus_Creator_out1_valid
              );

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= data_in;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  valid <= ctrl_in_valid;

  start <= ctrl_in_start;

  SI_0 <= SI(0);

  SI_1 <= SI(1);

  SI_2 <= SI(2);

  SI_3 <= SI(3);

  
  Switch_out1 <= Logical_Operator1_out1 WHEN start = '0' ELSE
      SI_0;

  Unit_Delay_Enabled_Synchronous3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1 <= '1';
      ELSIF enb = '1' AND valid = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous3_process;


  
  Switch1_out1 <= Unit_Delay_Enabled_Synchronous3_out1 WHEN start = '0' ELSE
      SI_1;

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= '1';
      ELSIF enb = '1' AND valid = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_process;


  
  Switch2_out1 <= Unit_Delay_Enabled_Synchronous_out1 WHEN start = '0' ELSE
      SI_2;

  Unit_Delay_Enabled_Synchronous1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= '1';
      ELSIF enb = '1' AND valid = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= Switch2_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_process;


  
  Switch3_out1 <= Unit_Delay_Enabled_Synchronous1_out1 WHEN start = '0' ELSE
      SI_3;

  Unit_Delay_Enabled_Synchronous2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= '1';
      ELSIF enb = '1' AND valid = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= Switch3_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous2_process;


  C5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C5_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C5_out1 <= '1';
        ELSIF valid = '1' THEN
          C5_out1 <= Unit_Delay_Enabled_Synchronous2_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C5_process;


  C6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C6_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C6_out1 <= '1';
        ELSIF valid = '1' THEN
          C6_out1 <= C5_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C6_process;


  C7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C7_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C7_out1 <= '1';
        ELSIF valid = '1' THEN
          C7_out1 <= C6_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C7_process;


  C8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C8_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C8_out1 <= '1';
        ELSIF valid = '1' THEN
          C8_out1 <= C7_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C8_process;


  C9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C9_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C9_out1 <= '1';
        ELSIF valid = '1' THEN
          C9_out1 <= C8_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C9_process;


  C10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C10_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C10_out1 <= '1';
        ELSIF valid = '1' THEN
          C10_out1 <= C9_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C10_process;


  C11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C11_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C11_out1 <= '1';
        ELSIF valid = '1' THEN
          C11_out1 <= C10_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C11_process;


  C12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C12_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C12_out1 <= '1';
        ELSIF valid = '1' THEN
          C12_out1 <= C11_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C12_process;


  C13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C13_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C13_out1 <= '1';
        ELSIF valid = '1' THEN
          C13_out1 <= C12_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C13_process;


  C14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C14_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C14_out1 <= '1';
        ELSIF valid = '1' THEN
          C14_out1 <= C13_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C14_process;


  C15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C15_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C15_out1 <= '1';
        ELSIF valid = '1' THEN
          C15_out1 <= C14_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C15_process;


  C16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C16_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C16_out1 <= '1';
        ELSIF valid = '1' THEN
          C16_out1 <= C15_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C16_process;


  C17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C17_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C17_out1 <= '1';
        ELSIF valid = '1' THEN
          C17_out1 <= C16_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C17_process;


  C18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C18_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C18_out1 <= '1';
        ELSIF valid = '1' THEN
          C18_out1 <= C17_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C18_process;


  C19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C19_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C19_out1 <= '1';
        ELSIF valid = '1' THEN
          C19_out1 <= C18_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C19_process;


  C20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C20_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C20_out1 <= '1';
        ELSIF valid = '1' THEN
          C20_out1 <= C19_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C20_process;


  C21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C21_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C21_out1 <= '1';
        ELSIF valid = '1' THEN
          C21_out1 <= C20_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C21_process;


  C22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C22_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C22_out1 <= '1';
        ELSIF valid = '1' THEN
          C22_out1 <= C21_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C22_process;


  C23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        C23_out1 <= '1';
      ELSIF enb = '1' THEN
        IF start = '1' THEN
          C23_out1 <= '1';
        ELSIF valid = '1' THEN
          C23_out1 <= C22_out1;
        END IF;
      END IF;
    END IF;
  END PROCESS C23_process;


  Logical_Operator1_out1 <= C23_out1 XOR C18_out1;

  Logical_Operator_out1 <= Delay1_out1 XOR Logical_Operator1_out1;

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= start;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  end_rsvd <= ctrl_in_end;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= end_rsvd;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay5_out1 <= valid;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  data_out <= Logical_Operator_out1;

  ctrl_out_start <= Sample_Control_Bus_Creator_out1_start;

  ctrl_out_end <= Sample_Control_Bus_Creator_out1_end;

  ctrl_out_valid <= Sample_Control_Bus_Creator_out1_valid;

END rtl;
