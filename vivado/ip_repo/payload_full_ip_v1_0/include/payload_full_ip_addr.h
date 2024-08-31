/*
 * File Name:         hdl_prj/ipcore/payload_full_ip_v1_0/include/payload_full_ip_addr.h
 * Description:       C Header File
 * Created:           2024-08-31 17:53:09
*/

#ifndef PAYLOAD_FULL_IP_H_
#define PAYLOAD_FULL_IP_H_

#define  IPCore_Reset_payload_full_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_payload_full_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_payload_full_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2408311736: 2408311744: 2408311753

#endif /* PAYLOAD_FULL_IP_H_ */
