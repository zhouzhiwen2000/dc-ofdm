-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Sun Jun 30 18:40:10 2024
-- Host        : cotti-machine running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/simulink/examples/exampleIPCore/exampleIPCore_vivado/exampleIPCore_vivado.gen/sources_1/bd/design_1/ip/design_1_complex_m_ip_0_0/design_1_complex_m_ip_0_0_sim_netlist.vhdl
-- Design      : design_1_complex_m_ip_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder is
  port (
    read_reg_ip_timestamp : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_reg_axi_enable_1_1 : out STD_LOGIC;
    AXI4_Lite_ARADDR_8_sp_1 : out STD_LOGIC;
    \AXI4_Lite_ARADDR[14]\ : out STD_LOGIC;
    \read_reg_ip_timestamp_reg[31]_0\ : in STD_LOGIC;
    AXI4_Lite_ACLK : in STD_LOGIC;
    data_reg_axi_enable_1_1_reg_0 : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder : entity is "complex_m_ip_addr_decoder";
end design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder is
  signal AXI4_Lite_ARADDR_8_sn_1 : STD_LOGIC;
begin
  AXI4_Lite_ARADDR_8_sp_1 <= AXI4_Lite_ARADDR_8_sn_1;
\AXI4_Lite_RDATA_tmp[31]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(10),
      I1 => AXI4_Lite_ARADDR(6),
      I2 => AXI4_Lite_ARADDR(7),
      I3 => AXI4_Lite_ARADDR(8),
      I4 => AXI4_Lite_ARADDR(9),
      O => \AXI4_Lite_ARADDR[14]\
    );
\AXI4_Lite_RDATA_tmp[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(4),
      I1 => AXI4_Lite_ARADDR(2),
      I2 => AXI4_Lite_ARADDR(1),
      I3 => AXI4_Lite_ARADDR(3),
      I4 => AXI4_Lite_ARADDR(0),
      I5 => AXI4_Lite_ARADDR(5),
      O => AXI4_Lite_ARADDR_8_sn_1
    );
data_reg_axi_enable_1_1_reg: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => data_reg_axi_enable_1_1_reg_0,
      Q => data_reg_axi_enable_1_1,
      R => '0'
    );
\read_reg_ip_timestamp_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => \read_reg_ip_timestamp_reg[31]_0\,
      Q => read_reg_ip_timestamp(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module is
  port (
    FSM_sequential_axi_lite_rstate_reg_0 : out STD_LOGIC;
    AXI4_Lite_RDATA : out STD_LOGIC_VECTOR ( 0 to 0 );
    soft_reset : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_AWREADY : out STD_LOGIC;
    AXI4_Lite_ARREADY : out STD_LOGIC;
    reset_in : out STD_LOGIC;
    data_reg_axi_enable_1_1_reg : out STD_LOGIC;
    AXI4_Lite_ACLK : in STD_LOGIC;
    AXI4_Lite_AWVALID : in STD_LOGIC;
    AXI4_Lite_WVALID : in STD_LOGIC;
    data_reg_axi_enable_1_1_reg_0 : in STD_LOGIC;
    data_reg_axi_enable_1_1_reg_1 : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 2 downto 0 );
    AXI4_Lite_ARVALID : in STD_LOGIC;
    AXI4_Lite_RREADY : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    AXI4_Lite_BREADY : in STD_LOGIC;
    AXI4_Lite_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    read_reg_ip_timestamp : in STD_LOGIC_VECTOR ( 0 to 0 );
    AXI4_Lite_WDATA : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_reg_axi_enable_1_1 : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    AXI4_Lite_AWADDR : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module : entity is "complex_m_ip_axi_lite_module";
end design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module is
  signal \^axi4_lite_rdata\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \AXI4_Lite_RDATA_tmp[31]_i_1_n_0\ : STD_LOGIC;
  signal \AXI4_Lite_RDATA_tmp[31]_i_2_n_0\ : STD_LOGIC;
  signal \AXI4_Lite_RDATA_tmp[31]_i_3_n_0\ : STD_LOGIC;
  signal \AXI4_Lite_RDATA_tmp[31]_i_4_n_0\ : STD_LOGIC;
  signal \AXI4_Lite_RDATA_tmp[31]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\ : STD_LOGIC;
  signal \^fsm_sequential_axi_lite_rstate_reg_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal aw_transfer : STD_LOGIC;
  signal axi_lite_rstate_next : STD_LOGIC;
  signal axi_lite_wstate_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal data_reg_axi_enable_1_1_i_2_n_0 : STD_LOGIC;
  signal data_reg_axi_enable_1_1_i_3_n_0 : STD_LOGIC;
  signal data_reg_axi_enable_1_1_i_4_n_0 : STD_LOGIC;
  signal reset_x : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^soft_reset\ : STD_LOGIC;
  signal soft_reset_i_1_n_0 : STD_LOGIC;
  signal soft_reset_i_2_n_0 : STD_LOGIC;
  signal soft_reset_i_3_n_0 : STD_LOGIC;
  signal soft_reset_i_4_n_0 : STD_LOGIC;
  signal top_rd_enb : STD_LOGIC;
  signal top_wr_enb : STD_LOGIC;
  signal w_transfer_and_wstrb : STD_LOGIC;
  signal \wdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \wdata_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of AXI4_Lite_ARREADY_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of AXI4_Lite_AWREADY_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \AXI4_Lite_RDATA_tmp[31]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_axi_lite_wstate[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_axi_lite_wstate[1]_i_2\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_axi_lite_wstate_reg[0]\ : label is "iSTATE:010,iSTATE0:100,iSTATE1:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_axi_lite_wstate_reg[1]\ : label is "iSTATE:010,iSTATE0:100,iSTATE1:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_axi_lite_wstate_reg[2]\ : label is "iSTATE:010,iSTATE0:100,iSTATE1:001";
  attribute SOFT_HLUTNM of FSM_sequential_axi_lite_rstate_i_1 : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES of FSM_sequential_axi_lite_rstate_reg : label is "iSTATE:0,iSTATE0:1";
begin
  AXI4_Lite_RDATA(0) <= \^axi4_lite_rdata\(0);
  FSM_sequential_axi_lite_rstate_reg_0 <= \^fsm_sequential_axi_lite_rstate_reg_0\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  soft_reset <= \^soft_reset\;
AXI4_Lite_ARREADY_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I1 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I2 => AXI4_Lite_AWVALID,
      O => AXI4_Lite_ARREADY
    );
AXI4_Lite_AWREADY_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I1 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      O => AXI4_Lite_AWREADY
    );
\AXI4_Lite_RDATA_tmp[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0200FFFF02000000"
    )
        port map (
      I0 => \AXI4_Lite_RDATA_tmp[31]_i_2_n_0\,
      I1 => \AXI4_Lite_RDATA_tmp[31]_i_3_n_0\,
      I2 => \AXI4_Lite_RDATA_tmp[31]_i_4_n_0\,
      I3 => read_reg_ip_timestamp(0),
      I4 => top_rd_enb,
      I5 => \^axi4_lite_rdata\(0),
      O => \AXI4_Lite_RDATA_tmp[31]_i_1_n_0\
    );
\AXI4_Lite_RDATA_tmp[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => \AXI4_Lite_RDATA_tmp[31]_i_6_n_0\,
      I1 => data_reg_axi_enable_1_1_reg_0,
      I2 => soft_reset_i_2_n_0,
      I3 => top_rd_enb,
      I4 => data_reg_axi_enable_1_1_reg_1,
      O => \AXI4_Lite_RDATA_tmp[31]_i_2_n_0\
    );
\AXI4_Lite_RDATA_tmp[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCAFFFAF"
    )
        port map (
      I0 => sel0(13),
      I1 => AXI4_Lite_ARADDR(2),
      I2 => sel0(1),
      I3 => top_rd_enb,
      I4 => AXI4_Lite_ARADDR(1),
      O => \AXI4_Lite_RDATA_tmp[31]_i_3_n_0\
    );
\AXI4_Lite_RDATA_tmp[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(0),
      I1 => AXI4_Lite_ARVALID,
      I2 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I3 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I4 => AXI4_Lite_AWVALID,
      I5 => sel0(0),
      O => \AXI4_Lite_RDATA_tmp[31]_i_4_n_0\
    );
\AXI4_Lite_RDATA_tmp[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => AXI4_Lite_ARVALID,
      I1 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I2 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I3 => AXI4_Lite_AWVALID,
      O => top_rd_enb
    );
