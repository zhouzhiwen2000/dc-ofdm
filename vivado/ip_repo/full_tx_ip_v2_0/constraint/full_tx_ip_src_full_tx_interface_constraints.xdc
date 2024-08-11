# AXI4-Lite CDC constraints:
set falsepathregcells [get_cells -hier -filter {cdc_info=="synchronizer_false_path"}]
set falsepathregpins [get_pins -of_objects $falsepathregcells -filter {REF_PIN_NAME=="D"}]
set_false_path -to $falsepathregpins
set startreglist_axitoip [get_cells -hier -filter {cdc_info=="max_delay_startpoint_axi_to_ip"}]
set endreglist_axitoip [get_cells -hier -filter {cdc_info=="max_delay_endpoint_axi_to_ip"}]
set reg_axitoip [get_cells -hier -filter {cdc_info=="max_delay_clk_axi_to_ip"}]
set clk_axitoip [get_clocks -of $reg_axitoip]
set clk_period_axitoip [get_property PERIOD $clk_axitoip]
set_max_delay -from $startreglist_axitoip -to $endreglist_axitoip -datapath_only $clk_period_axitoip -quiet
set startreglist_iptoaxi [get_cells -hier -filter {cdc_info=="max_delay_startpoint_ip_to_axi"}]
set endreglist_iptoaxi [get_cells -hier -filter {cdc_info=="max_delay_endpoint_ip_to_axi"}]
set reg_iptoaxi [get_cells -hier -filter {cdc_info=="max_delay_clk_ip_to_axi"}]
set clk_iptoaxi [get_clocks -of $reg_iptoaxi]
set clk_period_iptoaxi [get_property PERIOD $clk_iptoaxi]
set_max_delay -from $startreglist_iptoaxi -to $endreglist_iptoaxi -datapath_only $clk_period_iptoaxi -quiet
