/*
 * File Name:         hdl_prj/ipcore/rx_payload_ip_v1_0/include/rx_payload_ip_addr.h
 * Description:       C Header File
 * Created:           2024-09-06 22:48:07
*/

#ifndef RX_PAYLOAD_IP_H_
#define RX_PAYLOAD_IP_H_

#define  IPCore_Reset_rx_payload_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_rx_payload_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_rx_payload_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2409062238: 2409062244: 2409062248

#endif /* RX_PAYLOAD_IP_H_ */
