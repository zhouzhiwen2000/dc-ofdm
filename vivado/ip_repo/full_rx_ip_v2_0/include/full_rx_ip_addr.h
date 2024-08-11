/*
 * File Name:         hdl_prj/ipcore/full_rx_ip_v2_0/include/full_rx_ip_addr.h
 * Description:       C Header File
 * Created:           2024-08-11 11:01:42
*/

#ifndef FULL_RX_IP_H_
#define FULL_RX_IP_H_

#define  IPCore_Reset_full_rx_ip                           0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_full_rx_ip                          0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_PacketSize_AXI4_Stream_Master_full_rx_ip   0x8  //Packet size for AXI4-Stream Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream Master interface is generated based on the packet size.
#define  IPCore_Timestamp_full_rx_ip                       0xC  //contains unique IP timestamp (yymmddHHMM): 2408111101
#define  reg0_Data_full_rx_ip                              0x100  //data register for Outport reg0
#define  reg1_Data_full_rx_ip                              0x104  //data register for Outport reg1
#define  reg2_Data_full_rx_ip                              0x108  //data register for Outport reg2
#define  reg3_Data_full_rx_ip                              0x10C  //data register for Outport reg3
#define  end_Data_full_rx_ip                               0x110  //data register for Outport end
#define  err_Data_full_rx_ip                               0x114  //data register for Outport err

#endif /* FULL_RX_IP_H_ */