\AXI4_Lite_RDATA_tmp[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => sel0(9),
      I1 => sel0(10),
      I2 => sel0(11),
      I3 => sel0(12),
      I4 => sel0(8),
      O => \AXI4_Lite_RDATA_tmp[31]_i_6_n_0\
    );
\AXI4_Lite_RDATA_tmp_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => \AXI4_Lite_RDATA_tmp[31]_i_1_n_0\,
      Q => \^axi4_lite_rdata\(0),
      R => reset_x
    );
\FSM_onehot_axi_lite_wstate[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF8F8888"
    )
        port map (
      I0 => \^q\(1),
      I1 => AXI4_Lite_BREADY,
      I2 => AXI4_Lite_AWVALID,
      I3 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I4 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      O => axi_lite_wstate_next(0)
    );
\FSM_onehot_axi_lite_wstate[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => AXI4_Lite_ARESETN,
      O => reset_x
    );
\FSM_onehot_axi_lite_wstate[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4040"
    )
        port map (
      I0 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I1 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I2 => AXI4_Lite_AWVALID,
      I3 => AXI4_Lite_WVALID,
      I4 => \^q\(0),
      O => axi_lite_wstate_next(1)
    );
\FSM_onehot_axi_lite_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^q\(0),
      I1 => AXI4_Lite_WVALID,
      I2 => AXI4_Lite_BREADY,
      I3 => \^q\(1),
      O => axi_lite_wstate_next(2)
    );
\FSM_onehot_axi_lite_wstate_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => axi_lite_wstate_next(0),
      Q => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      S => reset_x
    );
\FSM_onehot_axi_lite_wstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => axi_lite_wstate_next(1),
      Q => \^q\(0),
      R => reset_x
    );
\FSM_onehot_axi_lite_wstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => axi_lite_wstate_next(2),
      Q => \^q\(1),
      R => reset_x
    );
FSM_sequential_axi_lite_rstate_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF4040"
    )
        port map (
      I0 => AXI4_Lite_AWVALID,
      I1 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I2 => AXI4_Lite_ARVALID,
      I3 => AXI4_Lite_RREADY,
      I4 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      O => axi_lite_rstate_next
    );
FSM_sequential_axi_lite_rstate_reg: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => axi_lite_rstate_next,
      Q => \^fsm_sequential_axi_lite_rstate_reg_0\,
      R => reset_x
    );
data_reg_axi_enable_1_1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBA8A"
    )
        port map (
      I0 => data_reg_axi_enable_1_1,
      I1 => data_reg_axi_enable_1_1_i_2_n_0,
      I2 => \AXI4_Lite_RDATA_tmp[31]_i_2_n_0\,
      I3 => \wdata_reg_n_0_[0]\,
      I4 => reset_out,
      O => data_reg_axi_enable_1_1_reg
    );
data_reg_axi_enable_1_1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF47FFFFFF"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(0),
      I1 => top_rd_enb,
      I2 => sel0(0),
      I3 => top_wr_enb,
      I4 => data_reg_axi_enable_1_1_i_3_n_0,
      I5 => data_reg_axi_enable_1_1_i_4_n_0,
      O => data_reg_axi_enable_1_1_i_2_n_0
    );
data_reg_axi_enable_1_1_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000400FFFFF7FF"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(1),
      I1 => AXI4_Lite_ARVALID,
      I2 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I3 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I4 => AXI4_Lite_AWVALID,
      I5 => sel0(1),
      O => data_reg_axi_enable_1_1_i_3_n_0
    );
data_reg_axi_enable_1_1_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => AXI4_Lite_ARADDR(2),
      I1 => AXI4_Lite_ARVALID,
      I2 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      I3 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I4 => AXI4_Lite_AWVALID,
      I5 => sel0(13),
      O => data_reg_axi_enable_1_1_i_4_n_0
    );
reset_pipe_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^soft_reset\,
      I1 => AXI4_Lite_ARESETN,
      I2 => IPCORE_RESETN,
      O => reset_in
    );
soft_reset_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => soft_reset_i_2_n_0,
      I1 => soft_reset_i_3_n_0,
      I2 => soft_reset_i_4_n_0,
      I3 => sel0(11),
      I4 => sel0(10),
      I5 => sel0(9),
      O => soft_reset_i_1_n_0
    );
soft_reset_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => sel0(6),
      I1 => sel0(5),
      I2 => sel0(2),
      I3 => sel0(7),
      I4 => sel0(3),
      I5 => sel0(4),
      O => soft_reset_i_2_n_0
    );
soft_reset_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => top_wr_enb,
      I1 => sel0(1),
      I2 => \wdata_reg_n_0_[0]\,
      I3 => sel0(0),
      O => soft_reset_i_3_n_0
    );
soft_reset_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => sel0(12),
      I1 => sel0(8),
      I2 => AXI4_Lite_ARESETN,
      I3 => sel0(13),
      O => soft_reset_i_4_n_0
    );
soft_reset_reg: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => soft_reset_i_1_n_0,
      Q => \^soft_reset\,
      R => '0'
    );
\waddr[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => AXI4_Lite_AWVALID,
      I1 => \FSM_onehot_axi_lite_wstate_reg_n_0_[0]\,
      I2 => \^fsm_sequential_axi_lite_rstate_reg_0\,
      O => aw_transfer
    );
\waddr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(8),
      Q => sel0(8),
      R => reset_x
    );
\waddr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(9),
      Q => sel0(9),
      R => reset_x
    );
\waddr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(10),
      Q => sel0(10),
      R => reset_x
    );
\waddr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(11),
      Q => sel0(11),
      R => reset_x
    );
\waddr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(12),
      Q => sel0(12),
      R => reset_x
    );
\waddr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(13),
      Q => sel0(13),
      R => reset_x
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(0),
      Q => sel0(0),
      R => reset_x
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(1),
      Q => sel0(1),
      R => reset_x
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(2),
      Q => sel0(2),
      R => reset_x
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(3),
      Q => sel0(3),
      R => reset_x
    );
\waddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(4),
      Q => sel0(4),
      R => reset_x
    );
\waddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(5),
      Q => sel0(5),
      R => reset_x
    );
\waddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(6),
      Q => sel0(6),
      R => reset_x
    );
\waddr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => aw_transfer,
      D => AXI4_Lite_AWADDR(7),
      Q => sel0(7),
      R => reset_x
    );
\wdata[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => AXI4_Lite_WDATA(0),
      I1 => AXI4_Lite_WVALID,
      I2 => \^q\(0),
      I3 => \wdata_reg_n_0_[0]\,
      O => \wdata[0]_i_1_n_0\
    );
\wdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => \wdata[0]_i_1_n_0\,
      Q => \wdata_reg_n_0_[0]\,
      R => reset_x
    );
wr_enb_1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(0),
      I1 => AXI4_Lite_WVALID,
      I2 => AXI4_Lite_WSTRB(2),
      I3 => AXI4_Lite_WSTRB(1),
      I4 => AXI4_Lite_WSTRB(0),
      I5 => AXI4_Lite_WSTRB(3),
      O => w_transfer_and_wstrb
    );
