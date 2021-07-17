# Copyright (C) 2019  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: GPU.tcl
# Generated on: Fri Jul 16 19:43:23 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "GPU"]} {
		puts "Project GPU is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists GPU]} {
		project_open -revision gpu GPU
	} else {
		project_new -revision gpu GPU
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSEMA5F31C6
	set_global_assignment -name TOP_LEVEL_ENTITY gpu_qsys_inst
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.0.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "15:32:18  JULY 17, 2019"
	set_global_assignment -name LAST_QUARTUS_VERSION "19.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name EDA_SIMULATION_TOOL "QuestaSim (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name USE_DLL_FREQUENCY_FOR_DQS_DELAY_CHAIN ON
	set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE ON
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
	set_global_assignment -name ECO_REGENERATE_REPORT ON
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS COMMAND_MACRO_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH gpu_tb -section_id eda_simulation
	set_global_assignment -name ENABLE_SIGNALTAP ON
	set_global_assignment -name USE_SIGNALTAP_FILE output_files/stp1.stp
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_SETUP_SCRIPT gpu_simulation/simulation/mentor/sim.do -section_id eda_simulation
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
	set_global_assignment -name VERILOG_SHOW_LMF_MAPPING_MESSAGES OFF
	set_global_assignment -name SMART_RECOMPILE ON
	set_global_assignment -name OPTIMIZATION_TECHNIQUE SPEED
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC ON
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_RETIMING ON
	set_global_assignment -name QII_AUTO_PACKED_REGISTERS NORMAL
	set_global_assignment -name PHYSICAL_SYNTHESIS_ASYNCHRONOUS_SIGNAL_PIPELINING ON
	set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION ON
	set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL MAXIMUM
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC_FOR_AREA ON
	set_global_assignment -name VERILOG_FILE math/flt2int.v
	set_global_assignment -name QIP_FILE gpu/synthesis/gpu_qsys.qip
	set_global_assignment -name SYSTEMVERILOG_FILE raster.sv
	set_global_assignment -name VERILOG_FILE prim_assembly.v
	set_global_assignment -name VERILOG_INCLUDE_FILE global_parameters.vh
	set_global_assignment -name VERILOG_FILE vert_processing.v
	set_global_assignment -name VERILOG_FILE gpu_qsys_inst.v
	set_global_assignment -name QIP_FILE math/int_mult.qip
	set_global_assignment -name QIP_FILE math/int_mult_add.qip
	set_global_assignment -name SIP_FILE math/int_mult_add.sip
	set_global_assignment -name QIP_FILE math/altfp_divider.qip
	set_global_assignment -name QIP_FILE math/altfp_multiplier.qip
	set_global_assignment -name QIP_FILE math/altfp_addsub.qip
	set_global_assignment -name QIP_FILE math/lpm_div.qip
	set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
	set_global_assignment -name ADV_NETLIST_OPT_SYNTH_WYSIWYG_REMAP ON
	set_global_assignment -name MUX_RESTRUCTURE OFF
	set_global_assignment -name STATE_MACHINE_PROCESSING "ONE-HOT"
	set_global_assignment -name QIP_FILE math/test.qip
	set_global_assignment -name REMOVE_DUPLICATE_REGISTERS OFF
	set_global_assignment -name OPTIMIZATION_MODE BALANCED
	set_global_assignment -name SDC_FILE GPU_SDC.sdc
	set_global_assignment -name QIP_FILE math/altfp_2int.qip
	set_global_assignment -name SIP_FILE math/altfp_2int.sip
	set_global_assignment -name EDA_TEST_BENCH_NAME gpu_tb -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME NA -section_id gpu_tb
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME gpu_tb -section_id gpu_tb
	set_global_assignment -name EDA_SIMULATION_RUN_SCRIPT gpu_simulation/simulation/mentor/sim.do -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_FILE gpu_simulation/simulation/gpu_tb.v -section_id gpu_tb
	set_location_assignment PIN_Y21 -to led_external_connection_export[9]
	set_location_assignment PIN_W21 -to led_external_connection_export[8]
	set_location_assignment PIN_W20 -to led_external_connection_export[7]
	set_location_assignment PIN_Y19 -to led_external_connection_export[6]
	set_location_assignment PIN_W19 -to led_external_connection_export[5]
	set_location_assignment PIN_W17 -to led_external_connection_export[4]
	set_location_assignment PIN_V18 -to led_external_connection_export[3]
	set_location_assignment PIN_V17 -to led_external_connection_export[2]
	set_location_assignment PIN_W16 -to led_external_connection_export[1]
	set_location_assignment PIN_V16 -to led_external_connection_export[0]
	set_location_assignment PIN_AA14 -to reset_reset_n
	set_location_assignment PIN_AF14 -to clk_clk
	set_instance_assignment -name D5_DELAY 2 -to memory_mem_ck -tag __hps_sdram_p0
	set_instance_assignment -name D5_DELAY 2 -to memory_mem_ck_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[0] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[1] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[2] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[3] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[4] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[5] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[6] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dq[7] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dm -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dqs -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_dqs_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[0] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[10] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[11] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[12] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[1] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[2] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[3] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[4] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[5] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[6] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[7] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[8] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_a[9] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ba[0] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ba[1] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ba[2] -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_cas_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_cke -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_cs_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_odt -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ras_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_we_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_reset_n -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ck -tag __hps_sdram_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION OFF -to memory_mem_ck_n -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to hps|hps_io|border|hps_sdram_inst|p0|umemphy|ureset|phy_reset_mem_stable_n -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to hps|hps_io|border|hps_sdram_inst|p0|umemphy|ureset|phy_reset_n -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to hps|hps_io|border|hps_sdram_inst|p0|umemphy|uio_pads|dq_ddio[0].read_capture_clk_buffer -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to hps|hps_io|border|hps_sdram_inst|p0|umemphy|uread_datapath|reset_n_fifo_write_side[0] -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to hps|hps_io|border|hps_sdram_inst|p0|umemphy|uread_datapath|reset_n_fifo_wraddress[0] -tag __hps_sdram_p0
	set_instance_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS ON -to hps|hps_io|border|hps_sdram_inst -tag __hps_sdram_p0
	set_instance_assignment -name PLL_COMPENSATION_MODE DIRECT -to hps|hps_io|border|hps_sdram_inst|pll0|fbout -tag __hps_sdram_p0
	set_location_assignment PIN_AJ14 -to sdram_wire_addr[12]
	set_location_assignment PIN_AH13 -to sdram_wire_addr[11]
	set_location_assignment PIN_AG12 -to sdram_wire_addr[10]
	set_location_assignment PIN_AG13 -to sdram_wire_addr[9]
	set_location_assignment PIN_AH15 -to sdram_wire_addr[8]
	set_location_assignment PIN_AF15 -to sdram_wire_addr[7]
	set_location_assignment PIN_AD14 -to sdram_wire_addr[6]
	set_location_assignment PIN_AC14 -to sdram_wire_addr[5]
	set_location_assignment PIN_AB15 -to sdram_wire_addr[4]
	set_location_assignment PIN_AE14 -to sdram_wire_addr[3]
	set_location_assignment PIN_AG15 -to sdram_wire_addr[2]
	set_location_assignment PIN_AH14 -to sdram_wire_addr[1]
	set_location_assignment PIN_AK14 -to sdram_wire_addr[0]
	set_location_assignment PIN_AJ5 -to sdram_wire_dq[15]
	set_location_assignment PIN_AJ6 -to sdram_wire_dq[14]
	set_location_assignment PIN_AH7 -to sdram_wire_dq[13]
	set_location_assignment PIN_AH8 -to sdram_wire_dq[12]
	set_location_assignment PIN_AH9 -to sdram_wire_dq[11]
	set_location_assignment PIN_AJ9 -to sdram_wire_dq[10]
	set_location_assignment PIN_AJ10 -to sdram_wire_dq[9]
	set_location_assignment PIN_AH10 -to sdram_wire_dq[8]
	set_location_assignment PIN_AJ11 -to sdram_wire_dq[7]
	set_location_assignment PIN_AK11 -to sdram_wire_dq[6]
	set_location_assignment PIN_AG10 -to sdram_wire_dq[5]
	set_location_assignment PIN_AK9 -to sdram_wire_dq[4]
	set_location_assignment PIN_AK8 -to sdram_wire_dq[3]
	set_location_assignment PIN_AK7 -to sdram_wire_dq[2]
	set_location_assignment PIN_AJ7 -to sdram_wire_dq[1]
	set_location_assignment PIN_AK6 -to sdram_wire_dq[0]
	set_location_assignment PIN_AJ12 -to sdram_wire_ba[1]
	set_location_assignment PIN_AF13 -to sdram_wire_ba[0]
	set_location_assignment PIN_AF11 -to sdram_wire_cas_n
	set_location_assignment PIN_AK13 -to sdram_wire_cke
	set_location_assignment PIN_AG11 -to sdram_wire_cs_n
	set_location_assignment PIN_AE13 -to sdram_wire_ras_n
	set_location_assignment PIN_AA13 -to sdram_wire_we_n
	set_location_assignment PIN_AB13 -to sdram_wire_dqm[0]
	set_location_assignment PIN_AK12 -to sdram_wire_dqm[1]
	set_location_assignment PIN_AH12 -to sdram_clk_clk
	set_location_assignment PIN_AA16 -to video_pll_ref_clk_clk
	set_location_assignment PIN_A13 -to vga_controller_external_interface_R[0]
	set_location_assignment PIN_C13 -to vga_controller_external_interface_R[1]
	set_location_assignment PIN_E13 -to vga_controller_external_interface_R[2]
	set_location_assignment PIN_B12 -to vga_controller_external_interface_R[3]
	set_location_assignment PIN_C12 -to vga_controller_external_interface_R[4]
	set_location_assignment PIN_D12 -to vga_controller_external_interface_R[5]
	set_location_assignment PIN_E12 -to vga_controller_external_interface_R[6]
	set_location_assignment PIN_F13 -to vga_controller_external_interface_R[7]
	set_location_assignment PIN_B13 -to vga_controller_external_interface_B[0]
	set_location_assignment PIN_G13 -to vga_controller_external_interface_B[1]
	set_location_assignment PIN_H13 -to vga_controller_external_interface_B[2]
	set_location_assignment PIN_F14 -to vga_controller_external_interface_B[3]
	set_location_assignment PIN_H14 -to vga_controller_external_interface_B[4]
	set_location_assignment PIN_F15 -to vga_controller_external_interface_B[5]
	set_location_assignment PIN_G15 -to vga_controller_external_interface_B[6]
	set_location_assignment PIN_J14 -to vga_controller_external_interface_B[7]
	set_location_assignment PIN_A11 -to vga_controller_external_interface_CLK
	set_location_assignment PIN_J9 -to vga_controller_external_interface_G[0]
	set_location_assignment PIN_J10 -to vga_controller_external_interface_G[1]
	set_location_assignment PIN_H12 -to vga_controller_external_interface_G[2]
	set_location_assignment PIN_G10 -to vga_controller_external_interface_G[3]
	set_location_assignment PIN_G11 -to vga_controller_external_interface_G[4]
	set_location_assignment PIN_G12 -to vga_controller_external_interface_G[5]
	set_location_assignment PIN_F11 -to vga_controller_external_interface_G[6]
	set_location_assignment PIN_E11 -to vga_controller_external_interface_G[7]
	set_location_assignment PIN_B11 -to vga_controller_external_interface_HS
	set_location_assignment PIN_F10 -to vga_controller_external_interface_BLANK
	set_location_assignment PIN_C10 -to vga_controller_external_interface_SYNC
	set_location_assignment PIN_D11 -to vga_controller_external_interface_VS
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_oct_rzqin -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[0] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[0] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[0] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[1] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[1] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[1] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[2] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[2] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[2] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[3] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[3] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[3] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[4] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[4] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[4] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[5] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[5] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[5] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[6] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[6] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[6] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dq[7] -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dq[7] -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dq[7] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to memory_mem_dqs -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dqs -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dqs -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to memory_mem_dqs_n -tag __hps_sdram_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to memory_mem_dqs_n -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dqs_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to memory_mem_ck -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITHOUT CALIBRATION" -to memory_mem_ck -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to memory_mem_ck_n -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITHOUT CALIBRATION" -to memory_mem_ck_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[0] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[0] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[10] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[10] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[11] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[11] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[12] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[12] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[1] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[1] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[2] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[2] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[3] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[3] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[4] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[4] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[5] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[5] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[6] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[6] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[7] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[7] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[8] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[8] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_a[9] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_a[9] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_ba[0] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_ba[0] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_ba[1] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_ba[1] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_ba[2] -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_ba[2] -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_cas_n -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_cas_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_cke -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_cke -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_cs_n -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_cs_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_odt -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_odt -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_ras_n -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_ras_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_we_n -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_we_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_reset_n -tag __hps_sdram_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to memory_mem_reset_n -tag __hps_sdram_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to memory_mem_dm -tag __hps_sdram_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to memory_mem_dm -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to u0|hps|hps_io|border|hps_sdram_inst|p0|umemphy|ureset|phy_reset_mem_stable_n -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to u0|hps|hps_io|border|hps_sdram_inst|p0|umemphy|ureset|phy_reset_n -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to u0|hps|hps_io|border|hps_sdram_inst|p0|umemphy|uio_pads|dq_ddio[0].read_capture_clk_buffer -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to u0|hps|hps_io|border|hps_sdram_inst|p0|umemphy|uread_datapath|reset_n_fifo_write_side[0] -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL OFF -to u0|hps|hps_io|border|hps_sdram_inst|p0|umemphy|uread_datapath|reset_n_fifo_wraddress[0] -tag __hps_sdram_p0
	set_instance_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS ON -to u0|hps|hps_io|border|hps_sdram_inst -tag __hps_sdram_p0
	set_instance_assignment -name PLL_COMPENSATION_MODE DIRECT -to u0|hps|hps_io|border|hps_sdram_inst|pll0|fbout -tag __hps_sdram_p0
	set_instance_assignment -name GLOBAL_SIGNAL GLOBAL_CLOCK -to "gpu_qsys:u0|gpu_qsys_pll:pll|outclk_0"
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
