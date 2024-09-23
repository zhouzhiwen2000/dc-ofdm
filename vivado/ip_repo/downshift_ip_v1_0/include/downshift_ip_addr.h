/*
 * File Name:         hdl_prj/ipcore/downshift_ip_v1_0/include/downshift_ip_addr.h
 * Description:       C Header File
 * Created:           2024-09-22 22:56:56
*/

#ifndef DOWNSHIFT_IP_H_
#define DOWNSHIFT_IP_H_

#define  IPCore_Reset_downshift_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_downshift_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_downshift_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2409222256

#endif /* DOWNSHIFT_IP_H_ */
