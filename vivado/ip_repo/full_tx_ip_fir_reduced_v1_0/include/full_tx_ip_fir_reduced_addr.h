/*
 * File Name:         hdl_prj/ipcore/full_tx_ip_fir_reduced_v1_0/include/full_tx_ip_fir_reduced_addr.h
 * Description:       C Header File
 * Created:           2024-08-10 09:36:33
*/

#ifndef FULL_TX_IP_FIR_REDUCED_H_
#define FULL_TX_IP_FIR_REDUCED_H_

#define  IPCore_Reset_full_tx_ip_fir_reduced       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_full_tx_ip_fir_reduced      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_full_tx_ip_fir_reduced   0x8  //contains unique IP timestamp (yymmddHHMM): 2408100936
#define  reg0_Data_full_tx_ip_fir_reduced          0x100  //data register for Inport reg0
#define  reg1_Data_full_tx_ip_fir_reduced          0x104  //data register for Inport reg1
#define  reg2_Data_full_tx_ip_fir_reduced          0x108  //data register for Inport reg2
#define  reg3_Data_full_tx_ip_fir_reduced          0x10C  //data register for Inport reg3

#endif /* FULL_TX_IP_FIR_REDUCED_H_ */
