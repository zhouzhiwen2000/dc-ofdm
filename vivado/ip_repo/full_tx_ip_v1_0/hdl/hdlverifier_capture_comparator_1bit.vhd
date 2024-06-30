
-- ----------------------------------------------
-- File Name: hdlverifier_capture_comparator_1bit.vhd
-- Created:   30-Jun-2024 19:39:22
-- Copyright  2024 MathWorks, Inc.
-- ----------------------------------------------




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hdlverifier_capture_comparator_1bit is
  port (
    clk : in std_logic;
    clk_enable : in std_logic;
    data : in std_logic;
    trigger : out std_logic;
    trigger_mode : in std_logic_vector(2 downto 0);
	trigger_comparison_operator : in std_logic
  );
end entity; 


architecture rtl of hdlverifier_capture_comparator_1bit is
								 
  signal data_d1 : std_logic;  
  signal trigger_condition : std_logic;  
begin
  
  
  process (clk) is
  variable concatenate : std_logic_vector(3 downto 0);
  begin
  
    if rising_edge(clk) then
      if clk_enable = '1' then
	  concatenate := trigger_comparison_operator & trigger_mode;
	  case concatenate is
	  -- equal to operation
	  when "0000" =>
	  if (not data) = '1' then
	   trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "0001" =>
	  if data = '1' then
	   trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "0010" =>
	  if ((not data_d1)='1') and (data='1') then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "0011" =>
	  if  (data_d1='1') and ((not data)='1') then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "0100" =>
	  if  (data_d1='1') xor ( data='1') then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  -- not equal to operation
	  when "1000" =>
	  if   data='1' then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "1001" =>
	  if (not data) = '1' then
	   trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "1010" =>
	  if not(((not data_d1)='1') and (data='1')) then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "1011" =>
	  if  not((data_d1='1') and ((not data)='1')) then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when "1100" =>
	  if  (data_d1='1') xnor ( data='1') then
	  trigger <= '1';
        else
            trigger <= '0';
	  end if;
	  
	  when others => trigger <= '0';
	  end case;
	  end if;
	  end if;
    end process;
  
  
  process (clk) is
  begin
    if rising_edge(clk) then
        if clk_enable = '1' then
            data_d1 <= data;
            end if;
    end if;
  end process;
end architecture;
