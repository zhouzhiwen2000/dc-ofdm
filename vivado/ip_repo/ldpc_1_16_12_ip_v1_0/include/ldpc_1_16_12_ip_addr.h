/*
 * File Name:         hdl_prj/ipcore/ldpc_1_16_12_ip_v1_0/include/ldpc_1_16_12_ip_addr.h
 * Description:       C Header File
 * Created:           2024-08-10 15:39:56
*/

#ifndef LDPC_1_16_12_IP_H_
#define LDPC_1_16_12_IP_H_

#define  IPCore_Reset_ldpc_1_16_12_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_ldpc_1_16_12_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_ldpc_1_16_12_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2408101539

#endif /* LDPC_1_16_12_IP_H_ */
