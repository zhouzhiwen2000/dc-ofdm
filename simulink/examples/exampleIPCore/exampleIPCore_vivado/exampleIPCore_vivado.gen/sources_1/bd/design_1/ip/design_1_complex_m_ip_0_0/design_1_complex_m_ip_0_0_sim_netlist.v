// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Jun 30 18:40:10 2024
// Host        : cotti-machine running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/simulink/examples/exampleIPCore/exampleIPCore_vivado/exampleIPCore_vivado.gen/sources_1/bd/design_1/ip/design_1_complex_m_ip_0_0/design_1_complex_m_ip_0_0_sim_netlist.v
// Design      : design_1_complex_m_ip_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_complex_m_ip_0_0,complex_m_ip,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "complex_m_ip,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_1_complex_m_ip_0_0
   (IPCORE_CLK,
    IPCORE_RESETN,
    ar,
    ai,
    br,
    bi,
    AXI4_Lite_ACLK,
    AXI4_Lite_ARESETN,
    AXI4_Lite_AWADDR,
    AXI4_Lite_AWVALID,
    AXI4_Lite_WDATA,
    AXI4_Lite_WSTRB,
    AXI4_Lite_WVALID,
    AXI4_Lite_BREADY,
    AXI4_Lite_ARADDR,
    AXI4_Lite_ARVALID,
    AXI4_Lite_RREADY,
    a_b_r,
    a_b_i,
    AXI4_Lite_AWREADY,
    AXI4_Lite_WREADY,
    AXI4_Lite_BRESP,
    AXI4_Lite_BVALID,
    AXI4_Lite_ARREADY,
    AXI4_Lite_RDATA,
    AXI4_Lite_RRESP,
    AXI4_Lite_RVALID);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 IPCORE_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME IPCORE_CLK, ASSOCIATED_RESET IPCORE_RESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input IPCORE_CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 IPCORE_RESETN RST" *) (* x_interface_parameter = "XIL_INTERFACENAME IPCORE_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input IPCORE_RESETN;
  input [15:0]ar;
  input [15:0]ai;
  input [15:0]br;
  input [15:0]bi;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI4_Lite_signal_clock CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI4_Lite_signal_clock, ASSOCIATED_BUSIF AXI4_Lite, ASSOCIATED_RESET AXI4_Lite_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input AXI4_Lite_ACLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI4_Lite_signal_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI4_Lite_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI4_Lite_ARESETN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI4_Lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [15:0]AXI4_Lite_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWVALID" *) input AXI4_Lite_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite WDATA" *) input [31:0]AXI4_Lite_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite WSTRB" *) input [3:0]AXI4_Lite_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite WVALID" *) input AXI4_Lite_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite BREADY" *) input AXI4_Lite_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARADDR" *) input [15:0]AXI4_Lite_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARVALID" *) input AXI4_Lite_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite RREADY" *) input AXI4_Lite_RREADY;
  output [32:0]a_b_r;
  output [32:0]a_b_i;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite AWREADY" *) output AXI4_Lite_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite WREADY" *) output AXI4_Lite_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite BRESP" *) output [1:0]AXI4_Lite_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite BVALID" *) output AXI4_Lite_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite ARREADY" *) output AXI4_Lite_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite RDATA" *) output [31:0]AXI4_Lite_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite RRESP" *) output [1:0]AXI4_Lite_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 AXI4_Lite RVALID" *) output AXI4_Lite_RVALID;

  wire \<const0> ;
  wire AXI4_Lite_ACLK;
  wire [15:0]AXI4_Lite_ARADDR;
  wire AXI4_Lite_ARESETN;
  wire AXI4_Lite_ARREADY;
  wire AXI4_Lite_ARVALID;
  wire [15:0]AXI4_Lite_AWADDR;
  wire AXI4_Lite_AWREADY;
  wire AXI4_Lite_AWVALID;
  wire AXI4_Lite_BREADY;
  wire AXI4_Lite_BVALID;
  wire [27:27]\^AXI4_Lite_RDATA ;
  wire AXI4_Lite_RREADY;
  wire AXI4_Lite_RVALID;
  wire [31:0]AXI4_Lite_WDATA;
  wire AXI4_Lite_WREADY;
  wire [3:0]AXI4_Lite_WSTRB;
  wire AXI4_Lite_WVALID;
  wire IPCORE_CLK;
  wire IPCORE_RESETN;
  wire [32:0]a_b_i;
  wire [32:0]a_b_r;
  wire [15:0]ai;
  wire [15:0]ar;
  wire [15:0]bi;
  wire [15:0]br;

  assign AXI4_Lite_BRESP[1] = \<const0> ;
  assign AXI4_Lite_BRESP[0] = \<const0> ;
  assign AXI4_Lite_RDATA[31] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[30] = \<const0> ;
  assign AXI4_Lite_RDATA[29] = \<const0> ;
  assign AXI4_Lite_RDATA[28] = \<const0> ;
  assign AXI4_Lite_RDATA[27] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[26] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[25] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[24] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[23] = \<const0> ;
  assign AXI4_Lite_RDATA[22] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[21] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[20] = \<const0> ;
  assign AXI4_Lite_RDATA[19] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[18] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[17] = \<const0> ;
  assign AXI4_Lite_RDATA[16] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[15] = \<const0> ;
  assign AXI4_Lite_RDATA[14] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[13] = \<const0> ;
  assign AXI4_Lite_RDATA[12] = \<const0> ;
  assign AXI4_Lite_RDATA[11] = \<const0> ;
  assign AXI4_Lite_RDATA[10] = \<const0> ;
  assign AXI4_Lite_RDATA[9] = \<const0> ;
  assign AXI4_Lite_RDATA[8] = \<const0> ;
  assign AXI4_Lite_RDATA[7] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[6] = \<const0> ;
  assign AXI4_Lite_RDATA[5] = \<const0> ;
  assign AXI4_Lite_RDATA[4] = \<const0> ;
  assign AXI4_Lite_RDATA[3] = \<const0> ;
  assign AXI4_Lite_RDATA[2] = \<const0> ;
  assign AXI4_Lite_RDATA[1] = \^AXI4_Lite_RDATA [27];
  assign AXI4_Lite_RDATA[0] = \<const0> ;
  assign AXI4_Lite_RRESP[1] = \<const0> ;
  assign AXI4_Lite_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_complex_m_ip_0_0_complex_m_ip U0
       (.AXI4_Lite_ACLK(AXI4_Lite_ACLK),
        .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR[15:2]),
        .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),
        .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),
        .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),
        .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR[15:2]),
        .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),
        .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),
        .AXI4_Lite_BREADY(AXI4_Lite_BREADY),
        .AXI4_Lite_BVALID(AXI4_Lite_BVALID),
        .AXI4_Lite_RDATA(\^AXI4_Lite_RDATA ),
        .AXI4_Lite_RREADY(AXI4_Lite_RREADY),
        .AXI4_Lite_RVALID(AXI4_Lite_RVALID),
        .AXI4_Lite_WDATA(AXI4_Lite_WDATA[0]),
        .AXI4_Lite_WREADY(AXI4_Lite_WREADY),
        .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),
        .AXI4_Lite_WVALID(AXI4_Lite_WVALID),
        .IPCORE_CLK(IPCORE_CLK),
        .IPCORE_RESETN(IPCORE_RESETN),
        .a_b_i(a_b_i),
        .a_b_r(a_b_r),
        .ai(ai),
        .ar(ar),
        .bi(bi),
        .br(br));
endmodule

