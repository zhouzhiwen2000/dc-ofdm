// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_valid_to_ctrl_block.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_valid_to_ctrl_block
// Source Path: HDLTx/full_tx/header_full/h_gen/valid_to_ctrl
// Hierarchy Level: 3
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_valid_to_ctrl_block
          (clk,
           reset_x,
           enb,
           validIn,
           ctrlOut_start,
           ctrlOut_end,
           ctrlOut_valid);


  input   clk;
  input   reset_x;
  input   enb;
  input   validIn;
  output  ctrlOut_start;
  output  ctrlOut_end;
  output  ctrlOut_valid;


  reg  valid;
  reg  Delay2_out1;
  wire Logical_Operator1_out1;
  wire start;
  wire Logical_Operator3_out1;
  wire end_rsvd;
  wire Sample_Control_Bus_Creator_out1_start;
  wire Sample_Control_Bus_Creator_out1_end;
  wire Sample_Control_Bus_Creator_out1_valid;


  always @(posedge clk)
    begin : Delay1_process
      if (reset_x == 1'b1) begin
        valid <= 1'b0;
      end
      else begin
        if (enb) begin
          valid <= validIn;
        end
      end
    end



  always @(posedge clk)
    begin : Delay2_process
      if (reset_x == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= valid;
        end
      end
    end



  assign Logical_Operator1_out1 =  ~ Delay2_out1;



  assign start = valid & Logical_Operator1_out1;



  assign Logical_Operator3_out1 =  ~ validIn;



  assign end_rsvd = valid & Logical_Operator3_out1;



  tx_125_src_Sample_Control_Bus_Creator_block1 u_Sample_Control_Bus_Creator (.In1(start),
                                                                             .In2(end_rsvd),
                                                                             .In3(valid),
                                                                             .Out1_start(Sample_Control_Bus_Creator_out1_start),
                                                                             .Out1_end(Sample_Control_Bus_Creator_out1_end),
                                                                             .Out1_valid(Sample_Control_Bus_Creator_out1_valid)
                                                                             );

  assign ctrlOut_start = Sample_Control_Bus_Creator_out1_start;

  assign ctrlOut_end = Sample_Control_Bus_Creator_out1_end;

  assign ctrlOut_valid = Sample_Control_Bus_Creator_out1_valid;

endmodule  // tx_125_src_valid_to_ctrl_block
