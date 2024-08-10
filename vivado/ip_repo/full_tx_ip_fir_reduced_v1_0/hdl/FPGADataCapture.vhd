
-- ----------------------------------------------
-- File Name: FPGADataCapture.vhd
-- Created:   10-Aug-2024 09:36:09
-- Copyright  2024 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY FPGADataCapture IS 
PORT (
      clk                             : IN  std_logic;
      clk_enable                      : IN  std_logic;
      data_out                        : IN  std_logic_vector(15 DOWNTO 0);
      valid_out                       : IN  std_logic;
      ready_to_capture                : OUT std_logic
);
END FPGADataCapture;

ARCHITECTURE rtl of FPGADataCapture IS

COMPONENT hdlverifier_capture_core IS 
GENERIC (DATA_WIDTH: integer := 8;
ADDR_WIDTH: integer := 7;
TRIG_WIDTH: integer := 9;
JTAG_ID: integer := 5;
DC_ID: integer := 1
);
PORT (
      clk                             : IN  std_logic;
      clk_enable                      : IN  std_logic;
      data                            : IN  std_logic_vector(DATA_WIDTH - 1 DOWNTO 0);
      trigger                         : IN  std_logic;
      start                           : OUT std_logic;
      ready_to_capture                : OUT std_logic;
      trigger_setting                 : OUT std_logic_vector(TRIG_WIDTH - 1 DOWNTO 0)
);
END COMPONENT;

COMPONENT hdlverifier_capture_trigger_condition_FPGADataCapture IS 
PORT (
      clk                             : IN  std_logic;
      clk_enable                      : IN  std_logic;
      trigger_setting                 : IN  std_logic_vector(43 DOWNTO 0);
      data_out                        : IN  std_logic_vector(15 DOWNTO 0);
      valid_out                       : IN  std_logic;
      trigger                         : OUT std_logic
);
END COMPONENT;

  SIGNAL all_data                         : std_logic_vector(23 DOWNTO 0); -- std24
  SIGNAL pad_zero                         : std_logic_vector(6 DOWNTO 0); -- std7
  SIGNAL trigger_setting                  : std_logic_vector(64 DOWNTO 0); -- std65
  SIGNAL trigger_1                        : std_logic; -- boolean
  SIGNAL start_flag                       : std_logic; -- boolean
  SIGNAL trigger_setting_cond1            : std_logic_vector(43 DOWNTO 0); -- std44

BEGIN

u_hdlverifier_capture_core: hdlverifier_capture_core 
GENERIC MAP (DATA_WIDTH => 24,
ADDR_WIDTH => 7,
TRIG_WIDTH => 65,
JTAG_ID => 2,
DC_ID => 1
)
PORT MAP(
        clk                  => clk,
        clk_enable           => clk_enable,
        start                => start_flag,
        ready_to_capture     => ready_to_capture,
        data                 => all_data,
        trigger              => trigger_1,
        trigger_setting      => trigger_setting
);

u_hdlverifier_capture_trigger_condition_FPGADataCapture: hdlverifier_capture_trigger_condition_FPGADataCapture 
PORT MAP(
        clk                  => clk,
        clk_enable           => clk_enable,
        trigger              => trigger_1,
        trigger_setting      => trigger_setting_cond1,
        data_out             => data_out,
        valid_out            => valid_out
);

all_data <= pad_zero & valid_out & data_out;
pad_zero <= (others => '0');
trigger_setting_cond1 <= trigger_setting(43 DOWNTO 0);

END;
