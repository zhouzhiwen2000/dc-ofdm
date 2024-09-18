create_project prj_ip {} -part xc7z010clg400-1 -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/tx_125_src_full_tx_tc.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator.v}
add_files -norecurse {../hdl/tx_125_src_valid_to_ctrl.v}
add_files -norecurse {../hdl/tx_125_src_channel_gen.v}
add_files -norecurse {../hdl/tx_125_src_clock_crossing.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block.v}
add_files -norecurse {../hdl/tx_125_src_CRCGenControl.v}
add_files -norecurse {../hdl/tx_125_src_CRCGenCompute.v}
add_files -norecurse {../hdl/tx_125_src_General_CRC_Generator_HDL_Optimized.v}
add_files -norecurse {../hdl/tx_125_src_h_crc.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block1.v}
add_files -norecurse {../hdl/tx_125_src_valid_to_ctrl_block.v}
add_files -norecurse {../hdl/tx_125_src_h_gen.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block2.v}
add_files -norecurse {../hdl/tx_125_src_SimpleDualPortRAM_singlebit.v}
add_files -norecurse {../hdl/tx_125_src_h_repetition.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block3.v}
add_files -norecurse {../hdl/tx_125_src_h_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_SimpleDualPortRAM_singlebit_block.v}
add_files -norecurse {../hdl/tx_125_src_BarrelRotator.v}
add_files -norecurse {../hdl/tx_125_src_Calculate_Alpha.v}
add_files -norecurse {../hdl/tx_125_src_Calculate_Parity.v}
add_files -norecurse {../hdl/tx_125_src_Final_Output.v}
add_files -norecurse {../hdl/tx_125_src_Hc_12H_B14.v}
add_files -norecurse {../hdl/tx_125_src_header_fec.v}
add_files -norecurse {../hdl/tx_125_src_header_full.v}
add_files -norecurse {../hdl/tx_125_src_new_frame_rate_conversion.v}
add_files -norecurse {../hdl/tx_125_src_new_frame_rate_conversion1.v}
add_files -norecurse {../hdl/tx_125_src_batid_to_bits_per_subcarrier.v}
add_files -norecurse {../hdl/tx_125_src_payload_rep.v}
add_files -norecurse {../hdl/tx_125_src_psdu_size_to_payload_len.v}
add_files -norecurse {../hdl/tx_125_src_puncturer.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block4.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant.v}
add_files -norecurse {../hdl/tx_125_src_tone_mapping.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block5.v}
add_files -norecurse {../hdl/tx_125_src_valid_to_ctrl_block1.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block6.v}
add_files -norecurse {../hdl/tx_125_src_p_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_BarrelRotator_block.v}
add_files -norecurse {../hdl/tx_125_src_Calculate_Alpha_block.v}
add_files -norecurse {../hdl/tx_125_src_Calculate_Parity_block.v}
add_files -norecurse {../hdl/tx_125_src_Final_Output_block.v}
add_files -norecurse {../hdl/tx_125_src_Hc_12S_B80.v}
add_files -norecurse {../hdl/tx_125_src_reduced_ldpc.v}
add_files -norecurse {../hdl/tx_125_src_rising_edge_detector.v}
add_files -norecurse {../hdl/tx_125_src_next_frame_to_ready.v}
add_files -norecurse {../hdl/tx_125_src_payload_full.v}
add_files -norecurse {../hdl/tx_125_src_Sample_Control_Bus_Creator_block7.v}
add_files -norecurse {../hdl/tx_125_src_valid_to_ctrl_block2.v}
add_files -norecurse {../hdl/tx_125_src_preamble_gen.v}
add_files -norecurse {../hdl/tx_125_src_reg_to_variable.v}
add_files -norecurse {../hdl/tx_125_src_SimpleDualPortRAM_generic.v}
add_files -norecurse {../hdl/tx_125_src_RAM.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant_block.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant1.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant2.v}
add_files -norecurse {../hdl/tx_125_src_one_hot_coder.v}
add_files -norecurse {../hdl/tx_125_src_bits_selector.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant_block1.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant1_block.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant2_block.v}
add_files -norecurse {../hdl/tx_125_src_one_hot_coder_block.v}
add_files -norecurse {../hdl/tx_125_src_cp_len_creator.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant_block2.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant1_block1.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Constant2_block1.v}
add_files -norecurse {../hdl/tx_125_src_one_hot_coder_block1.v}
add_files -norecurse {../hdl/tx_125_src_init_selector.v}
add_files -norecurse {../hdl/tx_125_src_Compare_To_Zero1.v}
add_files -norecurse {../hdl/tx_125_src_valid_frame.v}
add_files -norecurse {../hdl/tx_125_src_read_frame_from_ram.v}
add_files -norecurse {../hdl/tx_125_src_one_hot_coder_block2.v}
add_files -norecurse {../hdl/tx_125_src_ram_formatting.v}
add_files -norecurse {../hdl/tx_125_src_write_frame_to_ram.v}
add_files -norecurse {../hdl/tx_125_src_store_frame_in_ram.v}
add_files -norecurse {../hdl/tx_125_src_Mixer.v}
add_files -norecurse {../hdl/tx_125_src_SinLookUpTableGen.v}
add_files -norecurse {../hdl/tx_125_src_CosLookUpTableGen.v}
add_files -norecurse {../hdl/tx_125_src_WaveformGen.v}
add_files -norecurse {../hdl/tx_125_src_NCO.v}
add_files -norecurse {../hdl/tx_125_src_frequency_upshift.v}
add_files -norecurse {../hdl/tx_125_src_falling_edge_detector.v}
add_files -norecurse {../hdl/tx_125_src_FirRdyLogic.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block1.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block2.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block3.v}
add_files -norecurse {../hdl/tx_125_src_FilterTapSystolicPreAdd.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block4.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block5.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block6.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block7.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block8.v}
add_files -norecurse {../hdl/tx_125_src_FilterTapSystolicPreAdd_block.v}
add_files -norecurse {../hdl/tx_125_src_FIRFilter1.v}
add_files -norecurse {../hdl/tx_125_src_FirRdyLogic_block.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block9.v}
add_files -norecurse {../hdl/tx_125_src_FilterTapSystolic.v}
add_files -norecurse {../hdl/tx_125_src_Addressable_Delay_Line_block10.v}
add_files -norecurse {../hdl/tx_125_src_FilterTapSystolic_block.v}
add_files -norecurse {../hdl/tx_125_src_FIRFilter2.v}
add_files -norecurse {../hdl/tx_125_src_FIR_Interpolator.v}
add_files -norecurse {../hdl/tx_125_src_interpolator.v}
add_files -norecurse {../hdl/tx_125_src_rising_edge_detector_block.v}
add_files -norecurse {../hdl/tx_125_src_rotate.v}
add_files -norecurse {../hdl/tx_125_src_constellation_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_BPSK_Modulator_Baseband.v}
add_files -norecurse {../hdl/tx_125_src_qam_mod.v}
add_files -norecurse {../hdl/tx_125_src_Synchronous_constellation_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_sync_constellation_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_enabled_qam_and_scrambler.v}
add_files -norecurse {../hdl/tx_125_src_SimpleDualPortRAM_generic_block.v}
add_files -norecurse {../hdl/tx_125_src_symbolFormation.v}
add_files -norecurse {../hdl/tx_125_src_samplesRepetitionMod.v}
add_files -norecurse {../hdl/tx_125_src_DownSamplerMod.v}
add_files -norecurse {../hdl/tx_125_src_HDLFFTShiftMod.v}
add_files -norecurse {../hdl/tx_125_src_CPAddition.v}
add_files -norecurse {../hdl/tx_125_src_TWDLROM_3_1.v}
add_files -norecurse {../hdl/tx_125_src_TWDLROM_5_1.v}
add_files -norecurse {../hdl/tx_125_src_TWDLROM_7_1.v}
add_files -norecurse {../hdl/tx_125_src_RADIX2FFT_bitNatural.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_1.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator1.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF1_1.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_2.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator2.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF2_2.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_3.v}
add_files -norecurse {../hdl/tx_125_src_Complex4Multiply.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator3.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF1_3.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_4.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator4.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF2_4.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_5.v}
add_files -norecurse {../hdl/tx_125_src_Complex4Multiply_block.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator5.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF1_5.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_6.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator6.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF2_6.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_7.v}
add_files -norecurse {../hdl/tx_125_src_Complex4Multiply_block1.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator7.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF1_7.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_CTRL1_8.v}
add_files -norecurse {../hdl/tx_125_src_SDFCommutator8.v}
add_files -norecurse {../hdl/tx_125_src_RADIX22FFT_SDF2_8.v}
add_files -norecurse {../hdl/tx_125_src_dsphdl_IFFT.v}
add_files -norecurse {../hdl/tx_125_src_OFDM_Modulator.v}
add_files -norecurse {../hdl/tx_125_src_ofdm_modulator_block.v}
add_files -norecurse {../hdl/tx_125_src_full_ofdm_modulator.v}
add_files -norecurse {../hdl/tx_125_src_full_tx.v}
add_files -norecurse {../hdl/tx_125_reset_sync.v}
add_files -norecurse {../hdl/tx_125_dut.v}
add_files -norecurse {../hdl/tx_125.v}

