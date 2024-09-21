library work;
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use STD.textio.all;
	use IEEE.std_logic_textio.all;
	use IEEE.NUMERIC_STD.ALL;

entity tx_v10_tb is
--  Port ( );
end tx_v10_tb;

architecture Behavioral of tx_v10_tb is
    constant PATH_OUTPUT_FILE: string := "data_out.mem";
    constant PATH_INPUT_FILE: string := "data_in.mem";
    constant REG0: std_logic_vector(31 downto 0) := "00000000000000000000000011110000";
    
    --constant PATH_OUTPUT_FILE: string := "data_out_single_ofdm.mem";
    --constant PATH_INPUT_FILE: string := "data_in_single_ofdm.mem";
    --constant REG0: std_logic_vector(31 downto 0) := "00000000000000000000000001111000";
    
    constant REG1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    constant REG2: std_logic_vector(31 downto 0) := "00000000000000010000000100000000";
    constant REG3: std_logic_vector(31 downto 0) := "00000000000000010000001000001111";
    
	constant PERIOD : time := 10ns;
	
	-----------------------
	-- Component signals
	-----------------------
	-- Output of the tx
    signal data_out_0 : STD_LOGIC_VECTOR ( 13 downto 0 );
    signal valid_out_0 : STD_LOGIC;
    
    -- Input of the tx
    signal new_frame_in_0 : STD_LOGIC := '0';
    signal reg0_0 : STD_LOGIC_VECTOR ( 31 downto 0 ) := "00000000000000000000000000000000";
    signal reg1_0 : STD_LOGIC_VECTOR ( 31 downto 0 ) := "00000000000000000000000000000000";
    signal reg2_0 : STD_LOGIC_VECTOR ( 31 downto 0 ) := "00000000000000000000000000000000";
    signal reg3_0 : STD_LOGIC_VECTOR ( 31 downto 0 ) := "00000000000000000000000000000000";
    
    -- Fifo
    signal s_axis_tdata_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
    signal s_axis_tlast_0 : STD_LOGIC := '0';
    signal s_axis_tvalid_0 : STD_LOGIC := '0';
    signal s_axis_tready_0 : STD_LOGIC;
    
    -- Clocks
    signal ext_clk : STD_LOGIC := '0';
    signal fifo_s_clk : STD_LOGIC;
    signal tx_clock : STD_LOGIC;
    signal fifo_m_clk : STD_LOGIC;
    
    signal rst : STD_LOGIC := '1'; 
begin

dut_instance: entity work.tx_v10_wrapper
PORT MAP (
      data_out_0(13 downto 0) => data_out_0(13 downto 0),
      ext_clk => ext_clk,
      fifo_s_clk => fifo_s_clk,
      new_frame_in_0 => new_frame_in_0,
      reg0_0(31 downto 0) => reg0_0(31 downto 0),
      reg1_0(31 downto 0) => reg1_0(31 downto 0),
      reg2_0(31 downto 0) => reg2_0(31 downto 0),
      reg3_0(31 downto 0) => reg3_0(31 downto 0),
      rst => rst,
      s_axis_tdata_0(7 downto 0) => s_axis_tdata_0(7 downto 0),
      s_axis_tlast_0 => s_axis_tlast_0,
      s_axis_tready_0 => s_axis_tready_0,
      s_axis_tvalid_0 => s_axis_tvalid_0,
      tx_clock => tx_clock,
      valid_out_0 => valid_out_0,
      fifo_m_clk => fifo_m_clk
    );

clock: process begin
    ext_clk <= not ext_clk; wait for PERIOD/2;
end process;

fileIO : process
    -- Variables used to read the flile
	file file_handler:     text;
	variable file_status:  file_open_status;
	variable buffer_line:  line;               -- Holds a line from the file
	variable spacer:       character;          -- Placeholder to discard the spacer between values
	variable file_rows:    integer := 1;       -- Current row of the file. Starts at 1 because line zero is used as metadata
	
    -- These variables should be identical to the component signals, but with the "file_xx" prefix.
	variable file_data_in:         std_logic_vector (7 downto 0);
	variable file_data_out:        std_logic_vector (13 downto 0);
    
begin
    -- Reset IP Cores
    rst <= '0'; wait for 200ns;
    rst <= '1'; wait for 1000ns;
    
    ----------------------------------
    -- Read input file and load FIFO
    ----------------------------------
    file_open (file_status, file_handler, PATH_INPUT_FILE);
    assert (file_status = OPEN_OK) report ">>> Could not open input file" severity failure;
    readLine (file_handler, buffer_line); -- Discard header
    wait until rising_edge(fifo_m_clk);
    
    file_input_loop: while (not endfile(file_handler) ) loop
    
        -- Wait for AXI4-Stream TVALID before writing any values.
        if (s_axis_tready_0 = '0') then
            wait until rising_edge(s_axis_tready_0);
        end if;
    
        readLine(file_handler, buffer_line);
        
        -- Read values from input file
        read(buffer_line, file_data_in);
        s_axis_tdata_0 <= file_data_in;
        
        -- TLAST and TVALID are always held "up"
        s_axis_tlast_0 <= '0';
        s_axis_tvalid_0 <= '1';
        
        -- If it is the last element, rise the TLAST value;
        if (endfile(file_handler)) then
            s_axis_tlast_0 <= '1';
        end if;
        
        wait until rising_edge(fifo_m_clk);
        file_rows := file_rows + 1;
            
    end loop file_input_loop;
    
    -- Lower tvalid and tlast
    s_axis_tlast_0 <= '0';
    s_axis_tvalid_0 <= '0';
    file_close (file_handler);
    
    ---------------------------------
    -- Setting initialization values
    ---------------------------------
    wait until rising_edge(fifo_s_clk);
    reg0_0 <= REG0;
    reg1_0 <= REG1;
    reg2_0 <= REG2;
    reg3_0 <= REG3;
    
    new_frame_in_0 <= '1';
    wait until rising_edge(fifo_s_clk);
    new_frame_in_0 <= '0';

    ---------------------------------
    -- Read values from output file
    ---------------------------------
    file_rows := 1;
	file_open (file_status, file_handler, PATH_OUTPUT_FILE, READ_MODE);
	assert (file_status = OPEN_OK) report ">>> Could not open output file" severity failure;
	readLine (file_handler, buffer_line);  -- Discard header

	file_reading_loop: while (not endfile(file_handler) ) loop
	   
        if (valid_out_0 = '0') then
            wait until rising_edge(valid_out_0);
            wait until rising_edge(tx_clock);
        end if;
        
    	readLine (file_handler, buffer_line);
    	read (buffer_line, file_data_out);
    	
    	-- Compare outputs
       assert (file_data_out = data_out_0) 
       report ">>> Output mismatch on line: " & INTEGER'image(file_rows)
       severity failure;

        wait until rising_edge(tx_clock);
    	file_rows := file_rows + 1;
   	 
	end loop file_reading_loop;
    
    report ">>> Test Successful!" severity note;
    
	file_close (file_handler);
	wait;
end process;

end Behavioral;
