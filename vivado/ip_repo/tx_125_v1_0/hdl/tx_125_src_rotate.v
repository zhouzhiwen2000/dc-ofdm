// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_rotate.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_rotate
// Source Path: HDLTx/full_tx/full_ofdm_modulator/enabled_qam_and_scrambler/constellation_scrambler/rotate
// Hierarchy Level: 4
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_rotate
          (s2,
           s1,
           data_in_re,
           data_in_im,
           data_out_re,
           data_out_im);


  input   s2;
  input   s1;
  input   signed [15:0] data_in_re;  // sfix16_En14
  input   signed [15:0] data_in_im;  // sfix16_En14
  output  signed [15:0] data_out_re;  // sfix16_En14
  output  signed [15:0] data_out_im;  // sfix16_En14


  wire [1:0] Bit_Concat_out1;  // ufix2
  wire signed [16:0] Unary_Minus1_cast;  // sfix17_En14
  wire signed [16:0] Unary_Minus1_cast_1;  // sfix17_En14
  wire signed [15:0] Unary_Minus1_out1;  // sfix16_En14
  wire signed [16:0] Unary_Minus_cast;  // sfix17_En14
  wire signed [16:0] Unary_Minus_cast_1;  // sfix17_En14
  wire signed [15:0] Unary_Minus_out1;  // sfix16_En14
  wire signed [16:0] Unary_Minus3_cast;  // sfix17_En14
  wire signed [16:0] Unary_Minus3_cast_1;  // sfix17_En14
  wire signed [15:0] Unary_Minus3_out1;  // sfix16_En14
  wire signed [16:0] Unary_Minus2_cast;  // sfix17_En14
  wire signed [16:0] Unary_Minus2_cast_1;  // sfix17_En14
  wire signed [15:0] Unary_Minus2_out1;  // sfix16_En14
  wire signed [15:0] Multiport_Switch_out1_re;  // sfix16_En14
  wire signed [15:0] Multiport_Switch_out1_im;  // sfix16_En14


  assign Bit_Concat_out1 = {s2, s1};



  assign Unary_Minus1_cast = {data_in_im[15], data_in_im};
  assign Unary_Minus1_cast_1 =  - (Unary_Minus1_cast);
  assign Unary_Minus1_out1 = Unary_Minus1_cast_1[15:0];



  assign Unary_Minus_cast = {data_in_re[15], data_in_re};
  assign Unary_Minus_cast_1 =  - (Unary_Minus_cast);
  assign Unary_Minus_out1 = Unary_Minus_cast_1[15:0];



  assign Unary_Minus3_cast = {data_in_im[15], data_in_im};
  assign Unary_Minus3_cast_1 =  - (Unary_Minus3_cast);
  assign Unary_Minus3_out1 = Unary_Minus3_cast_1[15:0];



  assign Unary_Minus2_cast = {data_in_re[15], data_in_re};
  assign Unary_Minus2_cast_1 =  - (Unary_Minus2_cast);
  assign Unary_Minus2_out1 = Unary_Minus2_cast_1[15:0];



  assign Multiport_Switch_out1_re = (Bit_Concat_out1 == 2'b00 ? data_in_re :
              (Bit_Concat_out1 == 2'b01 ? Unary_Minus1_out1 :
              (Bit_Concat_out1 == 2'b10 ? Unary_Minus_out1 :
              data_in_im)));
  assign Multiport_Switch_out1_im = (Bit_Concat_out1 == 2'b00 ? data_in_im :
              (Bit_Concat_out1 == 2'b01 ? data_in_re :
              (Bit_Concat_out1 == 2'b10 ? Unary_Minus3_out1 :
              Unary_Minus2_out1)));



  assign data_out_re = Multiport_Switch_out1_re;

  assign data_out_im = Multiport_Switch_out1_im;

endmodule  // tx_125_src_rotate