# Add Constraint files to project
add_files -norecurse {../constraint/tx_125_src_full_tx_constraints.xdc}
set_property top tx_125 [get_filesets sources_1]
set_property top tx_125 [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name tx_125 [ipx::current_core]
set_property display_name tx_125 [ipx::current_core]
set_property version {1.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 0001000000 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/tx_125_src_full_tx_tc.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_tx_tc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_full_tx_tc.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_tx_tc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_channel_gen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_channel_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_channel_gen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_channel_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_clock_crossing.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_clock_crossing.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_clock_crossing.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_clock_crossing.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CRCGenControl.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CRCGenControl.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CRCGenControl.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CRCGenControl.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CRCGenCompute.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CRCGenCompute.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CRCGenCompute.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CRCGenCompute.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_General_CRC_Generator_HDL_Optimized.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_General_CRC_Generator_HDL_Optimized.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_General_CRC_Generator_HDL_Optimized.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_General_CRC_Generator_HDL_Optimized.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_crc.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_crc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_crc.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_crc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_gen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_gen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_singlebit.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_singlebit.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_singlebit.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_singlebit.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_repetition.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_repetition.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_repetition.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_repetition.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block3.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block3.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_h_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_h_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_singlebit_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_singlebit_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_singlebit_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_singlebit_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BarrelRotator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BarrelRotator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BarrelRotator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BarrelRotator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Alpha.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Alpha.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Alpha.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Alpha.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Parity.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Parity.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Parity.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Parity.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Final_Output.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Final_Output.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Final_Output.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Final_Output.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Hc_12H_B14.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Hc_12H_B14.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Hc_12H_B14.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Hc_12H_B14.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_header_fec.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_header_fec.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_header_fec.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_header_fec.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_header_full.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_header_full.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_header_full.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_header_full.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_new_frame_rate_conversion.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_new_frame_rate_conversion.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_new_frame_rate_conversion.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_new_frame_rate_conversion.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_new_frame_rate_conversion1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_new_frame_rate_conversion1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_new_frame_rate_conversion1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_new_frame_rate_conversion1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_batid_to_bits_per_subcarrier.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_batid_to_bits_per_subcarrier.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_batid_to_bits_per_subcarrier.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_batid_to_bits_per_subcarrier.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_payload_rep.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_payload_rep.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_payload_rep.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_payload_rep.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_psdu_size_to_payload_len.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_psdu_size_to_payload_len.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_psdu_size_to_payload_len.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_psdu_size_to_payload_len.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_puncturer.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_puncturer.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_puncturer.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_puncturer.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block4.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block4.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_tone_mapping.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_tone_mapping.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_tone_mapping.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_tone_mapping.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block5.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block5.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block6.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block6.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_p_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_p_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_p_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_p_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BarrelRotator_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BarrelRotator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BarrelRotator_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BarrelRotator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Alpha_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Alpha_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Alpha_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Alpha_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Parity_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Parity_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Calculate_Parity_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Calculate_Parity_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Final_Output_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Final_Output_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Final_Output_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Final_Output_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Hc_12S_B80.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Hc_12S_B80.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Hc_12S_B80.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Hc_12S_B80.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_reduced_ldpc.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_reduced_ldpc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_reduced_ldpc.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_reduced_ldpc.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rising_edge_detector.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rising_edge_detector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rising_edge_detector.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rising_edge_detector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_next_frame_to_ready.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_next_frame_to_ready.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_next_frame_to_ready.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_next_frame_to_ready.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_payload_full.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_payload_full.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_payload_full.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_payload_full.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block7.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Sample_Control_Bus_Creator_block7.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Sample_Control_Bus_Creator_block7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_to_ctrl_block2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_to_ctrl_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_preamble_gen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_preamble_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_preamble_gen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_preamble_gen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_reg_to_variable.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_reg_to_variable.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_reg_to_variable.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_reg_to_variable.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_generic.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_generic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_generic.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_generic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RAM.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RAM.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RAM.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RAM.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_bits_selector.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_bits_selector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_bits_selector.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_bits_selector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_cp_len_creator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_cp_len_creator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_cp_len_creator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_cp_len_creator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant_block2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant1_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant1_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Constant2_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Constant2_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_init_selector.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_init_selector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_init_selector.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_init_selector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Zero1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Zero1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Compare_To_Zero1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Compare_To_Zero1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_frame.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_frame.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_valid_frame.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_valid_frame.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_read_frame_from_ram.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_read_frame_from_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_read_frame_from_ram.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_read_frame_from_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_one_hot_coder_block2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_one_hot_coder_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_ram_formatting.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_ram_formatting.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_ram_formatting.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_ram_formatting.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_write_frame_to_ram.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_write_frame_to_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_write_frame_to_ram.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_write_frame_to_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_store_frame_in_ram.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_store_frame_in_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_store_frame_in_ram.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_store_frame_in_ram.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Mixer.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Mixer.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Mixer.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Mixer.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SinLookUpTableGen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SinLookUpTableGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SinLookUpTableGen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SinLookUpTableGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CosLookUpTableGen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CosLookUpTableGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CosLookUpTableGen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CosLookUpTableGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_WaveformGen.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_WaveformGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_WaveformGen.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_WaveformGen.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_NCO.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_NCO.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_NCO.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_NCO.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_frequency_upshift.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_frequency_upshift.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_frequency_upshift.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_frequency_upshift.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_falling_edge_detector.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_falling_edge_detector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_falling_edge_detector.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_falling_edge_detector.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FirRdyLogic.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FirRdyLogic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FirRdyLogic.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FirRdyLogic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block3.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block3.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolicPreAdd.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolicPreAdd.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolicPreAdd.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolicPreAdd.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block4.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block4.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block5.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block5.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block6.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block6.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block7.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block7.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block8.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block8.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolicPreAdd_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolicPreAdd_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolicPreAdd_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolicPreAdd_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIRFilter1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIRFilter1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIRFilter1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIRFilter1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FirRdyLogic_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FirRdyLogic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FirRdyLogic_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FirRdyLogic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block9.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block9.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block9.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block9.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolic.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolic.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolic.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block10.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block10.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Addressable_Delay_Line_block10.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Addressable_Delay_Line_block10.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolic_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FilterTapSystolic_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FilterTapSystolic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIRFilter2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIRFilter2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIRFilter2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIRFilter2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIR_Interpolator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIR_Interpolator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_FIR_Interpolator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_FIR_Interpolator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_interpolator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_interpolator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_interpolator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_interpolator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rising_edge_detector_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rising_edge_detector_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rising_edge_detector_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rising_edge_detector_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rotate.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rotate.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_rotate.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_rotate.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BPSK_Modulator_Baseband.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BPSK_Modulator_Baseband.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_BPSK_Modulator_Baseband.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_BPSK_Modulator_Baseband.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_qam_mod.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_qam_mod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_qam_mod.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_qam_mod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Synchronous_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Synchronous_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Synchronous_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Synchronous_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_sync_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_sync_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_sync_constellation_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_sync_constellation_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_enabled_qam_and_scrambler.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_enabled_qam_and_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_enabled_qam_and_scrambler.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_enabled_qam_and_scrambler.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_generic_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_generic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SimpleDualPortRAM_generic_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SimpleDualPortRAM_generic_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_symbolFormation.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_symbolFormation.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_symbolFormation.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_symbolFormation.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_samplesRepetitionMod.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_samplesRepetitionMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_samplesRepetitionMod.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_samplesRepetitionMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_DownSamplerMod.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_DownSamplerMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_DownSamplerMod.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_DownSamplerMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_HDLFFTShiftMod.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_HDLFFTShiftMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_HDLFFTShiftMod.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_HDLFFTShiftMod.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CPAddition.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CPAddition.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_CPAddition.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_CPAddition.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_3_1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_3_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_3_1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_3_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_5_1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_5_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_5_1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_5_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_7_1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_7_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_TWDLROM_7_1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_TWDLROM_7_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX2FFT_bitNatural.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX2FFT_bitNatural.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX2FFT_bitNatural.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX2FFT_bitNatural.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_2.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_2.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_2.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_3.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_3.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator3.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator3.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_3.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_3.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_3.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_4.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_4.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator4.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator4.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_4.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_4.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_4.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_5.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_5.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator5.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator5.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_5.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_5.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_5.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_6.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_6.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator6.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator6.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_6.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_6.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_6.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_7.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_7.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply_block1.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_Complex4Multiply_block1.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_Complex4Multiply_block1.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator7.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator7.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_7.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF1_7.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF1_7.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_8.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_CTRL1_8.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_CTRL1_8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator8.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_SDFCommutator8.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_SDFCommutator8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_8.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_RADIX22FFT_SDF2_8.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_RADIX22FFT_SDF2_8.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_dsphdl_IFFT.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_dsphdl_IFFT.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_dsphdl_IFFT.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_dsphdl_IFFT.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_OFDM_Modulator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_OFDM_Modulator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_OFDM_Modulator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_OFDM_Modulator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_ofdm_modulator_block.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_ofdm_modulator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_ofdm_modulator_block.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_ofdm_modulator_block.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_full_ofdm_modulator.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_ofdm_modulator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_full_ofdm_modulator.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_ofdm_modulator.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_full_tx.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_tx.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_src_full_tx.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_src_full_tx.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_reset_sync.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_reset_sync.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_reset_sync.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_reset_sync.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_dut.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_dut.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125_dut.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125_dut.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125.v} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125.v} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/tx_125.v} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{verilogSource}} [ipx::get_files {hdl/tx_125.v} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add MCP constraint file(s) to IP
ipx::add_file {constraint/tx_125_src_full_tx_constraints.xdc} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{xdcFile}} [ipx::get_files {constraint/tx_125_src_full_tx_constraints.xdc} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]

# Add IP clock and reset definition
ipx::add_bus_interface {IPCORE_CLK} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_CLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_interface {IPCORE_RESETN} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_RESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {IPCORE_RESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]


# Add report files
ipx::add_file_group -type {product_guide} {} [ipx::current_core]
ipx::add_file {doc/HDLTx_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/HDLTx_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add FPGA Data Capture files
ipx::add_file_group -type {xilinx_examples} {} [ipx::current_core]
ipx::add_file_group -type {xilinx_implementation} {} [ipx::current_core]
ipx::add_file {fpga_data_capture/FPGADataCapture.m} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGADataCapture.m} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/FPGADataCapture_model.slx} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGADataCapture_model.slx} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/FPGA_Data_Capture_Component_Generation_Report.html} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGA_Data_Capture_Component_Generation_Report.html} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/JTAG_Debug_hub.png} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/JTAG_Debug_hub.png} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/Workflow2.png} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/Workflow2.png} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/launchDataCaptureApp.m} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/launchDataCaptureApp.m} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]

# Package IP
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::archive_core {../tx_125_v1_0.zip} [ipx::current_core]
close_project
exit
