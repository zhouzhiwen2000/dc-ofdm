create_project prj_ip {} -part xc7z010clg400-1 -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/channel_est_ip_src_hdl_wrapper_pac.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_OFDM_Equalizer.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_rising_edge_detector.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_rising_edge_detector1.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block1.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_Channel_Equalization.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_rising_edge_detector_block.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_HDL_FIFO.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_Channel_Estimation.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_channel_estimation_and_equalization.vhd}
add_files -norecurse {../hdl/channel_est_ip_src_hdl_wrapper.vhd}
add_files -norecurse {../hdl/channel_est_ip_reset_sync.vhd}
add_files -norecurse {../hdl/channel_est_ip_dut.vhd}
add_files -norecurse {../hdl/channel_est_ip.vhd}
set_property top channel_est_ip [get_filesets sources_1]
set_property top channel_est_ip [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name channel_est_ip [ipx::current_core]
set_property display_name channel_est_ip [ipx::current_core]
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
ipx::add_file {hdl/channel_est_ip_src_hdl_wrapper_pac.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_hdl_wrapper_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_hdl_wrapper_pac.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_hdl_wrapper_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_OFDM_Equalizer.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_OFDM_Equalizer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_OFDM_Equalizer.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_OFDM_Equalizer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_SimpleDualPortRAM_generic_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_Channel_Equalization.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_Channel_Equalization.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_Channel_Equalization.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_Channel_Equalization.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_rising_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_rising_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_HDL_FIFO.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_HDL_FIFO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_HDL_FIFO.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_HDL_FIFO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_Channel_Estimation.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_Channel_Estimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_Channel_Estimation.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_Channel_Estimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_channel_estimation_and_equalization.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_channel_estimation_and_equalization.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_channel_estimation_and_equalization.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_channel_estimation_and_equalization.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_hdl_wrapper.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_hdl_wrapper.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_src_hdl_wrapper.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_src_hdl_wrapper.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/channel_est_ip.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/channel_est_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

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
ipx::add_file {doc/HDLChannelEstimator_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/HDLChannelEstimator_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

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
ipx::archive_core {../channel_est_ip_v1_0.zip} [ipx::current_core]
close_project
exit
