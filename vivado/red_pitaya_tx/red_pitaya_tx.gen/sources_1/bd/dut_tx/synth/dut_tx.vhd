--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Sun Sep  1 22:04:26 2024
--Host        : cotti-machine running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target dut_tx.bd
--Design      : dut_tx
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dut_tx is
  port (
    clk_100 : out STD_LOGIC;
    clk_12_5 : out STD_LOGIC;
    data_out_0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    new_frame_in_0 : in STD_LOGIC;
    reg0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg1_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg2_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg3_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rst : in STD_LOGIC;
    s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast_0 : in STD_LOGIC;
    s_axis_tready_0 : out STD_LOGIC;
    s_axis_tvalid_0 : in STD_LOGIC;
    sys_clk : in STD_LOGIC;
    valid_out_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of dut_tx : entity is "dut_tx,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=dut_tx,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=6,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of dut_tx : entity is "dut_tx.hwdef";
end dut_tx;

architecture STRUCTURE of dut_tx is
  component dut_tx_full_tx_ip_0_2 is
  port (
    IPCORE_CLK : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    new_frame_in : in STD_LOGIC;
    reg0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    valid_in : in STD_LOGIC;
    last_frame : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    valid_out : out STD_LOGIC;
    ready : out STD_LOGIC
  );
  end component dut_tx_full_tx_ip_0_2;
  component dut_tx_clk_wiz_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_100 : out STD_LOGIC;
    clk_12_5 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component dut_tx_clk_wiz_0;
  component dut_tx_rst_clk_wiz_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component dut_tx_rst_clk_wiz_100M_0;
  component dut_tx_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component dut_tx_axis_data_fifo_0_0;
  signal axis_data_fifo_0_m_axis_tdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_data_fifo_0_m_axis_tlast : STD_LOGIC;
  signal axis_data_fifo_0_m_axis_tvalid : STD_LOGIC;
  signal axis_data_fifo_0_s_axis_tready : STD_LOGIC;
  signal clk_100MHz_1 : STD_LOGIC;
  signal clk_wiz_clk_100 : STD_LOGIC;
  signal clk_wiz_clk_12_5 : STD_LOGIC;
  signal clk_wiz_locked : STD_LOGIC;
  signal full_tx_ip_0_data_out : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal full_tx_ip_0_ready : STD_LOGIC;
  signal full_tx_ip_0_valid_out : STD_LOGIC;
  signal new_frame_in_0_1 : STD_LOGIC;
  signal reg0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg1_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg2_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg3_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reset_rtl_1 : STD_LOGIC;
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axis_tdata_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s_axis_tlast_0_1 : STD_LOGIC;
  signal s_axis_tvalid_0_1 : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_100 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_100 : signal is "XIL_INTERFACENAME CLK.CLK_100, CLK_DOMAIN /clk_wiz_clk_out1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of clk_12_5 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_12_5 CLK";
  attribute X_INTERFACE_PARAMETER of clk_12_5 : signal is "XIL_INTERFACENAME CLK.CLK_12_5, CLK_DOMAIN /clk_wiz_clk_out1, FREQ_HZ 12500000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 225.0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 RST.RST RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clk : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clk : signal is "XIL_INTERFACENAME CLK.SYS_CLK, CLK_DOMAIN dut_tx_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  clk_100 <= clk_wiz_clk_100;
  clk_100MHz_1 <= sys_clk;
  clk_12_5 <= clk_wiz_clk_12_5;
  data_out_0(11 downto 0) <= full_tx_ip_0_data_out(11 downto 0);
  new_frame_in_0_1 <= new_frame_in_0;
  reg0_0_1(31 downto 0) <= reg0_0(31 downto 0);
  reg1_0_1(31 downto 0) <= reg1_0(31 downto 0);
  reg2_0_1(31 downto 0) <= reg2_0(31 downto 0);
  reg3_0_1(31 downto 0) <= reg3_0(31 downto 0);
  reset_rtl_1 <= rst;
  s_axis_tdata_0_1(7 downto 0) <= s_axis_tdata_0(7 downto 0);
  s_axis_tlast_0_1 <= s_axis_tlast_0;
  s_axis_tready_0 <= axis_data_fifo_0_s_axis_tready;
  s_axis_tvalid_0_1 <= s_axis_tvalid_0;
  valid_out_0 <= full_tx_ip_0_valid_out;
axis_data_fifo_0: component dut_tx_axis_data_fifo_0_0
     port map (
      m_axis_tdata(7 downto 0) => axis_data_fifo_0_m_axis_tdata(7 downto 0),
      m_axis_tlast => axis_data_fifo_0_m_axis_tlast,
      m_axis_tready => full_tx_ip_0_ready,
      m_axis_tvalid => axis_data_fifo_0_m_axis_tvalid,
      s_axis_aclk => clk_wiz_clk_12_5,
      s_axis_aresetn => rst_clk_wiz_100M_peripheral_aresetn(0),
      s_axis_tdata(7 downto 0) => s_axis_tdata_0_1(7 downto 0),
      s_axis_tlast => s_axis_tlast_0_1,
      s_axis_tready => axis_data_fifo_0_s_axis_tready,
      s_axis_tvalid => s_axis_tvalid_0_1
    );
clk_wiz: component dut_tx_clk_wiz_0
     port map (
      clk_100 => clk_wiz_clk_100,
      clk_12_5 => clk_wiz_clk_12_5,
      clk_in1 => clk_100MHz_1,
      locked => clk_wiz_locked,
      resetn => reset_rtl_1
    );
full_tx_ip_0: component dut_tx_full_tx_ip_0_2
     port map (
      IPCORE_CLK => clk_wiz_clk_100,
      IPCORE_RESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      data_in(7 downto 0) => axis_data_fifo_0_m_axis_tdata(7 downto 0),
      data_out(11 downto 0) => full_tx_ip_0_data_out(11 downto 0),
      last_frame => axis_data_fifo_0_m_axis_tlast,
      new_frame_in => new_frame_in_0_1,
      ready => full_tx_ip_0_ready,
      reg0(31 downto 0) => reg0_0_1(31 downto 0),
      reg1(31 downto 0) => reg1_0_1(31 downto 0),
      reg2(31 downto 0) => reg2_0_1(31 downto 0),
      reg3(31 downto 0) => reg3_0_1(31 downto 0),
      valid_in => axis_data_fifo_0_m_axis_tvalid,
      valid_out => full_tx_ip_0_valid_out
    );
rst_clk_wiz_100M: component dut_tx_rst_clk_wiz_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_locked,
      ext_reset_in => reset_rtl_1,
      interconnect_aresetn(0) => NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_clk_100
    );
end STRUCTURE;