(* ORIG_REF_NAME = "complex_m_ip" *) 
module design_1_complex_m_ip_0_0_complex_m_ip
   (AXI4_Lite_RVALID,
    AXI4_Lite_BVALID,
    AXI4_Lite_WREADY,
    a_b_r,
    a_b_i,
    AXI4_Lite_AWREADY,
    AXI4_Lite_ARREADY,
    AXI4_Lite_RDATA,
    AXI4_Lite_ACLK,
    AXI4_Lite_AWADDR,
    IPCORE_CLK,
    br,
    ar,
    bi,
    ai,
    AXI4_Lite_AWVALID,
    AXI4_Lite_WVALID,
    AXI4_Lite_ARADDR,
    AXI4_Lite_ARVALID,
    AXI4_Lite_RREADY,
    AXI4_Lite_ARESETN,
    IPCORE_RESETN,
    AXI4_Lite_BREADY,
    AXI4_Lite_WSTRB,
    AXI4_Lite_WDATA);
  output AXI4_Lite_RVALID;
  output AXI4_Lite_BVALID;
  output AXI4_Lite_WREADY;
  output [32:0]a_b_r;
  output [32:0]a_b_i;
  output AXI4_Lite_AWREADY;
  output AXI4_Lite_ARREADY;
  output [0:0]AXI4_Lite_RDATA;
  input AXI4_Lite_ACLK;
  input [13:0]AXI4_Lite_AWADDR;
  input IPCORE_CLK;
  input [15:0]br;
  input [15:0]ar;
  input [15:0]bi;
  input [15:0]ai;
  input AXI4_Lite_AWVALID;
  input AXI4_Lite_WVALID;
  input [13:0]AXI4_Lite_ARADDR;
  input AXI4_Lite_ARVALID;
  input AXI4_Lite_RREADY;
  input AXI4_Lite_ARESETN;
  input IPCORE_RESETN;
  input AXI4_Lite_BREADY;
  input [3:0]AXI4_Lite_WSTRB;
  input [0:0]AXI4_Lite_WDATA;

  wire AXI4_Lite_ACLK;
  wire [13:0]AXI4_Lite_ARADDR;
  wire AXI4_Lite_ARESETN;
  wire AXI4_Lite_ARREADY;
  wire AXI4_Lite_ARVALID;
  wire [13:0]AXI4_Lite_AWADDR;
  wire AXI4_Lite_AWREADY;
  wire AXI4_Lite_AWVALID;
  wire AXI4_Lite_BREADY;
  wire AXI4_Lite_BVALID;
  wire [0:0]AXI4_Lite_RDATA;
  wire AXI4_Lite_RREADY;
  wire AXI4_Lite_RVALID;
  wire [0:0]AXI4_Lite_WDATA;
  wire AXI4_Lite_WREADY;
  wire [3:0]AXI4_Lite_WSTRB;
  wire AXI4_Lite_WVALID;
  wire IPCORE_CLK;
  wire IPCORE_RESETN;
  wire [32:0]a_b_i;
  wire [32:0]a_b_r;
  wire [15:0]ai;
  wire [15:0]ar;
  wire [15:0]bi;
  wire [15:0]br;
  wire data_reg_axi_enable_1_1;
  wire reset_in;
  wire reset_out;
  wire \u_complex_m_ip_axi_lite_module_inst/soft_reset ;
  wire u_complex_m_ip_reset_sync_inst_n_1;

  design_1_complex_m_ip_0_0_complex_m_ip_axi_lite u_complex_m_ip_axi_lite_inst
       (.AXI4_Lite_ACLK(AXI4_Lite_ACLK),
        .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR),
        .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),
        .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),
        .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),
        .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR),
        .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),
        .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),
        .AXI4_Lite_BREADY(AXI4_Lite_BREADY),
        .AXI4_Lite_RDATA(AXI4_Lite_RDATA),
        .AXI4_Lite_RREADY(AXI4_Lite_RREADY),
        .AXI4_Lite_RVALID(AXI4_Lite_RVALID),
        .AXI4_Lite_WDATA(AXI4_Lite_WDATA),
        .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),
        .AXI4_Lite_WVALID(AXI4_Lite_WVALID),
        .IPCORE_RESETN(IPCORE_RESETN),
        .Q({AXI4_Lite_BVALID,AXI4_Lite_WREADY}),
        .data_reg_axi_enable_1_1(data_reg_axi_enable_1_1),
        .\read_reg_ip_timestamp_reg[31] (u_complex_m_ip_reset_sync_inst_n_1),
        .reset_in(reset_in),
        .reset_out(reset_out),
        .soft_reset(\u_complex_m_ip_axi_lite_module_inst/soft_reset ));
  design_1_complex_m_ip_0_0_complex_m_ip_dut u_complex_m_ip_dut_inst
       (.IPCORE_CLK(IPCORE_CLK),
        .a_b_i(a_b_i),
        .a_b_r(a_b_r),
        .ai(ai),
        .ar(ar),
        .bi(bi),
        .br(br),
        .data_reg_axi_enable_1_1(data_reg_axi_enable_1_1),
        .reset_out(reset_out));
  design_1_complex_m_ip_0_0_complex_m_ip_reset_sync u_complex_m_ip_reset_sync_inst
       (.AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),
        .IPCORE_CLK(IPCORE_CLK),
        .IPCORE_RESETN(IPCORE_RESETN),
        .reset_in(reset_in),
        .reset_out(reset_out),
        .reset_out_reg_0(u_complex_m_ip_reset_sync_inst_n_1),
        .soft_reset(\u_complex_m_ip_axi_lite_module_inst/soft_reset ));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_addr_decoder" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder
   (read_reg_ip_timestamp,
    data_reg_axi_enable_1_1,
    AXI4_Lite_ARADDR_8_sp_1,
    \AXI4_Lite_ARADDR[14] ,
    \read_reg_ip_timestamp_reg[31]_0 ,
    AXI4_Lite_ACLK,
    data_reg_axi_enable_1_1_reg_0,
    AXI4_Lite_ARADDR);
  output [0:0]read_reg_ip_timestamp;
  output data_reg_axi_enable_1_1;
  output AXI4_Lite_ARADDR_8_sp_1;
  output \AXI4_Lite_ARADDR[14] ;
  input \read_reg_ip_timestamp_reg[31]_0 ;
  input AXI4_Lite_ACLK;
  input data_reg_axi_enable_1_1_reg_0;
  input [10:0]AXI4_Lite_ARADDR;

  wire AXI4_Lite_ACLK;
  wire [10:0]AXI4_Lite_ARADDR;
  wire \AXI4_Lite_ARADDR[14] ;
  wire AXI4_Lite_ARADDR_8_sn_1;
  wire data_reg_axi_enable_1_1;
  wire data_reg_axi_enable_1_1_reg_0;
  wire [0:0]read_reg_ip_timestamp;
  wire \read_reg_ip_timestamp_reg[31]_0 ;

  assign AXI4_Lite_ARADDR_8_sp_1 = AXI4_Lite_ARADDR_8_sn_1;
  LUT5 #(
    .INIT(32'h00000001)) 
    \AXI4_Lite_RDATA_tmp[31]_i_7 
       (.I0(AXI4_Lite_ARADDR[10]),
        .I1(AXI4_Lite_ARADDR[6]),
        .I2(AXI4_Lite_ARADDR[7]),
        .I3(AXI4_Lite_ARADDR[8]),
        .I4(AXI4_Lite_ARADDR[9]),
        .O(\AXI4_Lite_ARADDR[14] ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \AXI4_Lite_RDATA_tmp[31]_i_8 
       (.I0(AXI4_Lite_ARADDR[4]),
        .I1(AXI4_Lite_ARADDR[2]),
        .I2(AXI4_Lite_ARADDR[1]),
        .I3(AXI4_Lite_ARADDR[3]),
        .I4(AXI4_Lite_ARADDR[0]),
        .I5(AXI4_Lite_ARADDR[5]),
        .O(AXI4_Lite_ARADDR_8_sn_1));
  FDRE data_reg_axi_enable_1_1_reg
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(data_reg_axi_enable_1_1_reg_0),
        .Q(data_reg_axi_enable_1_1),
        .R(1'b0));
  FDRE \read_reg_ip_timestamp_reg[31] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(\read_reg_ip_timestamp_reg[31]_0 ),
        .Q(read_reg_ip_timestamp),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_axi_lite" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_axi_lite
   (AXI4_Lite_RVALID,
    AXI4_Lite_RDATA,
    soft_reset,
    data_reg_axi_enable_1_1,
    Q,
    AXI4_Lite_AWREADY,
    AXI4_Lite_ARREADY,
    reset_in,
    AXI4_Lite_ACLK,
    \read_reg_ip_timestamp_reg[31] ,
    AXI4_Lite_AWVALID,
    AXI4_Lite_WVALID,
    AXI4_Lite_ARADDR,
    AXI4_Lite_ARVALID,
    AXI4_Lite_RREADY,
    AXI4_Lite_ARESETN,
    IPCORE_RESETN,
    AXI4_Lite_BREADY,
    AXI4_Lite_WSTRB,
    AXI4_Lite_WDATA,
    reset_out,
    AXI4_Lite_AWADDR);
  output AXI4_Lite_RVALID;
  output [0:0]AXI4_Lite_RDATA;
  output soft_reset;
  output data_reg_axi_enable_1_1;
  output [1:0]Q;
  output AXI4_Lite_AWREADY;
  output AXI4_Lite_ARREADY;
  output reset_in;
  input AXI4_Lite_ACLK;
  input \read_reg_ip_timestamp_reg[31] ;
  input AXI4_Lite_AWVALID;
  input AXI4_Lite_WVALID;
  input [13:0]AXI4_Lite_ARADDR;
  input AXI4_Lite_ARVALID;
  input AXI4_Lite_RREADY;
  input AXI4_Lite_ARESETN;
  input IPCORE_RESETN;
  input AXI4_Lite_BREADY;
  input [3:0]AXI4_Lite_WSTRB;
  input [0:0]AXI4_Lite_WDATA;
  input reset_out;
  input [13:0]AXI4_Lite_AWADDR;

  wire AXI4_Lite_ACLK;
  wire [13:0]AXI4_Lite_ARADDR;
  wire AXI4_Lite_ARESETN;
  wire AXI4_Lite_ARREADY;
  wire AXI4_Lite_ARVALID;
  wire [13:0]AXI4_Lite_AWADDR;
  wire AXI4_Lite_AWREADY;
  wire AXI4_Lite_AWVALID;
  wire AXI4_Lite_BREADY;
  wire [0:0]AXI4_Lite_RDATA;
  wire AXI4_Lite_RREADY;
  wire AXI4_Lite_RVALID;
  wire [0:0]AXI4_Lite_WDATA;
  wire [3:0]AXI4_Lite_WSTRB;
  wire AXI4_Lite_WVALID;
  wire IPCORE_RESETN;
  wire [1:0]Q;
  wire data_reg_axi_enable_1_1;
  wire [31:31]read_reg_ip_timestamp;
  wire \read_reg_ip_timestamp_reg[31] ;
  wire reset_in;
  wire reset_out;
  wire soft_reset;
  wire u_complex_m_ip_addr_decoder_inst_n_2;
  wire u_complex_m_ip_addr_decoder_inst_n_3;
  wire u_complex_m_ip_axi_lite_module_inst_n_8;

  design_1_complex_m_ip_0_0_complex_m_ip_addr_decoder u_complex_m_ip_addr_decoder_inst
       (.AXI4_Lite_ACLK(AXI4_Lite_ACLK),
        .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR[12:2]),
        .\AXI4_Lite_ARADDR[14] (u_complex_m_ip_addr_decoder_inst_n_3),
        .AXI4_Lite_ARADDR_8_sp_1(u_complex_m_ip_addr_decoder_inst_n_2),
        .data_reg_axi_enable_1_1(data_reg_axi_enable_1_1),
        .data_reg_axi_enable_1_1_reg_0(u_complex_m_ip_axi_lite_module_inst_n_8),
        .read_reg_ip_timestamp(read_reg_ip_timestamp),
        .\read_reg_ip_timestamp_reg[31]_0 (\read_reg_ip_timestamp_reg[31] ));
  design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module u_complex_m_ip_axi_lite_module_inst
       (.AXI4_Lite_ACLK(AXI4_Lite_ACLK),
        .AXI4_Lite_ARADDR({AXI4_Lite_ARADDR[13],AXI4_Lite_ARADDR[1:0]}),
        .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),
        .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),
        .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),
        .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR),
        .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),
        .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),
        .AXI4_Lite_BREADY(AXI4_Lite_BREADY),
        .AXI4_Lite_RDATA(AXI4_Lite_RDATA),
        .AXI4_Lite_RREADY(AXI4_Lite_RREADY),
        .AXI4_Lite_WDATA(AXI4_Lite_WDATA),
        .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),
        .AXI4_Lite_WVALID(AXI4_Lite_WVALID),
        .FSM_sequential_axi_lite_rstate_reg_0(AXI4_Lite_RVALID),
        .IPCORE_RESETN(IPCORE_RESETN),
        .Q(Q),
        .data_reg_axi_enable_1_1(data_reg_axi_enable_1_1),
        .data_reg_axi_enable_1_1_reg(u_complex_m_ip_axi_lite_module_inst_n_8),
        .data_reg_axi_enable_1_1_reg_0(u_complex_m_ip_addr_decoder_inst_n_3),
        .data_reg_axi_enable_1_1_reg_1(u_complex_m_ip_addr_decoder_inst_n_2),
        .read_reg_ip_timestamp(read_reg_ip_timestamp),
        .reset_in(reset_in),
        .reset_out(reset_out),
        .soft_reset(soft_reset));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_axi_lite_module" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_axi_lite_module
   (FSM_sequential_axi_lite_rstate_reg_0,
    AXI4_Lite_RDATA,
    soft_reset,
    Q,
    AXI4_Lite_AWREADY,
    AXI4_Lite_ARREADY,
    reset_in,
    data_reg_axi_enable_1_1_reg,
    AXI4_Lite_ACLK,
    AXI4_Lite_AWVALID,
    AXI4_Lite_WVALID,
    data_reg_axi_enable_1_1_reg_0,
    data_reg_axi_enable_1_1_reg_1,
    AXI4_Lite_ARADDR,
    AXI4_Lite_ARVALID,
    AXI4_Lite_RREADY,
    AXI4_Lite_ARESETN,
    IPCORE_RESETN,
    AXI4_Lite_BREADY,
    AXI4_Lite_WSTRB,
    read_reg_ip_timestamp,
    AXI4_Lite_WDATA,
    data_reg_axi_enable_1_1,
    reset_out,
    AXI4_Lite_AWADDR);
  output FSM_sequential_axi_lite_rstate_reg_0;
  output [0:0]AXI4_Lite_RDATA;
  output soft_reset;
  output [1:0]Q;
  output AXI4_Lite_AWREADY;
  output AXI4_Lite_ARREADY;
  output reset_in;
  output data_reg_axi_enable_1_1_reg;
  input AXI4_Lite_ACLK;
  input AXI4_Lite_AWVALID;
  input AXI4_Lite_WVALID;
  input data_reg_axi_enable_1_1_reg_0;
  input data_reg_axi_enable_1_1_reg_1;
  input [2:0]AXI4_Lite_ARADDR;
  input AXI4_Lite_ARVALID;
  input AXI4_Lite_RREADY;
  input AXI4_Lite_ARESETN;
  input IPCORE_RESETN;
  input AXI4_Lite_BREADY;
  input [3:0]AXI4_Lite_WSTRB;
  input [0:0]read_reg_ip_timestamp;
  input [0:0]AXI4_Lite_WDATA;
  input data_reg_axi_enable_1_1;
  input reset_out;
  input [13:0]AXI4_Lite_AWADDR;

  wire AXI4_Lite_ACLK;
  wire [2:0]AXI4_Lite_ARADDR;
  wire AXI4_Lite_ARESETN;
  wire AXI4_Lite_ARREADY;
  wire AXI4_Lite_ARVALID;
  wire [13:0]AXI4_Lite_AWADDR;
  wire AXI4_Lite_AWREADY;
  wire AXI4_Lite_AWVALID;
  wire AXI4_Lite_BREADY;
  wire [0:0]AXI4_Lite_RDATA;
  wire \AXI4_Lite_RDATA_tmp[31]_i_1_n_0 ;
  wire \AXI4_Lite_RDATA_tmp[31]_i_2_n_0 ;
  wire \AXI4_Lite_RDATA_tmp[31]_i_3_n_0 ;
  wire \AXI4_Lite_RDATA_tmp[31]_i_4_n_0 ;
  wire \AXI4_Lite_RDATA_tmp[31]_i_6_n_0 ;
  wire AXI4_Lite_RREADY;
  wire [0:0]AXI4_Lite_WDATA;
  wire [3:0]AXI4_Lite_WSTRB;
  wire AXI4_Lite_WVALID;
  wire \FSM_onehot_axi_lite_wstate_reg_n_0_[0] ;
  wire FSM_sequential_axi_lite_rstate_reg_0;
  wire IPCORE_RESETN;
  wire [1:0]Q;
  wire aw_transfer;
  wire axi_lite_rstate_next;
  wire [2:0]axi_lite_wstate_next;
  wire data_reg_axi_enable_1_1;
  wire data_reg_axi_enable_1_1_i_2_n_0;
  wire data_reg_axi_enable_1_1_i_3_n_0;
  wire data_reg_axi_enable_1_1_i_4_n_0;
  wire data_reg_axi_enable_1_1_reg;
  wire data_reg_axi_enable_1_1_reg_0;
  wire data_reg_axi_enable_1_1_reg_1;
  wire [0:0]read_reg_ip_timestamp;
  wire reset_in;
  wire reset_out;
  wire reset_x;
  wire [13:0]sel0;
  wire soft_reset;
  wire soft_reset_i_1_n_0;
  wire soft_reset_i_2_n_0;
  wire soft_reset_i_3_n_0;
  wire soft_reset_i_4_n_0;
  wire top_rd_enb;
  wire top_wr_enb;
  wire w_transfer_and_wstrb;
  wire \wdata[0]_i_1_n_0 ;
  wire \wdata_reg_n_0_[0] ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    AXI4_Lite_ARREADY_INST_0
       (.I0(FSM_sequential_axi_lite_rstate_reg_0),
        .I1(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I2(AXI4_Lite_AWVALID),
        .O(AXI4_Lite_ARREADY));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    AXI4_Lite_AWREADY_INST_0
       (.I0(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I1(FSM_sequential_axi_lite_rstate_reg_0),
        .O(AXI4_Lite_AWREADY));
  LUT6 #(
    .INIT(64'h0200FFFF02000000)) 
    \AXI4_Lite_RDATA_tmp[31]_i_1 
       (.I0(\AXI4_Lite_RDATA_tmp[31]_i_2_n_0 ),
        .I1(\AXI4_Lite_RDATA_tmp[31]_i_3_n_0 ),
        .I2(\AXI4_Lite_RDATA_tmp[31]_i_4_n_0 ),
        .I3(read_reg_ip_timestamp),
        .I4(top_rd_enb),
        .I5(AXI4_Lite_RDATA),
        .O(\AXI4_Lite_RDATA_tmp[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \AXI4_Lite_RDATA_tmp[31]_i_2 
       (.I0(\AXI4_Lite_RDATA_tmp[31]_i_6_n_0 ),
        .I1(data_reg_axi_enable_1_1_reg_0),
        .I2(soft_reset_i_2_n_0),
        .I3(top_rd_enb),
        .I4(data_reg_axi_enable_1_1_reg_1),
        .O(\AXI4_Lite_RDATA_tmp[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCCAFFFAF)) 
    \AXI4_Lite_RDATA_tmp[31]_i_3 
       (.I0(sel0[13]),
        .I1(AXI4_Lite_ARADDR[2]),
        .I2(sel0[1]),
        .I3(top_rd_enb),
        .I4(AXI4_Lite_ARADDR[1]),
        .O(\AXI4_Lite_RDATA_tmp[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \AXI4_Lite_RDATA_tmp[31]_i_4 
       (.I0(AXI4_Lite_ARADDR[0]),
        .I1(AXI4_Lite_ARVALID),
        .I2(FSM_sequential_axi_lite_rstate_reg_0),
        .I3(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I4(AXI4_Lite_AWVALID),
        .I5(sel0[0]),
        .O(\AXI4_Lite_RDATA_tmp[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \AXI4_Lite_RDATA_tmp[31]_i_5 
       (.I0(AXI4_Lite_ARVALID),
        .I1(FSM_sequential_axi_lite_rstate_reg_0),
        .I2(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I3(AXI4_Lite_AWVALID),
        .O(top_rd_enb));
  LUT5 #(
    .INIT(32'h00000001)) 
    \AXI4_Lite_RDATA_tmp[31]_i_6 
       (.I0(sel0[9]),
        .I1(sel0[10]),
        .I2(sel0[11]),
        .I3(sel0[12]),
        .I4(sel0[8]),
        .O(\AXI4_Lite_RDATA_tmp[31]_i_6_n_0 ));
  FDRE \AXI4_Lite_RDATA_tmp_reg[31] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(\AXI4_Lite_RDATA_tmp[31]_i_1_n_0 ),
        .Q(AXI4_Lite_RDATA),
        .R(reset_x));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF8F8888)) 
    \FSM_onehot_axi_lite_wstate[0]_i_1 
       (.I0(Q[1]),
        .I1(AXI4_Lite_BREADY),
        .I2(AXI4_Lite_AWVALID),
        .I3(FSM_sequential_axi_lite_rstate_reg_0),
        .I4(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .O(axi_lite_wstate_next[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_axi_lite_wstate[1]_i_1 
       (.I0(AXI4_Lite_ARESETN),
        .O(reset_x));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40FF4040)) 
    \FSM_onehot_axi_lite_wstate[1]_i_2 
       (.I0(FSM_sequential_axi_lite_rstate_reg_0),
        .I1(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I2(AXI4_Lite_AWVALID),
        .I3(AXI4_Lite_WVALID),
        .I4(Q[0]),
        .O(axi_lite_wstate_next[1]));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_axi_lite_wstate[2]_i_1 
       (.I0(Q[0]),
        .I1(AXI4_Lite_WVALID),
        .I2(AXI4_Lite_BREADY),
        .I3(Q[1]),
        .O(axi_lite_wstate_next[2]));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:100,iSTATE1:001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_axi_lite_wstate_reg[0] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(axi_lite_wstate_next[0]),
        .Q(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .S(reset_x));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:100,iSTATE1:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_axi_lite_wstate_reg[1] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(axi_lite_wstate_next[1]),
        .Q(Q[0]),
        .R(reset_x));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:100,iSTATE1:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_axi_lite_wstate_reg[2] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(axi_lite_wstate_next[2]),
        .Q(Q[1]),
        .R(reset_x));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00FF4040)) 
    FSM_sequential_axi_lite_rstate_i_1
       (.I0(AXI4_Lite_AWVALID),
        .I1(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I2(AXI4_Lite_ARVALID),
        .I3(AXI4_Lite_RREADY),
        .I4(FSM_sequential_axi_lite_rstate_reg_0),
        .O(axi_lite_rstate_next));
  (* FSM_ENCODED_STATES = "iSTATE:0,iSTATE0:1" *) 
  FDRE FSM_sequential_axi_lite_rstate_reg
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(axi_lite_rstate_next),
        .Q(FSM_sequential_axi_lite_rstate_reg_0),
        .R(reset_x));
  LUT5 #(
    .INIT(32'hFFFFBA8A)) 
    data_reg_axi_enable_1_1_i_1
       (.I0(data_reg_axi_enable_1_1),
        .I1(data_reg_axi_enable_1_1_i_2_n_0),
        .I2(\AXI4_Lite_RDATA_tmp[31]_i_2_n_0 ),
        .I3(\wdata_reg_n_0_[0] ),
        .I4(reset_out),
        .O(data_reg_axi_enable_1_1_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF47FFFFFF)) 
    data_reg_axi_enable_1_1_i_2
       (.I0(AXI4_Lite_ARADDR[0]),
        .I1(top_rd_enb),
        .I2(sel0[0]),
        .I3(top_wr_enb),
        .I4(data_reg_axi_enable_1_1_i_3_n_0),
        .I5(data_reg_axi_enable_1_1_i_4_n_0),
        .O(data_reg_axi_enable_1_1_i_2_n_0));
  LUT6 #(
    .INIT(64'h00000400FFFFF7FF)) 
    data_reg_axi_enable_1_1_i_3
       (.I0(AXI4_Lite_ARADDR[1]),
        .I1(AXI4_Lite_ARVALID),
        .I2(FSM_sequential_axi_lite_rstate_reg_0),
        .I3(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I4(AXI4_Lite_AWVALID),
        .I5(sel0[1]),
        .O(data_reg_axi_enable_1_1_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    data_reg_axi_enable_1_1_i_4
       (.I0(AXI4_Lite_ARADDR[2]),
        .I1(AXI4_Lite_ARVALID),
        .I2(FSM_sequential_axi_lite_rstate_reg_0),
        .I3(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I4(AXI4_Lite_AWVALID),
        .I5(sel0[13]),
        .O(data_reg_axi_enable_1_1_i_4_n_0));
  LUT3 #(
    .INIT(8'hBF)) 
    reset_pipe_i_1
       (.I0(soft_reset),
        .I1(AXI4_Lite_ARESETN),
        .I2(IPCORE_RESETN),
        .O(reset_in));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    soft_reset_i_1
       (.I0(soft_reset_i_2_n_0),
        .I1(soft_reset_i_3_n_0),
        .I2(soft_reset_i_4_n_0),
        .I3(sel0[11]),
        .I4(sel0[10]),
        .I5(sel0[9]),
        .O(soft_reset_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    soft_reset_i_2
       (.I0(sel0[6]),
        .I1(sel0[5]),
        .I2(sel0[2]),
        .I3(sel0[7]),
        .I4(sel0[3]),
        .I5(sel0[4]),
        .O(soft_reset_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    soft_reset_i_3
       (.I0(top_wr_enb),
        .I1(sel0[1]),
        .I2(\wdata_reg_n_0_[0] ),
        .I3(sel0[0]),
        .O(soft_reset_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    soft_reset_i_4
       (.I0(sel0[12]),
        .I1(sel0[8]),
        .I2(AXI4_Lite_ARESETN),
        .I3(sel0[13]),
        .O(soft_reset_i_4_n_0));
  FDRE soft_reset_reg
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(soft_reset_i_1_n_0),
        .Q(soft_reset),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \waddr[15]_i_1 
       (.I0(AXI4_Lite_AWVALID),
        .I1(\FSM_onehot_axi_lite_wstate_reg_n_0_[0] ),
        .I2(FSM_sequential_axi_lite_rstate_reg_0),
        .O(aw_transfer));
  FDRE \waddr_reg[10] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[8]),
        .Q(sel0[8]),
        .R(reset_x));
  FDRE \waddr_reg[11] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[9]),
        .Q(sel0[9]),
        .R(reset_x));
  FDRE \waddr_reg[12] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[10]),
        .Q(sel0[10]),
        .R(reset_x));
  FDRE \waddr_reg[13] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[11]),
        .Q(sel0[11]),
        .R(reset_x));
  FDRE \waddr_reg[14] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[12]),
        .Q(sel0[12]),
        .R(reset_x));
  FDRE \waddr_reg[15] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[13]),
        .Q(sel0[13]),
        .R(reset_x));
  FDRE \waddr_reg[2] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[0]),
        .Q(sel0[0]),
        .R(reset_x));
  FDRE \waddr_reg[3] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[1]),
        .Q(sel0[1]),
        .R(reset_x));
  FDRE \waddr_reg[4] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[2]),
        .Q(sel0[2]),
        .R(reset_x));
  FDRE \waddr_reg[5] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[3]),
        .Q(sel0[3]),
        .R(reset_x));
  FDRE \waddr_reg[6] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[4]),
        .Q(sel0[4]),
        .R(reset_x));
  FDRE \waddr_reg[7] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[5]),
        .Q(sel0[5]),
        .R(reset_x));
  FDRE \waddr_reg[8] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[6]),
        .Q(sel0[6]),
        .R(reset_x));
  FDRE \waddr_reg[9] 
       (.C(AXI4_Lite_ACLK),
        .CE(aw_transfer),
        .D(AXI4_Lite_AWADDR[7]),
        .Q(sel0[7]),
        .R(reset_x));
  LUT4 #(
    .INIT(16'hBF80)) 
    \wdata[0]_i_1 
       (.I0(AXI4_Lite_WDATA),
        .I1(AXI4_Lite_WVALID),
        .I2(Q[0]),
        .I3(\wdata_reg_n_0_[0] ),
        .O(\wdata[0]_i_1_n_0 ));
  FDRE \wdata_reg[0] 
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(\wdata[0]_i_1_n_0 ),
        .Q(\wdata_reg_n_0_[0] ),
        .R(reset_x));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    wr_enb_1_i_1
       (.I0(Q[0]),
        .I1(AXI4_Lite_WVALID),
        .I2(AXI4_Lite_WSTRB[2]),
        .I3(AXI4_Lite_WSTRB[1]),
        .I4(AXI4_Lite_WSTRB[0]),
        .I5(AXI4_Lite_WSTRB[3]),
        .O(w_transfer_and_wstrb));
  FDRE wr_enb_1_reg
       (.C(AXI4_Lite_ACLK),
        .CE(1'b1),
        .D(w_transfer_and_wstrb),
        .Q(top_wr_enb),
        .R(reset_x));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_dut" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_dut
   (a_b_r,
    a_b_i,
    data_reg_axi_enable_1_1,
    IPCORE_CLK,
    reset_out,
    br,
    ar,
    bi,
    ai);
  output [32:0]a_b_r;
  output [32:0]a_b_i;
  input data_reg_axi_enable_1_1;
  input IPCORE_CLK;
  input reset_out;
  input [15:0]br;
  input [15:0]ar;
  input [15:0]bi;
  input [15:0]ai;

  wire IPCORE_CLK;
  wire [32:0]a_b_i;
  wire [32:0]a_b_r;
  wire [15:0]ai;
  wire [15:0]ar;
  wire [15:0]bi;
  wire [15:0]br;
  wire data_reg_axi_enable_1_1;
  wire reset_out;

  design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply u_complex_m_ip_src_complex_multiply
       (.IPCORE_CLK(IPCORE_CLK),
        .a_b_i(a_b_i),
        .a_b_r(a_b_r),
        .ai(ai),
        .ar(ar),
        .bi(bi),
        .br(br),
        .data_reg_axi_enable_1_1(data_reg_axi_enable_1_1),
        .reset_out(reset_out));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_reset_sync" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_reset_sync
   (reset_out,
    reset_out_reg_0,
    reset_in,
    IPCORE_CLK,
    IPCORE_RESETN,
    AXI4_Lite_ARESETN,
    soft_reset);
  output reset_out;
  output reset_out_reg_0;
  input reset_in;
  input IPCORE_CLK;
  input IPCORE_RESETN;
  input AXI4_Lite_ARESETN;
  input soft_reset;

  wire AXI4_Lite_ARESETN;
  wire IPCORE_CLK;
  wire IPCORE_RESETN;
  wire reset_in;
  wire reset_out;
  wire reset_out_i_1_n_0;
  wire reset_out_reg_0;
  wire reset_pipe;
  wire soft_reset;

  LUT1 #(
    .INIT(2'h1)) 
    \read_reg_ip_timestamp[31]_i_1 
       (.I0(reset_out),
        .O(reset_out_reg_0));
  LUT4 #(
    .INIT(16'hFFBF)) 
    reset_out_i_1
       (.I0(reset_pipe),
        .I1(IPCORE_RESETN),
        .I2(AXI4_Lite_ARESETN),
        .I3(soft_reset),
        .O(reset_out_i_1_n_0));
  FDRE reset_out_reg
       (.C(IPCORE_CLK),
        .CE(1'b1),
        .D(reset_out_i_1_n_0),
        .Q(reset_out),
        .R(1'b0));
  FDRE reset_pipe_reg
       (.C(IPCORE_CLK),
        .CE(1'b1),
        .D(reset_in),
        .Q(reset_pipe),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "complex_m_ip_src_complex_multiply" *) 
module design_1_complex_m_ip_0_0_complex_m_ip_src_complex_multiply
   (a_b_r,
    a_b_i,
    data_reg_axi_enable_1_1,
    IPCORE_CLK,
    reset_out,
    br,
    ar,
    bi,
    ai);
  output [32:0]a_b_r;
  output [32:0]a_b_i;
  input data_reg_axi_enable_1_1;
  input IPCORE_CLK;
  input reset_out;
  input [15:0]br;
  input [15:0]ar;
  input [15:0]bi;
  input [15:0]ai;

  wire Delay1_out1_reg_n_100;
  wire Delay1_out1_reg_n_101;
  wire Delay1_out1_reg_n_102;
  wire Delay1_out1_reg_n_103;
  wire Delay1_out1_reg_n_104;
  wire Delay1_out1_reg_n_105;
  wire Delay1_out1_reg_n_106;
  wire Delay1_out1_reg_n_107;
  wire Delay1_out1_reg_n_108;
  wire Delay1_out1_reg_n_109;
  wire Delay1_out1_reg_n_110;
  wire Delay1_out1_reg_n_111;
  wire Delay1_out1_reg_n_112;
  wire Delay1_out1_reg_n_113;
  wire Delay1_out1_reg_n_114;
  wire Delay1_out1_reg_n_115;
  wire Delay1_out1_reg_n_116;
  wire Delay1_out1_reg_n_117;
  wire Delay1_out1_reg_n_118;
  wire Delay1_out1_reg_n_119;
  wire Delay1_out1_reg_n_120;
  wire Delay1_out1_reg_n_121;
  wire Delay1_out1_reg_n_122;
  wire Delay1_out1_reg_n_123;
  wire Delay1_out1_reg_n_124;
  wire Delay1_out1_reg_n_125;
  wire Delay1_out1_reg_n_126;
  wire Delay1_out1_reg_n_127;
  wire Delay1_out1_reg_n_128;
  wire Delay1_out1_reg_n_129;
  wire Delay1_out1_reg_n_130;
  wire Delay1_out1_reg_n_131;
  wire Delay1_out1_reg_n_132;
  wire Delay1_out1_reg_n_133;
  wire Delay1_out1_reg_n_134;
  wire Delay1_out1_reg_n_135;
  wire Delay1_out1_reg_n_136;
  wire Delay1_out1_reg_n_137;
  wire Delay1_out1_reg_n_138;
  wire Delay1_out1_reg_n_139;
  wire Delay1_out1_reg_n_140;
  wire Delay1_out1_reg_n_141;
  wire Delay1_out1_reg_n_142;
  wire Delay1_out1_reg_n_143;
  wire Delay1_out1_reg_n_144;
  wire Delay1_out1_reg_n_145;
  wire Delay1_out1_reg_n_146;
  wire Delay1_out1_reg_n_147;
  wire Delay1_out1_reg_n_148;
  wire Delay1_out1_reg_n_149;
  wire Delay1_out1_reg_n_150;
  wire Delay1_out1_reg_n_151;
  wire Delay1_out1_reg_n_152;
  wire Delay1_out1_reg_n_153;
  wire Delay1_out1_reg_n_74;
  wire Delay1_out1_reg_n_75;
  wire Delay1_out1_reg_n_76;
  wire Delay1_out1_reg_n_77;
  wire Delay1_out1_reg_n_78;
  wire Delay1_out1_reg_n_79;
  wire Delay1_out1_reg_n_80;
  wire Delay1_out1_reg_n_81;
  wire Delay1_out1_reg_n_82;
  wire Delay1_out1_reg_n_83;
  wire Delay1_out1_reg_n_84;
  wire Delay1_out1_reg_n_85;
  wire Delay1_out1_reg_n_86;
  wire Delay1_out1_reg_n_87;
  wire Delay1_out1_reg_n_88;
  wire Delay1_out1_reg_n_89;
  wire Delay1_out1_reg_n_90;
  wire Delay1_out1_reg_n_91;
  wire Delay1_out1_reg_n_92;
  wire Delay1_out1_reg_n_93;
  wire Delay1_out1_reg_n_94;
  wire Delay1_out1_reg_n_95;
  wire Delay1_out1_reg_n_96;
  wire Delay1_out1_reg_n_97;
  wire Delay1_out1_reg_n_98;
  wire Delay1_out1_reg_n_99;
  wire Delay_out1_reg_n_100;
  wire Delay_out1_reg_n_101;
  wire Delay_out1_reg_n_102;
  wire Delay_out1_reg_n_103;
  wire Delay_out1_reg_n_104;
  wire Delay_out1_reg_n_105;
  wire Delay_out1_reg_n_106;
  wire Delay_out1_reg_n_107;
  wire Delay_out1_reg_n_108;
  wire Delay_out1_reg_n_109;
  wire Delay_out1_reg_n_110;
  wire Delay_out1_reg_n_111;
  wire Delay_out1_reg_n_112;
  wire Delay_out1_reg_n_113;
  wire Delay_out1_reg_n_114;
  wire Delay_out1_reg_n_115;
  wire Delay_out1_reg_n_116;
  wire Delay_out1_reg_n_117;
  wire Delay_out1_reg_n_118;
  wire Delay_out1_reg_n_119;
  wire Delay_out1_reg_n_120;
  wire Delay_out1_reg_n_121;
  wire Delay_out1_reg_n_122;
  wire Delay_out1_reg_n_123;
  wire Delay_out1_reg_n_124;
  wire Delay_out1_reg_n_125;
  wire Delay_out1_reg_n_126;
  wire Delay_out1_reg_n_127;
  wire Delay_out1_reg_n_128;
  wire Delay_out1_reg_n_129;
  wire Delay_out1_reg_n_130;
  wire Delay_out1_reg_n_131;
  wire Delay_out1_reg_n_132;
  wire Delay_out1_reg_n_133;
  wire Delay_out1_reg_n_134;
  wire Delay_out1_reg_n_135;
  wire Delay_out1_reg_n_136;
  wire Delay_out1_reg_n_137;
  wire Delay_out1_reg_n_138;
  wire Delay_out1_reg_n_139;
  wire Delay_out1_reg_n_140;
  wire Delay_out1_reg_n_141;
  wire Delay_out1_reg_n_142;
  wire Delay_out1_reg_n_143;
  wire Delay_out1_reg_n_144;
  wire Delay_out1_reg_n_145;
  wire Delay_out1_reg_n_146;
  wire Delay_out1_reg_n_147;
  wire Delay_out1_reg_n_148;
  wire Delay_out1_reg_n_149;
  wire Delay_out1_reg_n_150;
  wire Delay_out1_reg_n_151;
  wire Delay_out1_reg_n_152;
  wire Delay_out1_reg_n_153;
  wire Delay_out1_reg_n_74;
  wire Delay_out1_reg_n_75;
  wire Delay_out1_reg_n_76;
  wire Delay_out1_reg_n_77;
  wire Delay_out1_reg_n_78;
  wire Delay_out1_reg_n_79;
  wire Delay_out1_reg_n_80;
  wire Delay_out1_reg_n_81;
  wire Delay_out1_reg_n_82;
  wire Delay_out1_reg_n_83;
  wire Delay_out1_reg_n_84;
  wire Delay_out1_reg_n_85;
  wire Delay_out1_reg_n_86;
  wire Delay_out1_reg_n_87;
  wire Delay_out1_reg_n_88;
  wire Delay_out1_reg_n_89;
  wire Delay_out1_reg_n_90;
  wire Delay_out1_reg_n_91;
  wire Delay_out1_reg_n_92;
  wire Delay_out1_reg_n_93;
  wire Delay_out1_reg_n_94;
  wire Delay_out1_reg_n_95;
  wire Delay_out1_reg_n_96;
  wire Delay_out1_reg_n_97;
  wire Delay_out1_reg_n_98;
  wire Delay_out1_reg_n_99;
  wire IPCORE_CLK;
  wire [32:0]a_b_i;
  wire [32:0]a_b_r;
  wire [15:0]ai;
  wire [15:0]ar;
  wire [15:0]bi;
  wire [15:0]br;
  wire data_reg_axi_enable_1_1;
  wire reset_out;
  wire NLW_Delay1_out1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_Delay1_out1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_Delay1_out1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_Delay1_out1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_Delay1_out1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_Delay1_out1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_Delay1_out1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_Delay1_out1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_Delay1_out1_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_Delay1_out1_reg_P_UNCONNECTED;
  wire NLW_Delay5_out1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_Delay5_out1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_Delay5_out1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_Delay5_out1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_Delay5_out1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_Delay5_out1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_Delay5_out1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_Delay5_out1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_Delay5_out1_reg_CARRYOUT_UNCONNECTED;
  wire [47:33]NLW_Delay5_out1_reg_P_UNCONNECTED;
  wire [47:0]NLW_Delay5_out1_reg_PCOUT_UNCONNECTED;
  wire NLW_Delay6_out1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_Delay6_out1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_Delay6_out1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_Delay6_out1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_Delay6_out1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_Delay6_out1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_Delay6_out1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_Delay6_out1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_Delay6_out1_reg_CARRYOUT_UNCONNECTED;
  wire [47:33]NLW_Delay6_out1_reg_P_UNCONNECTED;
  wire [47:0]NLW_Delay6_out1_reg_PCOUT_UNCONNECTED;
  wire NLW_Delay_out1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_Delay_out1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_Delay_out1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_Delay_out1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_Delay_out1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_Delay_out1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_Delay_out1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_Delay_out1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_Delay_out1_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_Delay_out1_reg_P_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    Delay1_out1_reg
       (.A({ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_Delay1_out1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({bi[15],bi[15],bi}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_Delay1_out1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_Delay1_out1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_Delay1_out1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(data_reg_axi_enable_1_1),
        .CLK(IPCORE_CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_Delay1_out1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_Delay1_out1_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_Delay1_out1_reg_P_UNCONNECTED[47:32],Delay1_out1_reg_n_74,Delay1_out1_reg_n_75,Delay1_out1_reg_n_76,Delay1_out1_reg_n_77,Delay1_out1_reg_n_78,Delay1_out1_reg_n_79,Delay1_out1_reg_n_80,Delay1_out1_reg_n_81,Delay1_out1_reg_n_82,Delay1_out1_reg_n_83,Delay1_out1_reg_n_84,Delay1_out1_reg_n_85,Delay1_out1_reg_n_86,Delay1_out1_reg_n_87,Delay1_out1_reg_n_88,Delay1_out1_reg_n_89,Delay1_out1_reg_n_90,Delay1_out1_reg_n_91,Delay1_out1_reg_n_92,Delay1_out1_reg_n_93,Delay1_out1_reg_n_94,Delay1_out1_reg_n_95,Delay1_out1_reg_n_96,Delay1_out1_reg_n_97,Delay1_out1_reg_n_98,Delay1_out1_reg_n_99,Delay1_out1_reg_n_100,Delay1_out1_reg_n_101,Delay1_out1_reg_n_102,Delay1_out1_reg_n_103,Delay1_out1_reg_n_104,Delay1_out1_reg_n_105}),
        .PATTERNBDETECT(NLW_Delay1_out1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_Delay1_out1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({Delay1_out1_reg_n_106,Delay1_out1_reg_n_107,Delay1_out1_reg_n_108,Delay1_out1_reg_n_109,Delay1_out1_reg_n_110,Delay1_out1_reg_n_111,Delay1_out1_reg_n_112,Delay1_out1_reg_n_113,Delay1_out1_reg_n_114,Delay1_out1_reg_n_115,Delay1_out1_reg_n_116,Delay1_out1_reg_n_117,Delay1_out1_reg_n_118,Delay1_out1_reg_n_119,Delay1_out1_reg_n_120,Delay1_out1_reg_n_121,Delay1_out1_reg_n_122,Delay1_out1_reg_n_123,Delay1_out1_reg_n_124,Delay1_out1_reg_n_125,Delay1_out1_reg_n_126,Delay1_out1_reg_n_127,Delay1_out1_reg_n_128,Delay1_out1_reg_n_129,Delay1_out1_reg_n_130,Delay1_out1_reg_n_131,Delay1_out1_reg_n_132,Delay1_out1_reg_n_133,Delay1_out1_reg_n_134,Delay1_out1_reg_n_135,Delay1_out1_reg_n_136,Delay1_out1_reg_n_137,Delay1_out1_reg_n_138,Delay1_out1_reg_n_139,Delay1_out1_reg_n_140,Delay1_out1_reg_n_141,Delay1_out1_reg_n_142,Delay1_out1_reg_n_143,Delay1_out1_reg_n_144,Delay1_out1_reg_n_145,Delay1_out1_reg_n_146,Delay1_out1_reg_n_147,Delay1_out1_reg_n_148,Delay1_out1_reg_n_149,Delay1_out1_reg_n_150,Delay1_out1_reg_n_151,Delay1_out1_reg_n_152,Delay1_out1_reg_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(reset_out),
        .UNDERFLOW(NLW_Delay1_out1_reg_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    Delay5_out1_reg
       (.A({br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br[15],br}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_Delay5_out1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({ai[15],ai[15],ai}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_Delay5_out1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_Delay5_out1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_Delay5_out1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(data_reg_axi_enable_1_1),
        .CEP(data_reg_axi_enable_1_1),
        .CLK(IPCORE_CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_Delay5_out1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_Delay5_out1_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_Delay5_out1_reg_P_UNCONNECTED[47:33],a_b_i}),
        .PATTERNBDETECT(NLW_Delay5_out1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_Delay5_out1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({Delay1_out1_reg_n_106,Delay1_out1_reg_n_107,Delay1_out1_reg_n_108,Delay1_out1_reg_n_109,Delay1_out1_reg_n_110,Delay1_out1_reg_n_111,Delay1_out1_reg_n_112,Delay1_out1_reg_n_113,Delay1_out1_reg_n_114,Delay1_out1_reg_n_115,Delay1_out1_reg_n_116,Delay1_out1_reg_n_117,Delay1_out1_reg_n_118,Delay1_out1_reg_n_119,Delay1_out1_reg_n_120,Delay1_out1_reg_n_121,Delay1_out1_reg_n_122,Delay1_out1_reg_n_123,Delay1_out1_reg_n_124,Delay1_out1_reg_n_125,Delay1_out1_reg_n_126,Delay1_out1_reg_n_127,Delay1_out1_reg_n_128,Delay1_out1_reg_n_129,Delay1_out1_reg_n_130,Delay1_out1_reg_n_131,Delay1_out1_reg_n_132,Delay1_out1_reg_n_133,Delay1_out1_reg_n_134,Delay1_out1_reg_n_135,Delay1_out1_reg_n_136,Delay1_out1_reg_n_137,Delay1_out1_reg_n_138,Delay1_out1_reg_n_139,Delay1_out1_reg_n_140,Delay1_out1_reg_n_141,Delay1_out1_reg_n_142,Delay1_out1_reg_n_143,Delay1_out1_reg_n_144,Delay1_out1_reg_n_145,Delay1_out1_reg_n_146,Delay1_out1_reg_n_147,Delay1_out1_reg_n_148,Delay1_out1_reg_n_149,Delay1_out1_reg_n_150,Delay1_out1_reg_n_151,Delay1_out1_reg_n_152,Delay1_out1_reg_n_153}),
        .PCOUT(NLW_Delay5_out1_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(reset_out),
        .RSTP(reset_out),
        .UNDERFLOW(NLW_Delay5_out1_reg_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    Delay6_out1_reg
       (.A({ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai[15],ai}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_Delay6_out1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b1,1'b1}),
        .B({bi[15],bi[15],bi}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_Delay6_out1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_Delay6_out1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_Delay6_out1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(data_reg_axi_enable_1_1),
        .CEP(data_reg_axi_enable_1_1),
        .CLK(IPCORE_CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_Delay6_out1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_Delay6_out1_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_Delay6_out1_reg_P_UNCONNECTED[47:33],a_b_r}),
        .PATTERNBDETECT(NLW_Delay6_out1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_Delay6_out1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({Delay_out1_reg_n_106,Delay_out1_reg_n_107,Delay_out1_reg_n_108,Delay_out1_reg_n_109,Delay_out1_reg_n_110,Delay_out1_reg_n_111,Delay_out1_reg_n_112,Delay_out1_reg_n_113,Delay_out1_reg_n_114,Delay_out1_reg_n_115,Delay_out1_reg_n_116,Delay_out1_reg_n_117,Delay_out1_reg_n_118,Delay_out1_reg_n_119,Delay_out1_reg_n_120,Delay_out1_reg_n_121,Delay_out1_reg_n_122,Delay_out1_reg_n_123,Delay_out1_reg_n_124,Delay_out1_reg_n_125,Delay_out1_reg_n_126,Delay_out1_reg_n_127,Delay_out1_reg_n_128,Delay_out1_reg_n_129,Delay_out1_reg_n_130,Delay_out1_reg_n_131,Delay_out1_reg_n_132,Delay_out1_reg_n_133,Delay_out1_reg_n_134,Delay_out1_reg_n_135,Delay_out1_reg_n_136,Delay_out1_reg_n_137,Delay_out1_reg_n_138,Delay_out1_reg_n_139,Delay_out1_reg_n_140,Delay_out1_reg_n_141,Delay_out1_reg_n_142,Delay_out1_reg_n_143,Delay_out1_reg_n_144,Delay_out1_reg_n_145,Delay_out1_reg_n_146,Delay_out1_reg_n_147,Delay_out1_reg_n_148,Delay_out1_reg_n_149,Delay_out1_reg_n_150,Delay_out1_reg_n_151,Delay_out1_reg_n_152,Delay_out1_reg_n_153}),
        .PCOUT(NLW_Delay6_out1_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(reset_out),
        .RSTP(reset_out),
        .UNDERFLOW(NLW_Delay6_out1_reg_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    Delay_out1_reg
       (.A({ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar[15],ar}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_Delay_out1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({br[15],br[15],br}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_Delay_out1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_Delay_out1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_Delay_out1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(data_reg_axi_enable_1_1),
        .CLK(IPCORE_CLK),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_Delay_out1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_Delay_out1_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_Delay_out1_reg_P_UNCONNECTED[47:32],Delay_out1_reg_n_74,Delay_out1_reg_n_75,Delay_out1_reg_n_76,Delay_out1_reg_n_77,Delay_out1_reg_n_78,Delay_out1_reg_n_79,Delay_out1_reg_n_80,Delay_out1_reg_n_81,Delay_out1_reg_n_82,Delay_out1_reg_n_83,Delay_out1_reg_n_84,Delay_out1_reg_n_85,Delay_out1_reg_n_86,Delay_out1_reg_n_87,Delay_out1_reg_n_88,Delay_out1_reg_n_89,Delay_out1_reg_n_90,Delay_out1_reg_n_91,Delay_out1_reg_n_92,Delay_out1_reg_n_93,Delay_out1_reg_n_94,Delay_out1_reg_n_95,Delay_out1_reg_n_96,Delay_out1_reg_n_97,Delay_out1_reg_n_98,Delay_out1_reg_n_99,Delay_out1_reg_n_100,Delay_out1_reg_n_101,Delay_out1_reg_n_102,Delay_out1_reg_n_103,Delay_out1_reg_n_104,Delay_out1_reg_n_105}),
        .PATTERNBDETECT(NLW_Delay_out1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_Delay_out1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({Delay_out1_reg_n_106,Delay_out1_reg_n_107,Delay_out1_reg_n_108,Delay_out1_reg_n_109,Delay_out1_reg_n_110,Delay_out1_reg_n_111,Delay_out1_reg_n_112,Delay_out1_reg_n_113,Delay_out1_reg_n_114,Delay_out1_reg_n_115,Delay_out1_reg_n_116,Delay_out1_reg_n_117,Delay_out1_reg_n_118,Delay_out1_reg_n_119,Delay_out1_reg_n_120,Delay_out1_reg_n_121,Delay_out1_reg_n_122,Delay_out1_reg_n_123,Delay_out1_reg_n_124,Delay_out1_reg_n_125,Delay_out1_reg_n_126,Delay_out1_reg_n_127,Delay_out1_reg_n_128,Delay_out1_reg_n_129,Delay_out1_reg_n_130,Delay_out1_reg_n_131,Delay_out1_reg_n_132,Delay_out1_reg_n_133,Delay_out1_reg_n_134,Delay_out1_reg_n_135,Delay_out1_reg_n_136,Delay_out1_reg_n_137,Delay_out1_reg_n_138,Delay_out1_reg_n_139,Delay_out1_reg_n_140,Delay_out1_reg_n_141,Delay_out1_reg_n_142,Delay_out1_reg_n_143,Delay_out1_reg_n_144,Delay_out1_reg_n_145,Delay_out1_reg_n_146,Delay_out1_reg_n_147,Delay_out1_reg_n_148,Delay_out1_reg_n_149,Delay_out1_reg_n_150,Delay_out1_reg_n_151,Delay_out1_reg_n_152,Delay_out1_reg_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(reset_out),
        .UNDERFLOW(NLW_Delay_out1_reg_UNDERFLOW_UNCONNECTED));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
