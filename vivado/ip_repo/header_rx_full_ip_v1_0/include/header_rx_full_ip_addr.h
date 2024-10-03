/*
 * File Name:         hdl_prj/ipcore/header_rx_full_ip_v1_0/include/header_rx_full_ip_addr.h
 * Description:       C Header File
 * Created:           2024-09-06 20:46:11
*/

#ifndef HEADER_RX_FULL_IP_H_
#define HEADER_RX_FULL_IP_H_

#define  IPCore_Reset_header_rx_full_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_header_rx_full_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_header_rx_full_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2409062033: 2409062046

#endif /* HEADER_RX_FULL_IP_H_ */
