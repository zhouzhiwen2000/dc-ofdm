/*
 * File Name:         hdl_prj/ipcore/complex_m_ip_v1_0/include/complex_m_ip_addr.h
 * Description:       C Header File
 * Created:           2024-06-30 18:26:19
*/

#ifndef COMPLEX_M_IP_H_
#define COMPLEX_M_IP_H_

#define  IPCore_Reset_complex_m_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_complex_m_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_complex_m_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2406301826

#endif /* COMPLEX_M_IP_H_ */
