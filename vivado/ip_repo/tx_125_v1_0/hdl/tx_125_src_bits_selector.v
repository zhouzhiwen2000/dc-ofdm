// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_bits_selector.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_bits_selector
// Source Path: HDLTx/full_tx/store_frame_in_ram/read_frame_from_ram/bits_selector
// Hierarchy Level: 3
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_bits_selector
          (clk,
           reset_x,
           enb_1_2_0,
           rd_addr,
           bits_per_subcarrier,
           bits_per_subcarrier_out);


  input   clk;
  input   reset_x;
  input   enb_1_2_0;
  input   [15:0] rd_addr;  // uint16
  input   [3:0] bits_per_subcarrier;  // ufix4
  output  [3:0] bits_per_subcarrier_out;  // ufix4


  wire Compare_To_Constant_out1;
  wire Compare_To_Constant1_out1;
  wire Compare_To_Constant2_out1;
  wire [1:0] one_hot_coder_out1;  // ufix2
  reg [1:0] Delay_out1;  // ufix2
  wire [3:0] Constant_out1;  // ufix4
  wire [3:0] Constant1_out1;  // ufix4
  wire [3:0] Constant2_out1;  // ufix4
  wire [3:0] Multiport_Switch_out1;  // ufix4


  tx_125_src_Compare_To_Constant_block u_Compare_To_Constant (.u(rd_addr),  // uint16
                                                              .y(Compare_To_Constant_out1)
                                                              );

  tx_125_src_Compare_To_Constant1 u_Compare_To_Constant1 (.u(rd_addr),  // uint16
                                                          .y(Compare_To_Constant1_out1)
                                                          );

  tx_125_src_Compare_To_Constant2 u_Compare_To_Constant2 (.u(rd_addr),  // uint16
                                                          .y(Compare_To_Constant2_out1)
                                                          );

  tx_125_src_one_hot_coder u_one_hot_coder (.preamble(Compare_To_Constant_out1),
                                            .channel(Compare_To_Constant1_out1),
                                            .header(Compare_To_Constant2_out1),
                                            .bits_per_subcarrier_select(one_hot_coder_out1)  // ufix2
                                            );

  always @(posedge clk)
    begin : Delay_process
      if (reset_x == 1'b1) begin
        Delay_out1 <= 2'b00;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= one_hot_coder_out1;
        end
      end
    end



  assign Constant_out1 = 4'b0001;



  assign Constant1_out1 = 4'b0001;



  assign Constant2_out1 = 4'b0010;



  assign Multiport_Switch_out1 = (Delay_out1 == 2'b00 ? Constant_out1 :
              (Delay_out1 == 2'b01 ? Constant1_out1 :
              (Delay_out1 == 2'b10 ? Constant2_out1 :
              bits_per_subcarrier)));



  assign bits_per_subcarrier_out = Multiport_Switch_out1;

endmodule  // tx_125_src_bits_selector
