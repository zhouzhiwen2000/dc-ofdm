// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_CRCGenControl.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_CRCGenControl
// Source Path: HDLTx/full_tx/header_full/h_crc/General CRC Generator HDL Optimized/CRCGenControl
// Hierarchy Level: 4
// Model version: 4.114
// 
// CRC Generator Control Signals Generation
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_CRCGenControl
          (clk,
           reset_x,
           enb,
           startIn,
           endIn,
           validIn,
           startOut,
           processMsg,
           padZero,
           outputCRC,
           endOut,
           validOut,
           counter,
           counter_outputCRC);


  input   clk;
  input   reset_x;
  input   enb;
  input   startIn;  // ufix1
  input   endIn;  // ufix1
  input   validIn;  // ufix1
  output  startOut;  // ufix1
  output  processMsg;  // ufix1
  output  padZero;  // ufix1
  output  outputCRC;  // ufix1
  output  endOut;  // ufix1
  output  validOut;  // ufix1
  output  [3:0] counter;  // ufix4
  output  [3:0] counter_outputCRC;  // ufix4


  reg  deofin;  // ufix1
  reg [3:0] cnt3out;  // ufix4
  wire processzero_short;  // ufix1
  wire cnt3enb;  // ufix1
  wire tsysenb_short;  // ufix1
  wire tprocessMsg;  // ufix1
  wire sysenb_short;  // ufix1
  wire ready;  // ufix1
  wire cnt1enb;  // ufix1
  reg [3:0] cnt2out;  // ufix4
  wire cnt2rst;  // ufix1
  wire cnt2enb;  // ufix1
  wire compare_cmpOut;
  wire [3:0] cnt2fstout;  // ufix4
  wire cnt2fstout_is_not0;
  wire cnt1rst;  // ufix1
  reg  cnt1out;  // ufix1
  reg  dtprocessMsg;  // ufix1
  wire rdtprocessMsg;  // ufix1
  wire startout_1;  // ufix1
  reg  [15:0] sof_delay_register_reg;  // ufix1 [16]
  wire processzero;  // ufix1
  wire tpadZero;  // ufix1
  wire cnt4rst;  // ufix1
  wire cnt5enb;  // ufix1
  reg [3:0] cnt5out;  // ufix4
  reg [3:0] cnt4out;  // ufix4
  reg  dteofout;  // ufix1
  wire rdteofout;  // ufix1
  wire sysenb;  // ufix1
  reg  udvalidin;  // ufix1
  wire rcnt3enb;  // ufix1
  wire clearvalidin;  // ufix1
  wire tvalidout;  // ufix1
  reg  [15:0] tvalidout_delay_register_reg;  // ufix1 [16]
  wire dvalidout;  // ufix1


  always @(posedge clk)
    begin : eofin_delay_register_process
      if (reset_x == 1'b1) begin
        deofin <= 1'b0;
      end
      else begin
        if (enb) begin
          deofin <= endIn;
        end
      end
    end



  assign processzero_short = cnt3out < 4'b1111;



  assign tsysenb_short = cnt3enb & processzero_short;



  assign sysenb_short = tprocessMsg | tsysenb_short;



  assign ready =  ~ sysenb_short;



  assign cnt1enb = ready & startIn;



  // Counter 3 enable signal
  assign cnt3enb = cnt2out >= 4'b0001;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 15
  // Counter3: counts when start to pad zeros
  always @(posedge clk)
    begin : counter_1_process
      if (reset_x == 1'b1) begin
        cnt3out <= 4'b0000;
      end
      else begin
        if (enb) begin
          if (cnt2rst == 1'b1) begin
            cnt3out <= 4'b0000;
          end
          else if (cnt3enb == 1'b1) begin
            cnt3out <= cnt3out + 4'b0001;
          end
        end
      end
    end



  assign cnt2rst = cnt3out == 4'b1111;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 15
  //  count to value  = 1
  // Counter2: triggered by End of frame signal
  always @(posedge clk)
    begin : counter_2_process
      if (reset_x == 1'b1) begin
        cnt2out <= 4'b0000;
      end
      else begin
        if (enb) begin
          if (cnt2rst == 1'b1) begin
            cnt2out <= 4'b0000;
          end
          else if (cnt2enb == 1'b1) begin
            if (cnt2out == 4'b0001) begin
              cnt2out <= 4'b0000;
            end
            else begin
              cnt2out <= cnt2out + 4'b1111;
            end
          end
        end
      end
    end



  assign compare_cmpOut = cnt2out == 4'b0000;



  assign cnt2fstout = {3'b0, compare_cmpOut};



  assign cnt2fstout_is_not0 = cnt2fstout != 4'b0000;



  // Counter 2 enable signal
  assign cnt2enb = tprocessMsg & deofin;



  assign cnt1rst = cnt2enb & cnt2fstout_is_not0;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 1
  // Counter1: triggered by Start of frame signal
  always @(posedge clk)
    begin : counter_3_process
      if (reset_x == 1'b1) begin
        cnt1out <= 1'b0;
      end
      else begin
        if (enb) begin
          if (cnt1rst == 1'b1) begin
            cnt1out <= 1'b0;
          end
          else if (cnt1enb == 1'b1) begin
            cnt1out <=  ~ cnt1out;
          end
        end
      end
    end



  assign tprocessMsg = cnt1out == 1'b1;



  always @(posedge clk)
    begin : tprocessMsg_delay_register_process
      if (reset_x == 1'b1) begin
        dtprocessMsg <= 1'b0;
      end
      else begin
        if (enb) begin
          dtprocessMsg <= tprocessMsg;
        end
      end
    end



  assign rdtprocessMsg =  ~ dtprocessMsg;



  assign startout_1 = tprocessMsg & rdtprocessMsg;



  // Start of frame output signal
  always @(posedge clk)
    begin : sof_delay_register_process
      if (reset_x == 1'b1) begin
        sof_delay_register_reg <= {16{1'b0}};
      end
      else begin
        if (enb) begin
          sof_delay_register_reg[0] <= startout_1;
          sof_delay_register_reg[32'sd15:32'sd1] <= sof_delay_register_reg[32'sd14:32'sd0];
        end
      end
    end

  assign startOut = sof_delay_register_reg[15];



  // processMsg
  assign processMsg = tprocessMsg;

  assign processzero = 1'b1;



  assign tpadZero = cnt3enb & processzero;



  // padZero
  assign padZero = tpadZero;

  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 15
  // Counter5: counts when start to output CRC
  always @(posedge clk)
    begin : counter_4_process
      if (reset_x == 1'b1) begin
        cnt5out <= 4'b0000;
      end
      else begin
        if (enb) begin
          if (cnt4rst == 1'b1) begin
            cnt5out <= 4'b0000;
          end
          else if (cnt5enb == 1'b1) begin
            cnt5out <= cnt5out + 4'b0001;
          end
        end
      end
    end



  assign cnt4rst = cnt5out == 4'b1111;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 15
  // Counter4: triggered after processing all the padded zeros
  always @(posedge clk)
    begin : counter_5_process
      if (reset_x == 1'b1) begin
        cnt4out <= 4'b0000;
      end
      else begin
        if (enb) begin
          if (cnt4rst == 1'b1) begin
            cnt4out <= 4'b0000;
          end
          else if (cnt2rst == 1'b1) begin
            cnt4out <= cnt4out + 4'b0001;
          end
        end
      end
    end



  // Counter 5 enable signal
  assign cnt5enb = cnt4out >= 4'b0001;



  // outputCRC
  assign outputCRC = cnt5enb;

  always @(posedge clk)
    begin : eofout_delay_register_process
      if (reset_x == 1'b1) begin
        dteofout <= 1'b0;
      end
      else begin
        if (enb) begin
          dteofout <= cnt4rst;
        end
      end
    end



  assign rdteofout =  ~ dteofout;



  // End of frame output signal
  assign endOut = cnt4rst & rdteofout;



  assign sysenb = tprocessMsg | tpadZero;



  always @(posedge clk)
    begin : validin_unitdelay_register_process
      if (reset_x == 1'b1) begin
        udvalidin <= 1'b0;
      end
      else begin
        if (enb) begin
          udvalidin <= validIn;
        end
      end
    end



  assign rcnt3enb =  ~ cnt3enb;



  assign clearvalidin = (cnt3enb == 1'b0 ? udvalidin :
              rcnt3enb);



  assign tvalidout = sysenb & clearvalidin;



  // Buffer the validIn signal
  always @(posedge clk)
    begin : tvalidout_delay_register_process
      if (reset_x == 1'b1) begin
        tvalidout_delay_register_reg <= {16{1'b0}};
      end
      else begin
        if (enb) begin
          tvalidout_delay_register_reg[0] <= tvalidout;
          tvalidout_delay_register_reg[32'sd15:32'sd1] <= tvalidout_delay_register_reg[32'sd14:32'sd0];
        end
      end
    end

  assign dvalidout = tvalidout_delay_register_reg[15];



  // Data valid output
  assign validOut = dvalidout | cnt5enb;



  assign counter = cnt3out;

  assign counter_outputCRC = cnt5out;

endmodule  // tx_125_src_CRCGenControl