wr_enb_1_reg: unisim.vcomponents.FDRE
     port map (
      C => AXI4_Lite_ACLK,
      CE => '1',
      D => w_transfer_and_wstrb,
      Q => top_wr_enb,
      R => reset_x
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_reset_sync is
  port (
    reset_out : out STD_LOGIC;
    reset_out_reg_0 : out STD_LOGIC;
    reset_in : in STD_LOGIC;
    IPCORE_CLK : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    soft_reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_reset_sync : entity is "complex_m_ip_reset_sync";
end design_1_complex_m_ip_0_0_complex_m_ip_reset_sync;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_reset_sync is
  signal \^reset_out\ : STD_LOGIC;
  signal reset_out_i_1_n_0 : STD_LOGIC;
  signal reset_pipe : STD_LOGIC;
begin
  reset_out <= \^reset_out\;
\read_reg_ip_timestamp[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^reset_out\,
      O => reset_out_reg_0
    );
reset_out_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFBF"
    )
        port map (
      I0 => reset_pipe,
      I1 => IPCORE_RESETN,
      I2 => AXI4_Lite_ARESETN,
      I3 => soft_reset,
      O => reset_out_i_1_n_0
    );
reset_out_reg: unisim.vcomponents.FDRE
     port map (
      C => IPCORE_CLK,
      CE => '1',
      D => reset_out_i_1_n_0,
      Q => \^reset_out\,
      R => '0'
    );
reset_pipe_reg: unisim.vcomponents.FDRE
     port map (
      C => IPCORE_CLK,
      CE => '1',
      D => reset_in,
      Q => reset_pipe,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply is
  port (
    a_b_r : out STD_LOGIC_VECTOR ( 32 downto 0 );
    a_b_i : out STD_LOGIC_VECTOR ( 32 downto 0 );
    data_reg_axi_enable_1_1 : in STD_LOGIC;
    IPCORE_CLK : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    br : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ar : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ai : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply : entity is "complex_m_ip_src_complex_multiply";
end design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply is
  signal Delay1_out1_reg_n_100 : STD_LOGIC;
  signal Delay1_out1_reg_n_101 : STD_LOGIC;
  signal Delay1_out1_reg_n_102 : STD_LOGIC;
  signal Delay1_out1_reg_n_103 : STD_LOGIC;
  signal Delay1_out1_reg_n_104 : STD_LOGIC;
  signal Delay1_out1_reg_n_105 : STD_LOGIC;
  signal Delay1_out1_reg_n_106 : STD_LOGIC;
  signal Delay1_out1_reg_n_107 : STD_LOGIC;
  signal Delay1_out1_reg_n_108 : STD_LOGIC;
  signal Delay1_out1_reg_n_109 : STD_LOGIC;
  signal Delay1_out1_reg_n_110 : STD_LOGIC;
  signal Delay1_out1_reg_n_111 : STD_LOGIC;
  signal Delay1_out1_reg_n_112 : STD_LOGIC;
  signal Delay1_out1_reg_n_113 : STD_LOGIC;
  signal Delay1_out1_reg_n_114 : STD_LOGIC;
  signal Delay1_out1_reg_n_115 : STD_LOGIC;
  signal Delay1_out1_reg_n_116 : STD_LOGIC;
  signal Delay1_out1_reg_n_117 : STD_LOGIC;
  signal Delay1_out1_reg_n_118 : STD_LOGIC;
  signal Delay1_out1_reg_n_119 : STD_LOGIC;
  signal Delay1_out1_reg_n_120 : STD_LOGIC;
  signal Delay1_out1_reg_n_121 : STD_LOGIC;
  signal Delay1_out1_reg_n_122 : STD_LOGIC;
  signal Delay1_out1_reg_n_123 : STD_LOGIC;
  signal Delay1_out1_reg_n_124 : STD_LOGIC;
  signal Delay1_out1_reg_n_125 : STD_LOGIC;
  signal Delay1_out1_reg_n_126 : STD_LOGIC;
  signal Delay1_out1_reg_n_127 : STD_LOGIC;
  signal Delay1_out1_reg_n_128 : STD_LOGIC;
  signal Delay1_out1_reg_n_129 : STD_LOGIC;
  signal Delay1_out1_reg_n_130 : STD_LOGIC;
  signal Delay1_out1_reg_n_131 : STD_LOGIC;
  signal Delay1_out1_reg_n_132 : STD_LOGIC;
  signal Delay1_out1_reg_n_133 : STD_LOGIC;
  signal Delay1_out1_reg_n_134 : STD_LOGIC;
  signal Delay1_out1_reg_n_135 : STD_LOGIC;
  signal Delay1_out1_reg_n_136 : STD_LOGIC;
  signal Delay1_out1_reg_n_137 : STD_LOGIC;
  signal Delay1_out1_reg_n_138 : STD_LOGIC;
  signal Delay1_out1_reg_n_139 : STD_LOGIC;
  signal Delay1_out1_reg_n_140 : STD_LOGIC;
  signal Delay1_out1_reg_n_141 : STD_LOGIC;
  signal Delay1_out1_reg_n_142 : STD_LOGIC;
  signal Delay1_out1_reg_n_143 : STD_LOGIC;
  signal Delay1_out1_reg_n_144 : STD_LOGIC;
  signal Delay1_out1_reg_n_145 : STD_LOGIC;
  signal Delay1_out1_reg_n_146 : STD_LOGIC;
  signal Delay1_out1_reg_n_147 : STD_LOGIC;
  signal Delay1_out1_reg_n_148 : STD_LOGIC;
  signal Delay1_out1_reg_n_149 : STD_LOGIC;
  signal Delay1_out1_reg_n_150 : STD_LOGIC;
  signal Delay1_out1_reg_n_151 : STD_LOGIC;
  signal Delay1_out1_reg_n_152 : STD_LOGIC;
  signal Delay1_out1_reg_n_153 : STD_LOGIC;
  signal Delay1_out1_reg_n_74 : STD_LOGIC;
  signal Delay1_out1_reg_n_75 : STD_LOGIC;
  signal Delay1_out1_reg_n_76 : STD_LOGIC;
  signal Delay1_out1_reg_n_77 : STD_LOGIC;
  signal Delay1_out1_reg_n_78 : STD_LOGIC;
  signal Delay1_out1_reg_n_79 : STD_LOGIC;
  signal Delay1_out1_reg_n_80 : STD_LOGIC;
  signal Delay1_out1_reg_n_81 : STD_LOGIC;
  signal Delay1_out1_reg_n_82 : STD_LOGIC;
  signal Delay1_out1_reg_n_83 : STD_LOGIC;
  signal Delay1_out1_reg_n_84 : STD_LOGIC;
  signal Delay1_out1_reg_n_85 : STD_LOGIC;
  signal Delay1_out1_reg_n_86 : STD_LOGIC;
  signal Delay1_out1_reg_n_87 : STD_LOGIC;
  signal Delay1_out1_reg_n_88 : STD_LOGIC;
  signal Delay1_out1_reg_n_89 : STD_LOGIC;
  signal Delay1_out1_reg_n_90 : STD_LOGIC;
  signal Delay1_out1_reg_n_91 : STD_LOGIC;
  signal Delay1_out1_reg_n_92 : STD_LOGIC;
  signal Delay1_out1_reg_n_93 : STD_LOGIC;
  signal Delay1_out1_reg_n_94 : STD_LOGIC;
  signal Delay1_out1_reg_n_95 : STD_LOGIC;
  signal Delay1_out1_reg_n_96 : STD_LOGIC;
  signal Delay1_out1_reg_n_97 : STD_LOGIC;
  signal Delay1_out1_reg_n_98 : STD_LOGIC;
  signal Delay1_out1_reg_n_99 : STD_LOGIC;
  signal Delay_out1_reg_n_100 : STD_LOGIC;
  signal Delay_out1_reg_n_101 : STD_LOGIC;
  signal Delay_out1_reg_n_102 : STD_LOGIC;
  signal Delay_out1_reg_n_103 : STD_LOGIC;
  signal Delay_out1_reg_n_104 : STD_LOGIC;
  signal Delay_out1_reg_n_105 : STD_LOGIC;
  signal Delay_out1_reg_n_106 : STD_LOGIC;
  signal Delay_out1_reg_n_107 : STD_LOGIC;
  signal Delay_out1_reg_n_108 : STD_LOGIC;
  signal Delay_out1_reg_n_109 : STD_LOGIC;
  signal Delay_out1_reg_n_110 : STD_LOGIC;
  signal Delay_out1_reg_n_111 : STD_LOGIC;
  signal Delay_out1_reg_n_112 : STD_LOGIC;
  signal Delay_out1_reg_n_113 : STD_LOGIC;
  signal Delay_out1_reg_n_114 : STD_LOGIC;
  signal Delay_out1_reg_n_115 : STD_LOGIC;
  signal Delay_out1_reg_n_116 : STD_LOGIC;
  signal Delay_out1_reg_n_117 : STD_LOGIC;
  signal Delay_out1_reg_n_118 : STD_LOGIC;
  signal Delay_out1_reg_n_119 : STD_LOGIC;
  signal Delay_out1_reg_n_120 : STD_LOGIC;
  signal Delay_out1_reg_n_121 : STD_LOGIC;
  signal Delay_out1_reg_n_122 : STD_LOGIC;
  signal Delay_out1_reg_n_123 : STD_LOGIC;
  signal Delay_out1_reg_n_124 : STD_LOGIC;
  signal Delay_out1_reg_n_125 : STD_LOGIC;
  signal Delay_out1_reg_n_126 : STD_LOGIC;
  signal Delay_out1_reg_n_127 : STD_LOGIC;
  signal Delay_out1_reg_n_128 : STD_LOGIC;
  signal Delay_out1_reg_n_129 : STD_LOGIC;
  signal Delay_out1_reg_n_130 : STD_LOGIC;
  signal Delay_out1_reg_n_131 : STD_LOGIC;
  signal Delay_out1_reg_n_132 : STD_LOGIC;
  signal Delay_out1_reg_n_133 : STD_LOGIC;
  signal Delay_out1_reg_n_134 : STD_LOGIC;
  signal Delay_out1_reg_n_135 : STD_LOGIC;
  signal Delay_out1_reg_n_136 : STD_LOGIC;
  signal Delay_out1_reg_n_137 : STD_LOGIC;
  signal Delay_out1_reg_n_138 : STD_LOGIC;
  signal Delay_out1_reg_n_139 : STD_LOGIC;
  signal Delay_out1_reg_n_140 : STD_LOGIC;
  signal Delay_out1_reg_n_141 : STD_LOGIC;
  signal Delay_out1_reg_n_142 : STD_LOGIC;
  signal Delay_out1_reg_n_143 : STD_LOGIC;
  signal Delay_out1_reg_n_144 : STD_LOGIC;
  signal Delay_out1_reg_n_145 : STD_LOGIC;
  signal Delay_out1_reg_n_146 : STD_LOGIC;
  signal Delay_out1_reg_n_147 : STD_LOGIC;
  signal Delay_out1_reg_n_148 : STD_LOGIC;
  signal Delay_out1_reg_n_149 : STD_LOGIC;
  signal Delay_out1_reg_n_150 : STD_LOGIC;
  signal Delay_out1_reg_n_151 : STD_LOGIC;
  signal Delay_out1_reg_n_152 : STD_LOGIC;
  signal Delay_out1_reg_n_153 : STD_LOGIC;
  signal Delay_out1_reg_n_74 : STD_LOGIC;
  signal Delay_out1_reg_n_75 : STD_LOGIC;
  signal Delay_out1_reg_n_76 : STD_LOGIC;
  signal Delay_out1_reg_n_77 : STD_LOGIC;
  signal Delay_out1_reg_n_78 : STD_LOGIC;
  signal Delay_out1_reg_n_79 : STD_LOGIC;
  signal Delay_out1_reg_n_80 : STD_LOGIC;
  signal Delay_out1_reg_n_81 : STD_LOGIC;
  signal Delay_out1_reg_n_82 : STD_LOGIC;
  signal Delay_out1_reg_n_83 : STD_LOGIC;
  signal Delay_out1_reg_n_84 : STD_LOGIC;
  signal Delay_out1_reg_n_85 : STD_LOGIC;
  signal Delay_out1_reg_n_86 : STD_LOGIC;
  signal Delay_out1_reg_n_87 : STD_LOGIC;
  signal Delay_out1_reg_n_88 : STD_LOGIC;
  signal Delay_out1_reg_n_89 : STD_LOGIC;
  signal Delay_out1_reg_n_90 : STD_LOGIC;
  signal Delay_out1_reg_n_91 : STD_LOGIC;
  signal Delay_out1_reg_n_92 : STD_LOGIC;
  signal Delay_out1_reg_n_93 : STD_LOGIC;
  signal Delay_out1_reg_n_94 : STD_LOGIC;
  signal Delay_out1_reg_n_95 : STD_LOGIC;
  signal Delay_out1_reg_n_96 : STD_LOGIC;
  signal Delay_out1_reg_n_97 : STD_LOGIC;
  signal Delay_out1_reg_n_98 : STD_LOGIC;
  signal Delay_out1_reg_n_99 : STD_LOGIC;
  signal NLW_Delay1_out1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay1_out1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_Delay1_out1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_Delay1_out1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_Delay1_out1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_Delay5_out1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay5_out1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_Delay5_out1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_Delay5_out1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_Delay5_out1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 33 );
  signal NLW_Delay5_out1_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_Delay6_out1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay6_out1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_Delay6_out1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_Delay6_out1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_Delay6_out1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 33 );
  signal NLW_Delay6_out1_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_Delay_out1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_Delay_out1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_Delay_out1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_Delay_out1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_Delay_out1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of Delay1_out1_reg : label is "{SYNTH-12 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of Delay5_out1_reg : label is "{SYNTH-12 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of Delay6_out1_reg : label is "{SYNTH-12 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of Delay_out1_reg : label is "{SYNTH-12 {cell *THIS*}}";
begin
Delay1_out1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => ar(15),
      A(28) => ar(15),
      A(27) => ar(15),
      A(26) => ar(15),
      A(25) => ar(15),
      A(24) => ar(15),
      A(23) => ar(15),
      A(22) => ar(15),
      A(21) => ar(15),
      A(20) => ar(15),
      A(19) => ar(15),
      A(18) => ar(15),
      A(17) => ar(15),
      A(16) => ar(15),
      A(15 downto 0) => ar(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_Delay1_out1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => bi(15),
      B(16) => bi(15),
      B(15 downto 0) => bi(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_Delay1_out1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_Delay1_out1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_Delay1_out1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => data_reg_axi_enable_1_1,
      CLK => IPCORE_CLK,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_Delay1_out1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_Delay1_out1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_Delay1_out1_reg_P_UNCONNECTED(47 downto 32),
      P(31) => Delay1_out1_reg_n_74,
      P(30) => Delay1_out1_reg_n_75,
      P(29) => Delay1_out1_reg_n_76,
      P(28) => Delay1_out1_reg_n_77,
      P(27) => Delay1_out1_reg_n_78,
      P(26) => Delay1_out1_reg_n_79,
      P(25) => Delay1_out1_reg_n_80,
      P(24) => Delay1_out1_reg_n_81,
      P(23) => Delay1_out1_reg_n_82,
      P(22) => Delay1_out1_reg_n_83,
      P(21) => Delay1_out1_reg_n_84,
      P(20) => Delay1_out1_reg_n_85,
      P(19) => Delay1_out1_reg_n_86,
      P(18) => Delay1_out1_reg_n_87,
      P(17) => Delay1_out1_reg_n_88,
      P(16) => Delay1_out1_reg_n_89,
      P(15) => Delay1_out1_reg_n_90,
      P(14) => Delay1_out1_reg_n_91,
      P(13) => Delay1_out1_reg_n_92,
      P(12) => Delay1_out1_reg_n_93,
      P(11) => Delay1_out1_reg_n_94,
      P(10) => Delay1_out1_reg_n_95,
      P(9) => Delay1_out1_reg_n_96,
      P(8) => Delay1_out1_reg_n_97,
      P(7) => Delay1_out1_reg_n_98,
      P(6) => Delay1_out1_reg_n_99,
      P(5) => Delay1_out1_reg_n_100,
      P(4) => Delay1_out1_reg_n_101,
      P(3) => Delay1_out1_reg_n_102,
      P(2) => Delay1_out1_reg_n_103,
      P(1) => Delay1_out1_reg_n_104,
      P(0) => Delay1_out1_reg_n_105,
      PATTERNBDETECT => NLW_Delay1_out1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_Delay1_out1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => Delay1_out1_reg_n_106,
      PCOUT(46) => Delay1_out1_reg_n_107,
      PCOUT(45) => Delay1_out1_reg_n_108,
      PCOUT(44) => Delay1_out1_reg_n_109,
      PCOUT(43) => Delay1_out1_reg_n_110,
      PCOUT(42) => Delay1_out1_reg_n_111,
      PCOUT(41) => Delay1_out1_reg_n_112,
      PCOUT(40) => Delay1_out1_reg_n_113,
      PCOUT(39) => Delay1_out1_reg_n_114,
      PCOUT(38) => Delay1_out1_reg_n_115,
      PCOUT(37) => Delay1_out1_reg_n_116,
      PCOUT(36) => Delay1_out1_reg_n_117,
      PCOUT(35) => Delay1_out1_reg_n_118,
      PCOUT(34) => Delay1_out1_reg_n_119,
      PCOUT(33) => Delay1_out1_reg_n_120,
      PCOUT(32) => Delay1_out1_reg_n_121,
      PCOUT(31) => Delay1_out1_reg_n_122,
      PCOUT(30) => Delay1_out1_reg_n_123,
      PCOUT(29) => Delay1_out1_reg_n_124,
      PCOUT(28) => Delay1_out1_reg_n_125,
      PCOUT(27) => Delay1_out1_reg_n_126,
      PCOUT(26) => Delay1_out1_reg_n_127,
      PCOUT(25) => Delay1_out1_reg_n_128,
      PCOUT(24) => Delay1_out1_reg_n_129,
      PCOUT(23) => Delay1_out1_reg_n_130,
      PCOUT(22) => Delay1_out1_reg_n_131,
      PCOUT(21) => Delay1_out1_reg_n_132,
      PCOUT(20) => Delay1_out1_reg_n_133,
      PCOUT(19) => Delay1_out1_reg_n_134,
      PCOUT(18) => Delay1_out1_reg_n_135,
      PCOUT(17) => Delay1_out1_reg_n_136,
      PCOUT(16) => Delay1_out1_reg_n_137,
      PCOUT(15) => Delay1_out1_reg_n_138,
      PCOUT(14) => Delay1_out1_reg_n_139,
      PCOUT(13) => Delay1_out1_reg_n_140,
      PCOUT(12) => Delay1_out1_reg_n_141,
      PCOUT(11) => Delay1_out1_reg_n_142,
      PCOUT(10) => Delay1_out1_reg_n_143,
      PCOUT(9) => Delay1_out1_reg_n_144,
      PCOUT(8) => Delay1_out1_reg_n_145,
      PCOUT(7) => Delay1_out1_reg_n_146,
      PCOUT(6) => Delay1_out1_reg_n_147,
      PCOUT(5) => Delay1_out1_reg_n_148,
      PCOUT(4) => Delay1_out1_reg_n_149,
      PCOUT(3) => Delay1_out1_reg_n_150,
      PCOUT(2) => Delay1_out1_reg_n_151,
      PCOUT(1) => Delay1_out1_reg_n_152,
      PCOUT(0) => Delay1_out1_reg_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => reset_out,
      UNDERFLOW => NLW_Delay1_out1_reg_UNDERFLOW_UNCONNECTED
    );
Delay5_out1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => br(15),
      A(28) => br(15),
      A(27) => br(15),
      A(26) => br(15),
      A(25) => br(15),
      A(24) => br(15),
      A(23) => br(15),
      A(22) => br(15),
      A(21) => br(15),
      A(20) => br(15),
      A(19) => br(15),
      A(18) => br(15),
      A(17) => br(15),
      A(16) => br(15),
      A(15 downto 0) => br(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_Delay5_out1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => ai(15),
      B(16) => ai(15),
      B(15 downto 0) => ai(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_Delay5_out1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_Delay5_out1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_Delay5_out1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => data_reg_axi_enable_1_1,
      CEP => data_reg_axi_enable_1_1,
      CLK => IPCORE_CLK,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_Delay5_out1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_Delay5_out1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 33) => NLW_Delay5_out1_reg_P_UNCONNECTED(47 downto 33),
      P(32 downto 0) => a_b_i(32 downto 0),
      PATTERNBDETECT => NLW_Delay5_out1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_Delay5_out1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => Delay1_out1_reg_n_106,
      PCIN(46) => Delay1_out1_reg_n_107,
      PCIN(45) => Delay1_out1_reg_n_108,
      PCIN(44) => Delay1_out1_reg_n_109,
      PCIN(43) => Delay1_out1_reg_n_110,
      PCIN(42) => Delay1_out1_reg_n_111,
      PCIN(41) => Delay1_out1_reg_n_112,
      PCIN(40) => Delay1_out1_reg_n_113,
      PCIN(39) => Delay1_out1_reg_n_114,
      PCIN(38) => Delay1_out1_reg_n_115,
      PCIN(37) => Delay1_out1_reg_n_116,
      PCIN(36) => Delay1_out1_reg_n_117,
      PCIN(35) => Delay1_out1_reg_n_118,
      PCIN(34) => Delay1_out1_reg_n_119,
      PCIN(33) => Delay1_out1_reg_n_120,
      PCIN(32) => Delay1_out1_reg_n_121,
      PCIN(31) => Delay1_out1_reg_n_122,
      PCIN(30) => Delay1_out1_reg_n_123,
      PCIN(29) => Delay1_out1_reg_n_124,
      PCIN(28) => Delay1_out1_reg_n_125,
      PCIN(27) => Delay1_out1_reg_n_126,
      PCIN(26) => Delay1_out1_reg_n_127,
      PCIN(25) => Delay1_out1_reg_n_128,
      PCIN(24) => Delay1_out1_reg_n_129,
      PCIN(23) => Delay1_out1_reg_n_130,
      PCIN(22) => Delay1_out1_reg_n_131,
      PCIN(21) => Delay1_out1_reg_n_132,
      PCIN(20) => Delay1_out1_reg_n_133,
      PCIN(19) => Delay1_out1_reg_n_134,
      PCIN(18) => Delay1_out1_reg_n_135,
      PCIN(17) => Delay1_out1_reg_n_136,
      PCIN(16) => Delay1_out1_reg_n_137,
      PCIN(15) => Delay1_out1_reg_n_138,
      PCIN(14) => Delay1_out1_reg_n_139,
      PCIN(13) => Delay1_out1_reg_n_140,
      PCIN(12) => Delay1_out1_reg_n_141,
      PCIN(11) => Delay1_out1_reg_n_142,
      PCIN(10) => Delay1_out1_reg_n_143,
      PCIN(9) => Delay1_out1_reg_n_144,
      PCIN(8) => Delay1_out1_reg_n_145,
      PCIN(7) => Delay1_out1_reg_n_146,
      PCIN(6) => Delay1_out1_reg_n_147,
      PCIN(5) => Delay1_out1_reg_n_148,
      PCIN(4) => Delay1_out1_reg_n_149,
      PCIN(3) => Delay1_out1_reg_n_150,
      PCIN(2) => Delay1_out1_reg_n_151,
      PCIN(1) => Delay1_out1_reg_n_152,
      PCIN(0) => Delay1_out1_reg_n_153,
      PCOUT(47 downto 0) => NLW_Delay5_out1_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => reset_out,
      RSTP => reset_out,
      UNDERFLOW => NLW_Delay5_out1_reg_UNDERFLOW_UNCONNECTED
    );
Delay6_out1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => ai(15),
      A(28) => ai(15),
      A(27) => ai(15),
      A(26) => ai(15),
      A(25) => ai(15),
      A(24) => ai(15),
      A(23) => ai(15),
      A(22) => ai(15),
      A(21) => ai(15),
      A(20) => ai(15),
      A(19) => ai(15),
      A(18) => ai(15),
      A(17) => ai(15),
      A(16) => ai(15),
      A(15 downto 0) => ai(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_Delay6_out1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0011",
      B(17) => bi(15),
      B(16) => bi(15),
      B(15 downto 0) => bi(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_Delay6_out1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_Delay6_out1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_Delay6_out1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => data_reg_axi_enable_1_1,
      CEP => data_reg_axi_enable_1_1,
      CLK => IPCORE_CLK,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_Delay6_out1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_Delay6_out1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 33) => NLW_Delay6_out1_reg_P_UNCONNECTED(47 downto 33),
      P(32 downto 0) => a_b_r(32 downto 0),
      PATTERNBDETECT => NLW_Delay6_out1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_Delay6_out1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => Delay_out1_reg_n_106,
      PCIN(46) => Delay_out1_reg_n_107,
      PCIN(45) => Delay_out1_reg_n_108,
      PCIN(44) => Delay_out1_reg_n_109,
      PCIN(43) => Delay_out1_reg_n_110,
      PCIN(42) => Delay_out1_reg_n_111,
      PCIN(41) => Delay_out1_reg_n_112,
      PCIN(40) => Delay_out1_reg_n_113,
      PCIN(39) => Delay_out1_reg_n_114,
      PCIN(38) => Delay_out1_reg_n_115,
      PCIN(37) => Delay_out1_reg_n_116,
      PCIN(36) => Delay_out1_reg_n_117,
      PCIN(35) => Delay_out1_reg_n_118,
      PCIN(34) => Delay_out1_reg_n_119,
      PCIN(33) => Delay_out1_reg_n_120,
      PCIN(32) => Delay_out1_reg_n_121,
      PCIN(31) => Delay_out1_reg_n_122,
      PCIN(30) => Delay_out1_reg_n_123,
      PCIN(29) => Delay_out1_reg_n_124,
      PCIN(28) => Delay_out1_reg_n_125,
      PCIN(27) => Delay_out1_reg_n_126,
      PCIN(26) => Delay_out1_reg_n_127,
      PCIN(25) => Delay_out1_reg_n_128,
      PCIN(24) => Delay_out1_reg_n_129,
      PCIN(23) => Delay_out1_reg_n_130,
      PCIN(22) => Delay_out1_reg_n_131,
      PCIN(21) => Delay_out1_reg_n_132,
      PCIN(20) => Delay_out1_reg_n_133,
      PCIN(19) => Delay_out1_reg_n_134,
      PCIN(18) => Delay_out1_reg_n_135,
      PCIN(17) => Delay_out1_reg_n_136,
      PCIN(16) => Delay_out1_reg_n_137,
      PCIN(15) => Delay_out1_reg_n_138,
      PCIN(14) => Delay_out1_reg_n_139,
      PCIN(13) => Delay_out1_reg_n_140,
      PCIN(12) => Delay_out1_reg_n_141,
      PCIN(11) => Delay_out1_reg_n_142,
      PCIN(10) => Delay_out1_reg_n_143,
      PCIN(9) => Delay_out1_reg_n_144,
      PCIN(8) => Delay_out1_reg_n_145,
      PCIN(7) => Delay_out1_reg_n_146,
      PCIN(6) => Delay_out1_reg_n_147,
      PCIN(5) => Delay_out1_reg_n_148,
      PCIN(4) => Delay_out1_reg_n_149,
      PCIN(3) => Delay_out1_reg_n_150,
      PCIN(2) => Delay_out1_reg_n_151,
      PCIN(1) => Delay_out1_reg_n_152,
      PCIN(0) => Delay_out1_reg_n_153,
      PCOUT(47 downto 0) => NLW_Delay6_out1_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => reset_out,
      RSTP => reset_out,
      UNDERFLOW => NLW_Delay6_out1_reg_UNDERFLOW_UNCONNECTED
    );
Delay_out1_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => ar(15),
      A(28) => ar(15),
      A(27) => ar(15),
      A(26) => ar(15),
      A(25) => ar(15),
      A(24) => ar(15),
      A(23) => ar(15),
      A(22) => ar(15),
      A(21) => ar(15),
      A(20) => ar(15),
      A(19) => ar(15),
      A(18) => ar(15),
      A(17) => ar(15),
      A(16) => ar(15),
      A(15 downto 0) => ar(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_Delay_out1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => br(15),
      B(16) => br(15),
      B(15 downto 0) => br(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_Delay_out1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_Delay_out1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_Delay_out1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => data_reg_axi_enable_1_1,
      CLK => IPCORE_CLK,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_Delay_out1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_Delay_out1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_Delay_out1_reg_P_UNCONNECTED(47 downto 32),
      P(31) => Delay_out1_reg_n_74,
      P(30) => Delay_out1_reg_n_75,
      P(29) => Delay_out1_reg_n_76,
      P(28) => Delay_out1_reg_n_77,
      P(27) => Delay_out1_reg_n_78,
      P(26) => Delay_out1_reg_n_79,
      P(25) => Delay_out1_reg_n_80,
      P(24) => Delay_out1_reg_n_81,
      P(23) => Delay_out1_reg_n_82,
      P(22) => Delay_out1_reg_n_83,
      P(21) => Delay_out1_reg_n_84,
      P(20) => Delay_out1_reg_n_85,
      P(19) => Delay_out1_reg_n_86,
      P(18) => Delay_out1_reg_n_87,
      P(17) => Delay_out1_reg_n_88,
      P(16) => Delay_out1_reg_n_89,
      P(15) => Delay_out1_reg_n_90,
      P(14) => Delay_out1_reg_n_91,
      P(13) => Delay_out1_reg_n_92,
      P(12) => Delay_out1_reg_n_93,
      P(11) => Delay_out1_reg_n_94,
      P(10) => Delay_out1_reg_n_95,
      P(9) => Delay_out1_reg_n_96,
      P(8) => Delay_out1_reg_n_97,
      P(7) => Delay_out1_reg_n_98,
      P(6) => Delay_out1_reg_n_99,
      P(5) => Delay_out1_reg_n_100,
      P(4) => Delay_out1_reg_n_101,
      P(3) => Delay_out1_reg_n_102,
      P(2) => Delay_out1_reg_n_103,
      P(1) => Delay_out1_reg_n_104,
      P(0) => Delay_out1_reg_n_105,
      PATTERNBDETECT => NLW_Delay_out1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_Delay_out1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => Delay_out1_reg_n_106,
      PCOUT(46) => Delay_out1_reg_n_107,
      PCOUT(45) => Delay_out1_reg_n_108,
      PCOUT(44) => Delay_out1_reg_n_109,
      PCOUT(43) => Delay_out1_reg_n_110,
      PCOUT(42) => Delay_out1_reg_n_111,
      PCOUT(41) => Delay_out1_reg_n_112,
      PCOUT(40) => Delay_out1_reg_n_113,
      PCOUT(39) => Delay_out1_reg_n_114,
      PCOUT(38) => Delay_out1_reg_n_115,
      PCOUT(37) => Delay_out1_reg_n_116,
      PCOUT(36) => Delay_out1_reg_n_117,
      PCOUT(35) => Delay_out1_reg_n_118,
      PCOUT(34) => Delay_out1_reg_n_119,
      PCOUT(33) => Delay_out1_reg_n_120,
      PCOUT(32) => Delay_out1_reg_n_121,
      PCOUT(31) => Delay_out1_reg_n_122,
      PCOUT(30) => Delay_out1_reg_n_123,
      PCOUT(29) => Delay_out1_reg_n_124,
      PCOUT(28) => Delay_out1_reg_n_125,
      PCOUT(27) => Delay_out1_reg_n_126,
      PCOUT(26) => Delay_out1_reg_n_127,
      PCOUT(25) => Delay_out1_reg_n_128,
      PCOUT(24) => Delay_out1_reg_n_129,
      PCOUT(23) => Delay_out1_reg_n_130,
      PCOUT(22) => Delay_out1_reg_n_131,
      PCOUT(21) => Delay_out1_reg_n_132,
      PCOUT(20) => Delay_out1_reg_n_133,
      PCOUT(19) => Delay_out1_reg_n_134,
      PCOUT(18) => Delay_out1_reg_n_135,
      PCOUT(17) => Delay_out1_reg_n_136,
      PCOUT(16) => Delay_out1_reg_n_137,
      PCOUT(15) => Delay_out1_reg_n_138,
      PCOUT(14) => Delay_out1_reg_n_139,
      PCOUT(13) => Delay_out1_reg_n_140,
      PCOUT(12) => Delay_out1_reg_n_141,
      PCOUT(11) => Delay_out1_reg_n_142,
      PCOUT(10) => Delay_out1_reg_n_143,
      PCOUT(9) => Delay_out1_reg_n_144,
      PCOUT(8) => Delay_out1_reg_n_145,
      PCOUT(7) => Delay_out1_reg_n_146,
      PCOUT(6) => Delay_out1_reg_n_147,
      PCOUT(5) => Delay_out1_reg_n_148,
      PCOUT(4) => Delay_out1_reg_n_149,
      PCOUT(3) => Delay_out1_reg_n_150,
      PCOUT(2) => Delay_out1_reg_n_151,
      PCOUT(1) => Delay_out1_reg_n_152,
      PCOUT(0) => Delay_out1_reg_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => reset_out,
      UNDERFLOW => NLW_Delay_out1_reg_UNDERFLOW_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_axi_lite is
  port (
    AXI4_Lite_RVALID : out STD_LOGIC;
    AXI4_Lite_RDATA : out STD_LOGIC_VECTOR ( 0 to 0 );
    soft_reset : out STD_LOGIC;
    data_reg_axi_enable_1_1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_AWREADY : out STD_LOGIC;
    AXI4_Lite_ARREADY : out STD_LOGIC;
    reset_in : out STD_LOGIC;
    AXI4_Lite_ACLK : in STD_LOGIC;
    \read_reg_ip_timestamp_reg[31]\ : in STD_LOGIC;
    AXI4_Lite_AWVALID : in STD_LOGIC;
    AXI4_Lite_WVALID : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 13 downto 0 );
    AXI4_Lite_ARVALID : in STD_LOGIC;
    AXI4_Lite_RREADY : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    AXI4_Lite_BREADY : in STD_LOGIC;
    AXI4_Lite_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI4_Lite_WDATA : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_out : in STD_LOGIC;
    AXI4_Lite_AWADDR : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_axi_lite : entity is "complex_m_ip_axi_lite";
end design_1_complex_m_ip_0_0_complex_m_ip_axi_lite;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_axi_lite is
  signal \^data_reg_axi_enable_1_1\ : STD_LOGIC;
  signal read_reg_ip_timestamp : STD_LOGIC_VECTOR ( 31 to 31 );
  signal u_complex_m_ip_addr_decoder_inst_n_2 : STD_LOGIC;
  signal u_complex_m_ip_addr_decoder_inst_n_3 : STD_LOGIC;
  signal u_complex_m_ip_axi_lite_module_inst_n_8 : STD_LOGIC;
begin
  data_reg_axi_enable_1_1 <= \^data_reg_axi_enable_1_1\;
u_complex_m_ip_addr_decoder_inst: entity work.design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder
     port map (
      AXI4_Lite_ACLK => AXI4_Lite_ACLK,
      AXI4_Lite_ARADDR(10 downto 0) => AXI4_Lite_ARADDR(12 downto 2),
      \AXI4_Lite_ARADDR[14]\ => u_complex_m_ip_addr_decoder_inst_n_3,
      AXI4_Lite_ARADDR_8_sp_1 => u_complex_m_ip_addr_decoder_inst_n_2,
      data_reg_axi_enable_1_1 => \^data_reg_axi_enable_1_1\,
      data_reg_axi_enable_1_1_reg_0 => u_complex_m_ip_axi_lite_module_inst_n_8,
      read_reg_ip_timestamp(0) => read_reg_ip_timestamp(31),
      \read_reg_ip_timestamp_reg[31]_0\ => \read_reg_ip_timestamp_reg[31]\
    );
u_complex_m_ip_axi_lite_module_inst: entity work.design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module
     port map (
      AXI4_Lite_ACLK => AXI4_Lite_ACLK,
      AXI4_Lite_ARADDR(2) => AXI4_Lite_ARADDR(13),
      AXI4_Lite_ARADDR(1 downto 0) => AXI4_Lite_ARADDR(1 downto 0),
      AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,
      AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,
      AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,
      AXI4_Lite_AWADDR(13 downto 0) => AXI4_Lite_AWADDR(13 downto 0),
      AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,
      AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,
      AXI4_Lite_BREADY => AXI4_Lite_BREADY,
      AXI4_Lite_RDATA(0) => AXI4_Lite_RDATA(0),
      AXI4_Lite_RREADY => AXI4_Lite_RREADY,
      AXI4_Lite_WDATA(0) => AXI4_Lite_WDATA(0),
      AXI4_Lite_WSTRB(3 downto 0) => AXI4_Lite_WSTRB(3 downto 0),
      AXI4_Lite_WVALID => AXI4_Lite_WVALID,
      FSM_sequential_axi_lite_rstate_reg_0 => AXI4_Lite_RVALID,
      IPCORE_RESETN => IPCORE_RESETN,
      Q(1 downto 0) => Q(1 downto 0),
      data_reg_axi_enable_1_1 => \^data_reg_axi_enable_1_1\,
      data_reg_axi_enable_1_1_reg => u_complex_m_ip_axi_lite_module_inst_n_8,
      data_reg_axi_enable_1_1_reg_0 => u_complex_m_ip_addr_decoder_inst_n_3,
      data_reg_axi_enable_1_1_reg_1 => u_complex_m_ip_addr_decoder_inst_n_2,
      read_reg_ip_timestamp(0) => read_reg_ip_timestamp(31),
      reset_in => reset_in,
      reset_out => reset_out,
      soft_reset => soft_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip_dut is
  port (
    a_b_r : out STD_LOGIC_VECTOR ( 32 downto 0 );
    a_b_i : out STD_LOGIC_VECTOR ( 32 downto 0 );
    data_reg_axi_enable_1_1 : in STD_LOGIC;
    IPCORE_CLK : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    br : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ar : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ai : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip_dut : entity is "complex_m_ip_dut";
end design_1_complex_m_ip_0_0_complex_m_ip_dut;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip_dut is
begin
u_complex_m_ip_src_complex_multiply: entity work.design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply
     port map (
      IPCORE_CLK => IPCORE_CLK,
      a_b_i(32 downto 0) => a_b_i(32 downto 0),
      a_b_r(32 downto 0) => a_b_r(32 downto 0),
      ai(15 downto 0) => ai(15 downto 0),
      ar(15 downto 0) => ar(15 downto 0),
      bi(15 downto 0) => bi(15 downto 0),
      br(15 downto 0) => br(15 downto 0),
      data_reg_axi_enable_1_1 => data_reg_axi_enable_1_1,
      reset_out => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0_complex_m_ip is
  port (
    AXI4_Lite_RVALID : out STD_LOGIC;
    AXI4_Lite_BVALID : out STD_LOGIC;
    AXI4_Lite_WREADY : out STD_LOGIC;
    a_b_r : out STD_LOGIC_VECTOR ( 32 downto 0 );
    a_b_i : out STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI4_Lite_AWREADY : out STD_LOGIC;
    AXI4_Lite_ARREADY : out STD_LOGIC;
    AXI4_Lite_RDATA : out STD_LOGIC_VECTOR ( 0 to 0 );
    AXI4_Lite_ACLK : in STD_LOGIC;
    AXI4_Lite_AWADDR : in STD_LOGIC_VECTOR ( 13 downto 0 );
    IPCORE_CLK : in STD_LOGIC;
    br : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ar : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ai : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_AWVALID : in STD_LOGIC;
    AXI4_Lite_WVALID : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 13 downto 0 );
    AXI4_Lite_ARVALID : in STD_LOGIC;
    AXI4_Lite_RREADY : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    AXI4_Lite_BREADY : in STD_LOGIC;
    AXI4_Lite_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI4_Lite_WDATA : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_complex_m_ip_0_0_complex_m_ip : entity is "complex_m_ip";
end design_1_complex_m_ip_0_0_complex_m_ip;

architecture STRUCTURE of design_1_complex_m_ip_0_0_complex_m_ip is
  signal data_reg_axi_enable_1_1 : STD_LOGIC;
  signal reset_in : STD_LOGIC;
  signal reset_out : STD_LOGIC;
  signal \u_complex_m_ip_axi_lite_module_inst/soft_reset\ : STD_LOGIC;
  signal u_complex_m_ip_reset_sync_inst_n_1 : STD_LOGIC;
begin
u_complex_m_ip_axi_lite_inst: entity work.design_1_complex_m_ip_0_0_complex_m_ip_axi_lite
     port map (
      AXI4_Lite_ACLK => AXI4_Lite_ACLK,
      AXI4_Lite_ARADDR(13 downto 0) => AXI4_Lite_ARADDR(13 downto 0),
      AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,
      AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,
      AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,
      AXI4_Lite_AWADDR(13 downto 0) => AXI4_Lite_AWADDR(13 downto 0),
      AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,
      AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,
      AXI4_Lite_BREADY => AXI4_Lite_BREADY,
      AXI4_Lite_RDATA(0) => AXI4_Lite_RDATA(0),
      AXI4_Lite_RREADY => AXI4_Lite_RREADY,
      AXI4_Lite_RVALID => AXI4_Lite_RVALID,
      AXI4_Lite_WDATA(0) => AXI4_Lite_WDATA(0),
      AXI4_Lite_WSTRB(3 downto 0) => AXI4_Lite_WSTRB(3 downto 0),
      AXI4_Lite_WVALID => AXI4_Lite_WVALID,
      IPCORE_RESETN => IPCORE_RESETN,
      Q(1) => AXI4_Lite_BVALID,
      Q(0) => AXI4_Lite_WREADY,
      data_reg_axi_enable_1_1 => data_reg_axi_enable_1_1,
      \read_reg_ip_timestamp_reg[31]\ => u_complex_m_ip_reset_sync_inst_n_1,
      reset_in => reset_in,
      reset_out => reset_out,
      soft_reset => \u_complex_m_ip_axi_lite_module_inst/soft_reset\
    );
u_complex_m_ip_dut_inst: entity work.design_1_complex_m_ip_0_0_complex_m_ip_dut
     port map (
      IPCORE_CLK => IPCORE_CLK,
      a_b_i(32 downto 0) => a_b_i(32 downto 0),
      a_b_r(32 downto 0) => a_b_r(32 downto 0),
      ai(15 downto 0) => ai(15 downto 0),
      ar(15 downto 0) => ar(15 downto 0),
      bi(15 downto 0) => bi(15 downto 0),
      br(15 downto 0) => br(15 downto 0),
      data_reg_axi_enable_1_1 => data_reg_axi_enable_1_1,
      reset_out => reset_out
    );
u_complex_m_ip_reset_sync_inst: entity work.design_1_complex_m_ip_0_0_complex_m_ip_reset_sync
     port map (
      AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,
      IPCORE_CLK => IPCORE_CLK,
      IPCORE_RESETN => IPCORE_RESETN,
      reset_in => reset_in,
      reset_out => reset_out,
      reset_out_reg_0 => u_complex_m_ip_reset_sync_inst_n_1,
      soft_reset => \u_complex_m_ip_axi_lite_module_inst/soft_reset\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_complex_m_ip_0_0 is
  port (
    IPCORE_CLK : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    ar : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ai : in STD_LOGIC_VECTOR ( 15 downto 0 );
    br : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_ACLK : in STD_LOGIC;
    AXI4_Lite_ARESETN : in STD_LOGIC;
    AXI4_Lite_AWADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_AWVALID : in STD_LOGIC;
    AXI4_Lite_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI4_Lite_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI4_Lite_WVALID : in STD_LOGIC;
    AXI4_Lite_BREADY : in STD_LOGIC;
    AXI4_Lite_ARADDR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI4_Lite_ARVALID : in STD_LOGIC;
    AXI4_Lite_RREADY : in STD_LOGIC;
    a_b_r : out STD_LOGIC_VECTOR ( 32 downto 0 );
    a_b_i : out STD_LOGIC_VECTOR ( 32 downto 0 );
    AXI4_Lite_AWREADY : out STD_LOGIC;
    AXI4_Lite_WREADY : out STD_LOGIC;
    AXI4_Lite_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_BVALID : out STD_LOGIC;
    AXI4_Lite_ARREADY : out STD_LOGIC;
    AXI4_Lite_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI4_Lite_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI4_Lite_RVALID : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_complex_m_ip_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_complex_m_ip_0_0 : entity is "design_1_complex_m_ip_0_0,complex_m_ip,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_complex_m_ip_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_complex_m_ip_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of design_1_complex_m_ip_0_0 : entity is "complex_m_ip,Vivado 2023.2";
end design_1_complex_m_ip_0_0;

architecture STRUCTURE of design_1_complex_m_ip_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^axi4_lite_rdata\ : STD_LOGIC_VECTOR ( 27 to 27 );
  attribute x_interface_info : string;
  attribute x_interface_info of AXI4_Lite_ACLK : signal is "xilinx.com:signal:clock:1.0 AXI4_Lite_signal_clock CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of AXI4_Lite_ACLK : signal is "XIL_INTERFACENAME AXI4_Lite_signal_clock, ASSOCIATED_BUSIF AXI4_Lite, ASSOCIATED_RESET AXI4_Lite_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of AXI4_Lite_ARESETN : signal is "xilinx.com:signal:reset:1.0 AXI4_Lite_signal_reset RST";
  attribute x_interface_parameter of AXI4_Lite_ARESETN : signal is "XIL_INTERFACENAME AXI4_Lite_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of AXI4_Lite_ARREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARREADY";
  attribute x_interface_info of AXI4_Lite_ARVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARVALID";
  attribute x_interface_info of AXI4_Lite_AWREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWREADY";
  attribute x_interface_info of AXI4_Lite_AWVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWVALID";
  attribute x_interface_info of AXI4_Lite_BREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BREADY";
  attribute x_interface_info of AXI4_Lite_BVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BVALID";
  attribute x_interface_info of AXI4_Lite_RREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RREADY";
  attribute x_interface_info of AXI4_Lite_RVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RVALID";
  attribute x_interface_info of AXI4_Lite_WREADY : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WREADY";
  attribute x_interface_info of AXI4_Lite_WVALID : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WVALID";
  attribute x_interface_info of IPCORE_CLK : signal is "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK";
  attribute x_interface_parameter of IPCORE_CLK : signal is "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of IPCORE_RESETN : signal is "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST";
  attribute x_interface_parameter of IPCORE_RESETN : signal is "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of AXI4_Lite_ARADDR : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite ARADDR";
  attribute x_interface_info of AXI4_Lite_AWADDR : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite AWADDR";
  attribute x_interface_parameter of AXI4_Lite_AWADDR : signal is "XIL_INTERFACENAME AXI4_Lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of AXI4_Lite_BRESP : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite BRESP";
  attribute x_interface_info of AXI4_Lite_RDATA : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RDATA";
  attribute x_interface_info of AXI4_Lite_RRESP : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite RRESP";
  attribute x_interface_info of AXI4_Lite_WDATA : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WDATA";
  attribute x_interface_info of AXI4_Lite_WSTRB : signal is "xilinx.com:interface:aximm:1.0 AXI4_Lite WSTRB";
begin
  AXI4_Lite_BRESP(1) <= \<const0>\;
  AXI4_Lite_BRESP(0) <= \<const0>\;
  AXI4_Lite_RDATA(31) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(30) <= \<const0>\;
  AXI4_Lite_RDATA(29) <= \<const0>\;
  AXI4_Lite_RDATA(28) <= \<const0>\;
  AXI4_Lite_RDATA(27) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(26) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(25) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(24) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(23) <= \<const0>\;
  AXI4_Lite_RDATA(22) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(21) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(20) <= \<const0>\;
  AXI4_Lite_RDATA(19) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(18) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(17) <= \<const0>\;
  AXI4_Lite_RDATA(16) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(15) <= \<const0>\;
  AXI4_Lite_RDATA(14) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(13) <= \<const0>\;
  AXI4_Lite_RDATA(12) <= \<const0>\;
  AXI4_Lite_RDATA(11) <= \<const0>\;
  AXI4_Lite_RDATA(10) <= \<const0>\;
  AXI4_Lite_RDATA(9) <= \<const0>\;
  AXI4_Lite_RDATA(8) <= \<const0>\;
  AXI4_Lite_RDATA(7) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(6) <= \<const0>\;
  AXI4_Lite_RDATA(5) <= \<const0>\;
  AXI4_Lite_RDATA(4) <= \<const0>\;
  AXI4_Lite_RDATA(3) <= \<const0>\;
  AXI4_Lite_RDATA(2) <= \<const0>\;
  AXI4_Lite_RDATA(1) <= \^axi4_lite_rdata\(27);
  AXI4_Lite_RDATA(0) <= \<const0>\;
  AXI4_Lite_RRESP(1) <= \<const0>\;
  AXI4_Lite_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_complex_m_ip_0_0_complex_m_ip
     port map (
      AXI4_Lite_ACLK => AXI4_Lite_ACLK,
      AXI4_Lite_ARADDR(13 downto 0) => AXI4_Lite_ARADDR(15 downto 2),
      AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,
      AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,
      AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,
      AXI4_Lite_AWADDR(13 downto 0) => AXI4_Lite_AWADDR(15 downto 2),
      AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,
      AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,
      AXI4_Lite_BREADY => AXI4_Lite_BREADY,
      AXI4_Lite_BVALID => AXI4_Lite_BVALID,
      AXI4_Lite_RDATA(0) => \^axi4_lite_rdata\(27),
      AXI4_Lite_RREADY => AXI4_Lite_RREADY,
      AXI4_Lite_RVALID => AXI4_Lite_RVALID,
      AXI4_Lite_WDATA(0) => AXI4_Lite_WDATA(0),
      AXI4_Lite_WREADY => AXI4_Lite_WREADY,
      AXI4_Lite_WSTRB(3 downto 0) => AXI4_Lite_WSTRB(3 downto 0),
      AXI4_Lite_WVALID => AXI4_Lite_WVALID,
      IPCORE_CLK => IPCORE_CLK,
      IPCORE_RESETN => IPCORE_RESETN,
      a_b_i(32 downto 0) => a_b_i(32 downto 0),
      a_b_r(32 downto 0) => a_b_r(32 downto 0),
      ai(15 downto 0) => ai(15 downto 0),
      ar(15 downto 0) => ar(15 downto 0),
      bi(15 downto 0) => bi(15 downto 0),
      br(15 downto 0) => br(15 downto 0)
    );
end STRUCTURE;
