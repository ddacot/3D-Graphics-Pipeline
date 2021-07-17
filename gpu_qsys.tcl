# qsys scripting (.tcl) file for gpu_qsys
package require -exact qsys 16.0

create_system {gpu_qsys}

set_project_property DEVICE_FAMILY {Cyclone V}
set_project_property DEVICE {5CSEMA5F31C6}
set_project_property HIDE_FROM_IP_CATALOG {false}

# Instances and instance parameters
# (disabled instances are intentionally culled)
add_instance address_span_extender altera_address_span_extender 19.1
set_instance_parameter_value address_span_extender {BURSTCOUNT_WIDTH} {1}
set_instance_parameter_value address_span_extender {DATA_WIDTH} {32}
set_instance_parameter_value address_span_extender {ENABLE_SLAVE_PORT} {0}
set_instance_parameter_value address_span_extender {MASTER_ADDRESS_DEF} {0}
set_instance_parameter_value address_span_extender {MASTER_ADDRESS_WIDTH} {32}
set_instance_parameter_value address_span_extender {MAX_PENDING_READS} {1}
set_instance_parameter_value address_span_extender {SLAVE_ADDRESS_WIDTH} {28}
set_instance_parameter_value address_span_extender {SUB_WINDOW_COUNT} {1}

add_instance gpu_main altera_up_external_bus_to_avalon_bridge 18.0
set_instance_parameter_value gpu_main {addr_size} {1024}
set_instance_parameter_value gpu_main {addr_size_multiplier} {Mbytes}
set_instance_parameter_value gpu_main {data_size} {32}

add_instance hps altera_hps 19.1
set_instance_parameter_value hps {ABSTRACT_REAL_COMPARE_TEST} {0}
set_instance_parameter_value hps {ABS_RAM_MEM_INIT_FILENAME} {meminit}
set_instance_parameter_value hps {ACV_PHY_CLK_ADD_FR_PHASE} {0.0}
set_instance_parameter_value hps {AC_PACKAGE_DESKEW} {0}
set_instance_parameter_value hps {AC_ROM_USER_ADD_0} {0_0000_0000_0000}
set_instance_parameter_value hps {AC_ROM_USER_ADD_1} {0_0000_0000_1000}
set_instance_parameter_value hps {ADDR_ORDER} {0}
set_instance_parameter_value hps {ADD_EFFICIENCY_MONITOR} {0}
set_instance_parameter_value hps {ADD_EXTERNAL_SEQ_DEBUG_NIOS} {0}
set_instance_parameter_value hps {ADVANCED_CK_PHASES} {0}
set_instance_parameter_value hps {ADVERTIZE_SEQUENCER_SW_BUILD_FILES} {0}
set_instance_parameter_value hps {AFI_DEBUG_INFO_WIDTH} {32}
set_instance_parameter_value hps {ALTMEMPHY_COMPATIBLE_MODE} {0}
set_instance_parameter_value hps {AP_MODE} {0}
set_instance_parameter_value hps {AP_MODE_EN} {0}
set_instance_parameter_value hps {AUTO_PD_CYCLES} {0}
set_instance_parameter_value hps {AUTO_POWERDN_EN} {0}
set_instance_parameter_value hps {AVL_DATA_WIDTH_PORT} {32 32 32 32 32 32}
set_instance_parameter_value hps {AVL_MAX_SIZE} {4}
set_instance_parameter_value hps {BONDING_OUT_ENABLED} {0}
set_instance_parameter_value hps {BOOTFROMFPGA_Enable} {0}
set_instance_parameter_value hps {BSEL} {1}
set_instance_parameter_value hps {BSEL_EN} {0}
set_instance_parameter_value hps {BYTE_ENABLE} {1}
set_instance_parameter_value hps {C2P_WRITE_CLOCK_ADD_PHASE} {0.0}
set_instance_parameter_value hps {CALIBRATION_MODE} {Skip}
set_instance_parameter_value hps {CALIB_REG_WIDTH} {8}
set_instance_parameter_value hps {CAN0_Mode} {N/A}
set_instance_parameter_value hps {CAN0_PinMuxing} {Unused}
set_instance_parameter_value hps {CAN1_Mode} {N/A}
set_instance_parameter_value hps {CAN1_PinMuxing} {Unused}
set_instance_parameter_value hps {CFG_DATA_REORDERING_TYPE} {INTER_BANK}
set_instance_parameter_value hps {CFG_REORDER_DATA} {1}
set_instance_parameter_value hps {CFG_TCCD_NS} {2.5}
set_instance_parameter_value hps {COMMAND_PHASE} {0.0}
set_instance_parameter_value hps {CONTROLLER_LATENCY} {5}
set_instance_parameter_value hps {CORE_DEBUG_CONNECTION} {EXPORT}
set_instance_parameter_value hps {CPORT_TYPE_PORT} {Bidirectional Bidirectional Bidirectional Bidirectional Bidirectional Bidirectional}
set_instance_parameter_value hps {CSEL} {0}
set_instance_parameter_value hps {CSEL_EN} {0}
set_instance_parameter_value hps {CTI_Enable} {0}
set_instance_parameter_value hps {CTL_AUTOPCH_EN} {0}
set_instance_parameter_value hps {CTL_CMD_QUEUE_DEPTH} {8}
set_instance_parameter_value hps {CTL_CSR_CONNECTION} {INTERNAL_JTAG}
set_instance_parameter_value hps {CTL_CSR_ENABLED} {0}
set_instance_parameter_value hps {CTL_CSR_READ_ONLY} {1}
set_instance_parameter_value hps {CTL_DEEP_POWERDN_EN} {0}
set_instance_parameter_value hps {CTL_DYNAMIC_BANK_ALLOCATION} {0}
set_instance_parameter_value hps {CTL_DYNAMIC_BANK_NUM} {4}
set_instance_parameter_value hps {CTL_ECC_AUTO_CORRECTION_ENABLED} {0}
set_instance_parameter_value hps {CTL_ECC_ENABLED} {0}
set_instance_parameter_value hps {CTL_ENABLE_BURST_INTERRUPT} {0}
set_instance_parameter_value hps {CTL_ENABLE_BURST_TERMINATE} {0}
set_instance_parameter_value hps {CTL_HRB_ENABLED} {0}
set_instance_parameter_value hps {CTL_LOOK_AHEAD_DEPTH} {4}
set_instance_parameter_value hps {CTL_SELF_REFRESH_EN} {0}
set_instance_parameter_value hps {CTL_USR_REFRESH_EN} {0}
set_instance_parameter_value hps {CTL_ZQCAL_EN} {0}
set_instance_parameter_value hps {CUT_NEW_FAMILY_TIMING} {1}
set_instance_parameter_value hps {DAT_DATA_WIDTH} {32}
set_instance_parameter_value hps {DEBUGAPB_Enable} {0}
set_instance_parameter_value hps {DEBUG_MODE} {0}
set_instance_parameter_value hps {DEVICE_DEPTH} {1}
set_instance_parameter_value hps {DEVICE_FAMILY_PARAM} {}
set_instance_parameter_value hps {DISABLE_CHILD_MESSAGING} {0}
set_instance_parameter_value hps {DISCRETE_FLY_BY} {1}
set_instance_parameter_value hps {DLL_SHARING_MODE} {None}
set_instance_parameter_value hps {DMA_Enable} {No No No No No No No No}
set_instance_parameter_value hps {DQS_DQSN_MODE} {DIFFERENTIAL}
set_instance_parameter_value hps {DQ_INPUT_REG_USE_CLKN} {0}
set_instance_parameter_value hps {DUPLICATE_AC} {0}
set_instance_parameter_value hps {ED_EXPORT_SEQ_DEBUG} {0}
set_instance_parameter_value hps {EMAC0_Mode} {N/A}
set_instance_parameter_value hps {EMAC0_PTP} {0}
set_instance_parameter_value hps {EMAC0_PinMuxing} {Unused}
set_instance_parameter_value hps {EMAC1_Mode} {N/A}
set_instance_parameter_value hps {EMAC1_PTP} {0}
set_instance_parameter_value hps {EMAC1_PinMuxing} {Unused}
set_instance_parameter_value hps {ENABLE_ABS_RAM_MEM_INIT} {0}
set_instance_parameter_value hps {ENABLE_BONDING} {0}
set_instance_parameter_value hps {ENABLE_BURST_MERGE} {0}
set_instance_parameter_value hps {ENABLE_CTRL_AVALON_INTERFACE} {1}
set_instance_parameter_value hps {ENABLE_DELAY_CHAIN_WRITE} {0}
set_instance_parameter_value hps {ENABLE_EMIT_BFM_MASTER} {0}
set_instance_parameter_value hps {ENABLE_EXPORT_SEQ_DEBUG_BRIDGE} {0}
set_instance_parameter_value hps {ENABLE_EXTRA_REPORTING} {0}
set_instance_parameter_value hps {ENABLE_ISS_PROBES} {0}
set_instance_parameter_value hps {ENABLE_NON_DESTRUCTIVE_CALIB} {0}
set_instance_parameter_value hps {ENABLE_NON_DES_CAL} {0}
set_instance_parameter_value hps {ENABLE_NON_DES_CAL_TEST} {0}
set_instance_parameter_value hps {ENABLE_SEQUENCER_MARGINING_ON_BY_DEFAULT} {0}
set_instance_parameter_value hps {ENABLE_USER_ECC} {0}
set_instance_parameter_value hps {EXPORT_AFI_HALF_CLK} {0}
set_instance_parameter_value hps {EXTRA_SETTINGS} {}
set_instance_parameter_value hps {F2SCLK_COLDRST_Enable} {0}
set_instance_parameter_value hps {F2SCLK_DBGRST_Enable} {0}
set_instance_parameter_value hps {F2SCLK_PERIPHCLK_Enable} {0}
set_instance_parameter_value hps {F2SCLK_SDRAMCLK_Enable} {0}
set_instance_parameter_value hps {F2SCLK_WARMRST_Enable} {0}
set_instance_parameter_value hps {F2SDRAM_Type} {}
set_instance_parameter_value hps {F2SDRAM_Width} {}
set_instance_parameter_value hps {F2SINTERRUPT_Enable} {0}
set_instance_parameter_value hps {F2S_Width} {1}
set_instance_parameter_value hps {FIX_READ_LATENCY} {8}
set_instance_parameter_value hps {FORCED_NON_LDC_ADDR_CMD_MEM_CK_INVERT} {0}
set_instance_parameter_value hps {FORCED_NUM_WRITE_FR_CYCLE_SHIFTS} {0}
set_instance_parameter_value hps {FORCE_DQS_TRACKING} {AUTO}
set_instance_parameter_value hps {FORCE_MAX_LATENCY_COUNT_WIDTH} {0}
set_instance_parameter_value hps {FORCE_SEQUENCER_TCL_DEBUG_MODE} {0}
set_instance_parameter_value hps {FORCE_SHADOW_REGS} {AUTO}
set_instance_parameter_value hps {FORCE_SYNTHESIS_LANGUAGE} {}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_GTX_CLK} {125}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_MD_CLK} {2.5}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_GTX_CLK} {125}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_MD_CLK} {2.5}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C0_CLK} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C1_CLK} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C2_CLK} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C3_CLK} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_QSPI_SCLK_OUT} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SDIO_CCLK} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM0_SCLK_OUT} {100}
set_instance_parameter_value hps {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM1_SCLK_OUT} {100}
set_instance_parameter_value hps {GPIO_Enable} {No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No}
set_instance_parameter_value hps {GP_Enable} {0}
set_instance_parameter_value hps {HARD_EMIF} {1}
set_instance_parameter_value hps {HCX_COMPAT_MODE} {0}
set_instance_parameter_value hps {HHP_HPS} {1}
set_instance_parameter_value hps {HHP_HPS_SIMULATION} {0}
set_instance_parameter_value hps {HHP_HPS_VERIFICATION} {0}
set_instance_parameter_value hps {HLGPI_Enable} {0}
set_instance_parameter_value hps {HPS_PROTOCOL} {DDR3}
set_instance_parameter_value hps {I2C0_Mode} {N/A}
set_instance_parameter_value hps {I2C0_PinMuxing} {Unused}
set_instance_parameter_value hps {I2C1_Mode} {N/A}
set_instance_parameter_value hps {I2C1_PinMuxing} {Unused}
set_instance_parameter_value hps {I2C2_Mode} {N/A}
set_instance_parameter_value hps {I2C2_PinMuxing} {Unused}
set_instance_parameter_value hps {I2C3_Mode} {N/A}
set_instance_parameter_value hps {I2C3_PinMuxing} {Unused}
set_instance_parameter_value hps {INCLUDE_BOARD_DELAY_MODEL} {0}
set_instance_parameter_value hps {INCLUDE_MULTIRANK_BOARD_DELAY_MODEL} {0}
set_instance_parameter_value hps {IS_ES_DEVICE} {0}
set_instance_parameter_value hps {LOANIO_Enable} {No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No}
set_instance_parameter_value hps {LOCAL_ID_WIDTH} {8}
set_instance_parameter_value hps {LRDIMM_EXTENDED_CONFIG} {0x000000000000000000}
set_instance_parameter_value hps {LWH2F_Enable} {true}
set_instance_parameter_value hps {MARGIN_VARIATION_TEST} {0}
set_instance_parameter_value hps {MAX_PENDING_RD_CMD} {32}
set_instance_parameter_value hps {MAX_PENDING_WR_CMD} {16}
set_instance_parameter_value hps {MEM_ASR} {Manual}
set_instance_parameter_value hps {MEM_ATCL} {Disabled}
set_instance_parameter_value hps {MEM_AUTO_LEVELING_MODE} {1}
set_instance_parameter_value hps {MEM_BANKADDR_WIDTH} {3}
set_instance_parameter_value hps {MEM_BL} {OTF}
set_instance_parameter_value hps {MEM_BT} {Sequential}
set_instance_parameter_value hps {MEM_CK_PHASE} {0.0}
set_instance_parameter_value hps {MEM_CK_WIDTH} {1}
set_instance_parameter_value hps {MEM_CLK_EN_WIDTH} {1}
set_instance_parameter_value hps {MEM_CLK_FREQ} {400.0}
set_instance_parameter_value hps {MEM_CLK_FREQ_MAX} {400.0}
set_instance_parameter_value hps {MEM_COL_ADDR_WIDTH} {8}
set_instance_parameter_value hps {MEM_CS_WIDTH} {1}
set_instance_parameter_value hps {MEM_DEVICE} {MISSING_MODEL}
set_instance_parameter_value hps {MEM_DLL_EN} {1}
set_instance_parameter_value hps {MEM_DQ_PER_DQS} {8}
set_instance_parameter_value hps {MEM_DQ_WIDTH} {8}
set_instance_parameter_value hps {MEM_DRV_STR} {RZQ/6}
set_instance_parameter_value hps {MEM_FORMAT} {DISCRETE}
set_instance_parameter_value hps {MEM_GUARANTEED_WRITE_INIT} {0}
set_instance_parameter_value hps {MEM_IF_BOARD_BASE_DELAY} {10}
set_instance_parameter_value hps {MEM_IF_DM_PINS_EN} {1}
set_instance_parameter_value hps {MEM_IF_DQSN_EN} {1}
set_instance_parameter_value hps {MEM_IF_SIM_VALID_WINDOW} {0}
set_instance_parameter_value hps {MEM_INIT_EN} {0}
set_instance_parameter_value hps {MEM_INIT_FILE} {}
set_instance_parameter_value hps {MEM_MIRROR_ADDRESSING} {0}
set_instance_parameter_value hps {MEM_NUMBER_OF_DIMMS} {1}
set_instance_parameter_value hps {MEM_NUMBER_OF_RANKS_PER_DEVICE} {1}
set_instance_parameter_value hps {MEM_NUMBER_OF_RANKS_PER_DIMM} {1}
set_instance_parameter_value hps {MEM_PD} {DLL off}
set_instance_parameter_value hps {MEM_RANK_MULTIPLICATION_FACTOR} {1}
set_instance_parameter_value hps {MEM_ROW_ADDR_WIDTH} {12}
set_instance_parameter_value hps {MEM_RTT_NOM} {ODT Disabled}
set_instance_parameter_value hps {MEM_RTT_WR} {Dynamic ODT off}
set_instance_parameter_value hps {MEM_SRT} {Normal}
set_instance_parameter_value hps {MEM_TCL} {7}
set_instance_parameter_value hps {MEM_TFAW_NS} {37.5}
set_instance_parameter_value hps {MEM_TINIT_US} {499}
set_instance_parameter_value hps {MEM_TMRD_CK} {3}
set_instance_parameter_value hps {MEM_TRAS_NS} {40.0}
set_instance_parameter_value hps {MEM_TRCD_NS} {15.0}
set_instance_parameter_value hps {MEM_TREFI_US} {7.0}
set_instance_parameter_value hps {MEM_TRFC_NS} {75.0}
set_instance_parameter_value hps {MEM_TRP_NS} {15.0}
set_instance_parameter_value hps {MEM_TRRD_NS} {7.5}
set_instance_parameter_value hps {MEM_TRTP_NS} {7.5}
set_instance_parameter_value hps {MEM_TWR_NS} {15.0}
set_instance_parameter_value hps {MEM_TWTR} {2}
set_instance_parameter_value hps {MEM_USER_LEVELING_MODE} {Leveling}
set_instance_parameter_value hps {MEM_VENDOR} {JEDEC}
set_instance_parameter_value hps {MEM_VERBOSE} {1}
set_instance_parameter_value hps {MEM_VOLTAGE} {1.5V DDR3}
set_instance_parameter_value hps {MEM_WTCL} {6}
set_instance_parameter_value hps {MPU_EVENTS_Enable} {0}
set_instance_parameter_value hps {MRS_MIRROR_PING_PONG_ATSO} {0}
set_instance_parameter_value hps {MULTICAST_EN} {0}
set_instance_parameter_value hps {NAND_Mode} {N/A}
set_instance_parameter_value hps {NAND_PinMuxing} {Unused}
set_instance_parameter_value hps {NEXTGEN} {1}
set_instance_parameter_value hps {NIOS_ROM_DATA_WIDTH} {32}
set_instance_parameter_value hps {NUM_DLL_SHARING_INTERFACES} {1}
set_instance_parameter_value hps {NUM_EXTRA_REPORT_PATH} {10}
set_instance_parameter_value hps {NUM_OCT_SHARING_INTERFACES} {1}
set_instance_parameter_value hps {NUM_OF_PORTS} {1}
set_instance_parameter_value hps {NUM_PLL_SHARING_INTERFACES} {1}
set_instance_parameter_value hps {OCT_SHARING_MODE} {None}
set_instance_parameter_value hps {P2C_READ_CLOCK_ADD_PHASE} {0.0}
set_instance_parameter_value hps {PACKAGE_DESKEW} {0}
set_instance_parameter_value hps {PARSE_FRIENDLY_DEVICE_FAMILY_PARAM} {}
set_instance_parameter_value hps {PARSE_FRIENDLY_DEVICE_FAMILY_PARAM_VALID} {0}
set_instance_parameter_value hps {PHY_CSR_CONNECTION} {INTERNAL_JTAG}
set_instance_parameter_value hps {PHY_CSR_ENABLED} {0}
set_instance_parameter_value hps {PHY_ONLY} {0}
set_instance_parameter_value hps {PINGPONGPHY_EN} {0}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_ADDR_CMD_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_AFI_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_HALF_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_AFI_PHY_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_C2P_WRITE_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_CLK_PARAM_VALID} {0}
set_instance_parameter_value hps {PLL_CONFIG_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_CONFIG_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_CONFIG_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_CONFIG_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_CONFIG_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_CONFIG_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_DR_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_DR_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_DR_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_DR_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_DR_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_DR_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_HR_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_HR_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_HR_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_HR_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_HR_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_HR_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_LOCATION} {Top_Bottom}
set_instance_parameter_value hps {PLL_MEM_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_MEM_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_MEM_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_MEM_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_MEM_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_MEM_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_NIOS_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_NIOS_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_NIOS_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_NIOS_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_NIOS_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_NIOS_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_P2C_READ_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_SHARING_MODE} {None}
set_instance_parameter_value hps {PLL_WRITE_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps {PLL_WRITE_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps {PLL_WRITE_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps {PLL_WRITE_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps {PLL_WRITE_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps {PLL_WRITE_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps {POWER_OF_TWO_BUS} {0}
set_instance_parameter_value hps {PRIORITY_PORT} {1 1 1 1 1 1}
set_instance_parameter_value hps {QSPI_Mode} {N/A}
set_instance_parameter_value hps {QSPI_PinMuxing} {Unused}
set_instance_parameter_value hps {RATE} {Full}
set_instance_parameter_value hps {RDIMM_CONFIG} {0000000000000000}
set_instance_parameter_value hps {READ_DQ_DQS_CLOCK_SOURCE} {INVERTED_DQS_BUS}
set_instance_parameter_value hps {READ_FIFO_SIZE} {8}
set_instance_parameter_value hps {REFRESH_BURST_VALIDATION} {0}
set_instance_parameter_value hps {REFRESH_INTERVAL} {15000}
set_instance_parameter_value hps {REF_CLK_FREQ} {25.0}
set_instance_parameter_value hps {REF_CLK_FREQ_MAX_PARAM} {0.0}
set_instance_parameter_value hps {REF_CLK_FREQ_MIN_PARAM} {0.0}
set_instance_parameter_value hps {REF_CLK_FREQ_PARAM_VALID} {0}
set_instance_parameter_value hps {S2FCLK_COLDRST_Enable} {0}
set_instance_parameter_value hps {S2FCLK_PENDINGRST_Enable} {0}
set_instance_parameter_value hps {S2FCLK_USER0CLK_Enable} {0}
set_instance_parameter_value hps {S2FCLK_USER1CLK_Enable} {0}
set_instance_parameter_value hps {S2FCLK_USER1CLK_FREQ} {100.0}
set_instance_parameter_value hps {S2FCLK_USER2CLK} {5}
set_instance_parameter_value hps {S2FCLK_USER2CLK_Enable} {0}
set_instance_parameter_value hps {S2FCLK_USER2CLK_FREQ} {100.0}
set_instance_parameter_value hps {S2FINTERRUPT_CAN_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_CLOCKPERIPHERAL_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_CTI_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_DMA_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_EMAC_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_FPGAMANAGER_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_GPIO_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_I2CEMAC_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_I2CPERIPHERAL_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_L4TIMER_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_NAND_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_OSCTIMER_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_QSPI_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_SDMMC_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_SPIMASTER_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_SPISLAVE_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_UART_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_USB_Enable} {0}
set_instance_parameter_value hps {S2FINTERRUPT_WATCHDOG_Enable} {0}
set_instance_parameter_value hps {S2F_Width} {1}
set_instance_parameter_value hps {SDIO_Mode} {N/A}
set_instance_parameter_value hps {SDIO_PinMuxing} {Unused}
set_instance_parameter_value hps {SEQUENCER_TYPE} {NIOS}
set_instance_parameter_value hps {SEQ_MODE} {0}
set_instance_parameter_value hps {SKIP_MEM_INIT} {1}
set_instance_parameter_value hps {SOPC_COMPAT_RESET} {0}
set_instance_parameter_value hps {SPEED_GRADE} {7}
set_instance_parameter_value hps {SPIM0_Mode} {N/A}
set_instance_parameter_value hps {SPIM0_PinMuxing} {Unused}
set_instance_parameter_value hps {SPIM1_Mode} {N/A}
set_instance_parameter_value hps {SPIM1_PinMuxing} {Unused}
set_instance_parameter_value hps {SPIS0_Mode} {N/A}
set_instance_parameter_value hps {SPIS0_PinMuxing} {Unused}
set_instance_parameter_value hps {SPIS1_Mode} {N/A}
set_instance_parameter_value hps {SPIS1_PinMuxing} {Unused}
set_instance_parameter_value hps {STARVE_LIMIT} {10}
set_instance_parameter_value hps {STM_Enable} {0}
set_instance_parameter_value hps {TEST_Enable} {0}
set_instance_parameter_value hps {TIMING_BOARD_AC_EYE_REDUCTION_H} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_AC_EYE_REDUCTION_SU} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_AC_SKEW} {0.02}
set_instance_parameter_value hps {TIMING_BOARD_AC_SLEW_RATE} {1.0}
set_instance_parameter_value hps {TIMING_BOARD_AC_TO_CK_SKEW} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_CK_CKN_SLEW_RATE} {2.0}
set_instance_parameter_value hps {TIMING_BOARD_DELTA_DQS_ARRIVAL_TIME} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_DELTA_READ_DQS_ARRIVAL_TIME} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_DERATE_METHOD} {AUTO}
set_instance_parameter_value hps {TIMING_BOARD_DQS_DQSN_SLEW_RATE} {2.0}
set_instance_parameter_value hps {TIMING_BOARD_DQ_EYE_REDUCTION} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_DQ_SLEW_RATE} {1.0}
set_instance_parameter_value hps {TIMING_BOARD_DQ_TO_DQS_SKEW} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_ISI_METHOD} {AUTO}
set_instance_parameter_value hps {TIMING_BOARD_MAX_CK_DELAY} {0.6}
set_instance_parameter_value hps {TIMING_BOARD_MAX_DQS_DELAY} {0.6}
set_instance_parameter_value hps {TIMING_BOARD_READ_DQ_EYE_REDUCTION} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_SKEW_BETWEEN_DIMMS} {0.05}
set_instance_parameter_value hps {TIMING_BOARD_SKEW_BETWEEN_DQS} {0.02}
set_instance_parameter_value hps {TIMING_BOARD_SKEW_CKDQS_DIMM_MAX} {0.01}
set_instance_parameter_value hps {TIMING_BOARD_SKEW_CKDQS_DIMM_MIN} {-0.01}
set_instance_parameter_value hps {TIMING_BOARD_SKEW_WITHIN_DQS} {0.02}
set_instance_parameter_value hps {TIMING_BOARD_TDH} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_TDS} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_TIH} {0.0}
set_instance_parameter_value hps {TIMING_BOARD_TIS} {0.0}
set_instance_parameter_value hps {TIMING_TDH} {125}
set_instance_parameter_value hps {TIMING_TDQSCK} {400}
set_instance_parameter_value hps {TIMING_TDQSCKDL} {1200}
set_instance_parameter_value hps {TIMING_TDQSCKDM} {900}
set_instance_parameter_value hps {TIMING_TDQSCKDS} {450}
set_instance_parameter_value hps {TIMING_TDQSH} {0.35}
set_instance_parameter_value hps {TIMING_TDQSQ} {120}
set_instance_parameter_value hps {TIMING_TDQSS} {0.25}
set_instance_parameter_value hps {TIMING_TDS} {50}
set_instance_parameter_value hps {TIMING_TDSH} {0.2}
set_instance_parameter_value hps {TIMING_TDSS} {0.2}
set_instance_parameter_value hps {TIMING_TIH} {250}
set_instance_parameter_value hps {TIMING_TIS} {175}
set_instance_parameter_value hps {TIMING_TQH} {0.38}
set_instance_parameter_value hps {TIMING_TQHS} {300}
set_instance_parameter_value hps {TIMING_TQSH} {0.38}
set_instance_parameter_value hps {TPIUFPGA_Enable} {0}
set_instance_parameter_value hps {TPIUFPGA_alt} {0}
set_instance_parameter_value hps {TRACE_Mode} {N/A}
set_instance_parameter_value hps {TRACE_PinMuxing} {Unused}
set_instance_parameter_value hps {TRACKING_ERROR_TEST} {0}
set_instance_parameter_value hps {TRACKING_WATCH_TEST} {0}
set_instance_parameter_value hps {TREFI} {35100}
set_instance_parameter_value hps {TRFC} {350}
set_instance_parameter_value hps {UART0_Mode} {N/A}
set_instance_parameter_value hps {UART0_PinMuxing} {Unused}
set_instance_parameter_value hps {UART1_Mode} {N/A}
set_instance_parameter_value hps {UART1_PinMuxing} {Unused}
set_instance_parameter_value hps {USB0_Mode} {N/A}
set_instance_parameter_value hps {USB0_PinMuxing} {Unused}
set_instance_parameter_value hps {USB1_Mode} {N/A}
set_instance_parameter_value hps {USB1_PinMuxing} {Unused}
set_instance_parameter_value hps {USER_DEBUG_LEVEL} {1}
set_instance_parameter_value hps {USE_AXI_ADAPTOR} {0}
set_instance_parameter_value hps {USE_FAKE_PHY} {0}
set_instance_parameter_value hps {USE_MEM_CLK_FREQ} {0}
set_instance_parameter_value hps {USE_MM_ADAPTOR} {1}
set_instance_parameter_value hps {USE_SEQUENCER_BFM} {0}
set_instance_parameter_value hps {WEIGHT_PORT} {0 0 0 0 0 0}
set_instance_parameter_value hps {WRBUFFER_ADDR_WIDTH} {6}
set_instance_parameter_value hps {can0_clk_div} {1}
set_instance_parameter_value hps {can1_clk_div} {1}
set_instance_parameter_value hps {configure_advanced_parameters} {0}
set_instance_parameter_value hps {customize_device_pll_info} {0}
set_instance_parameter_value hps {dbctrl_stayosc1} {1}
set_instance_parameter_value hps {dbg_at_clk_div} {0}
set_instance_parameter_value hps {dbg_clk_div} {1}
set_instance_parameter_value hps {dbg_trace_clk_div} {0}
set_instance_parameter_value hps {desired_can0_clk_mhz} {100.0}
set_instance_parameter_value hps {desired_can1_clk_mhz} {100.0}
set_instance_parameter_value hps {desired_cfg_clk_mhz} {100.0}
set_instance_parameter_value hps {desired_emac0_clk_mhz} {250.0}
set_instance_parameter_value hps {desired_emac1_clk_mhz} {250.0}
set_instance_parameter_value hps {desired_gpio_db_clk_hz} {32000}
set_instance_parameter_value hps {desired_l4_mp_clk_mhz} {100.0}
set_instance_parameter_value hps {desired_l4_sp_clk_mhz} {100.0}
set_instance_parameter_value hps {desired_mpu_clk_mhz} {800.0}
set_instance_parameter_value hps {desired_nand_clk_mhz} {12.5}
set_instance_parameter_value hps {desired_qspi_clk_mhz} {400.0}
set_instance_parameter_value hps {desired_sdmmc_clk_mhz} {200.0}
set_instance_parameter_value hps {desired_spi_m_clk_mhz} {200.0}
set_instance_parameter_value hps {desired_usb_mp_clk_mhz} {200.0}
set_instance_parameter_value hps {device_pll_info_manual} {{320000000 1600000000} {320000000 1000000000} {800000000 400000000 400000000}}
set_instance_parameter_value hps {eosc1_clk_mhz} {25.0}
set_instance_parameter_value hps {eosc2_clk_mhz} {25.0}
set_instance_parameter_value hps {gpio_db_clk_div} {6249}
set_instance_parameter_value hps {l3_mp_clk_div} {1}
set_instance_parameter_value hps {l3_sp_clk_div} {1}
set_instance_parameter_value hps {l4_mp_clk_div} {1}
set_instance_parameter_value hps {l4_mp_clk_source} {1}
set_instance_parameter_value hps {l4_sp_clk_div} {1}
set_instance_parameter_value hps {l4_sp_clk_source} {1}
set_instance_parameter_value hps {main_pll_c3} {3}
set_instance_parameter_value hps {main_pll_c4} {3}
set_instance_parameter_value hps {main_pll_c5} {15}
set_instance_parameter_value hps {main_pll_m} {63}
set_instance_parameter_value hps {main_pll_n} {0}
set_instance_parameter_value hps {nand_clk_source} {2}
set_instance_parameter_value hps {periph_pll_c0} {3}
set_instance_parameter_value hps {periph_pll_c1} {3}
set_instance_parameter_value hps {periph_pll_c2} {1}
set_instance_parameter_value hps {periph_pll_c3} {19}
set_instance_parameter_value hps {periph_pll_c4} {4}
set_instance_parameter_value hps {periph_pll_c5} {9}
set_instance_parameter_value hps {periph_pll_m} {79}
set_instance_parameter_value hps {periph_pll_n} {1}
set_instance_parameter_value hps {periph_pll_source} {0}
set_instance_parameter_value hps {qspi_clk_source} {1}
set_instance_parameter_value hps {sdmmc_clk_source} {2}
set_instance_parameter_value hps {show_advanced_parameters} {0}
set_instance_parameter_value hps {show_debug_info_as_warning_msg} {0}
set_instance_parameter_value hps {show_warning_as_error_msg} {0}
set_instance_parameter_value hps {spi_m_clk_div} {0}
set_instance_parameter_value hps {usb_mp_clk_div} {0}
set_instance_parameter_value hps {use_default_mpu_clk} {1}

add_instance instr_fifo altera_avalon_fifo 19.1
set_instance_parameter_value instr_fifo {avalonMMAvalonMMDataWidth} {32}
set_instance_parameter_value instr_fifo {avalonMMAvalonSTDataWidth} {32}
set_instance_parameter_value instr_fifo {bitsPerSymbol} {32}
set_instance_parameter_value instr_fifo {channelWidth} {0}
set_instance_parameter_value instr_fifo {errorWidth} {0}
set_instance_parameter_value instr_fifo {fifoDepth} {4096}
set_instance_parameter_value instr_fifo {fifoInputInterfaceOptions} {AVALONST_SINK}
set_instance_parameter_value instr_fifo {fifoOutputInterfaceOptions} {AVALONST_SOURCE}
set_instance_parameter_value instr_fifo {showHiddenFeatures} {0}
set_instance_parameter_value instr_fifo {singleClockMode} {0}
set_instance_parameter_value instr_fifo {singleResetMode} {0}
set_instance_parameter_value instr_fifo {symbolsPerBeat} {1}
set_instance_parameter_value instr_fifo {useBackpressure} {1}
set_instance_parameter_value instr_fifo {useIRQ} {0}
set_instance_parameter_value instr_fifo {usePacket} {0}
set_instance_parameter_value instr_fifo {useReadControl} {1}
set_instance_parameter_value instr_fifo {useRegister} {0}
set_instance_parameter_value instr_fifo {useWriteControl} {1}

add_instance pixel_dma altera_up_avalon_video_pixel_buffer_dma 18.0
set_instance_parameter_value pixel_dma {addr_mode} {Consecutive}
set_instance_parameter_value pixel_dma {back_start_address} {838860800}
set_instance_parameter_value pixel_dma {color_space} {30-bit RGB}
set_instance_parameter_value pixel_dma {image_height} {600}
set_instance_parameter_value pixel_dma {image_width} {800}
set_instance_parameter_value pixel_dma {start_address} {838860800}

add_instance pixel_fifo_mod altera_up_avalon_video_dual_clock_buffer 18.0
set_instance_parameter_value pixel_fifo_mod {color_bits} {10}
set_instance_parameter_value pixel_fifo_mod {color_planes} {3}

add_instance pll altera_pll 19.1
set_instance_parameter_value pll {debug_print_output} {0}
set_instance_parameter_value pll {debug_use_rbc_taf_method} {0}
set_instance_parameter_value pll {gui_active_clk} {0}
set_instance_parameter_value pll {gui_actual_output_clock_frequency0} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency1} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency10} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency11} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency12} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency13} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency14} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency15} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency16} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency17} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency2} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency3} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency4} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency5} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency6} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency7} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency8} {0 MHz}
set_instance_parameter_value pll {gui_actual_output_clock_frequency9} {0 MHz}
set_instance_parameter_value pll {gui_actual_phase_shift0} {0}
set_instance_parameter_value pll {gui_actual_phase_shift1} {0}
set_instance_parameter_value pll {gui_actual_phase_shift10} {0}
set_instance_parameter_value pll {gui_actual_phase_shift11} {0}
set_instance_parameter_value pll {gui_actual_phase_shift12} {0}
set_instance_parameter_value pll {gui_actual_phase_shift13} {0}
set_instance_parameter_value pll {gui_actual_phase_shift14} {0}
set_instance_parameter_value pll {gui_actual_phase_shift15} {0}
set_instance_parameter_value pll {gui_actual_phase_shift16} {0}
set_instance_parameter_value pll {gui_actual_phase_shift17} {0}
set_instance_parameter_value pll {gui_actual_phase_shift2} {0}
set_instance_parameter_value pll {gui_actual_phase_shift3} {0}
set_instance_parameter_value pll {gui_actual_phase_shift4} {0}
set_instance_parameter_value pll {gui_actual_phase_shift5} {0}
set_instance_parameter_value pll {gui_actual_phase_shift6} {0}
set_instance_parameter_value pll {gui_actual_phase_shift7} {0}
set_instance_parameter_value pll {gui_actual_phase_shift8} {0}
set_instance_parameter_value pll {gui_actual_phase_shift9} {0}
set_instance_parameter_value pll {gui_cascade_counter0} {0}
set_instance_parameter_value pll {gui_cascade_counter1} {0}
set_instance_parameter_value pll {gui_cascade_counter10} {0}
set_instance_parameter_value pll {gui_cascade_counter11} {0}
set_instance_parameter_value pll {gui_cascade_counter12} {0}
set_instance_parameter_value pll {gui_cascade_counter13} {0}
set_instance_parameter_value pll {gui_cascade_counter14} {0}
set_instance_parameter_value pll {gui_cascade_counter15} {0}
set_instance_parameter_value pll {gui_cascade_counter16} {0}
set_instance_parameter_value pll {gui_cascade_counter17} {0}
set_instance_parameter_value pll {gui_cascade_counter2} {0}
set_instance_parameter_value pll {gui_cascade_counter3} {0}
set_instance_parameter_value pll {gui_cascade_counter4} {0}
set_instance_parameter_value pll {gui_cascade_counter5} {0}
set_instance_parameter_value pll {gui_cascade_counter6} {0}
set_instance_parameter_value pll {gui_cascade_counter7} {0}
set_instance_parameter_value pll {gui_cascade_counter8} {0}
set_instance_parameter_value pll {gui_cascade_counter9} {0}
set_instance_parameter_value pll {gui_cascade_outclk_index} {0}
set_instance_parameter_value pll {gui_channel_spacing} {0.0}
set_instance_parameter_value pll {gui_clk_bad} {0}
set_instance_parameter_value pll {gui_device_speed_grade} {2}
set_instance_parameter_value pll {gui_divide_factor_c0} {1}
set_instance_parameter_value pll {gui_divide_factor_c1} {1}
set_instance_parameter_value pll {gui_divide_factor_c10} {1}
set_instance_parameter_value pll {gui_divide_factor_c11} {1}
set_instance_parameter_value pll {gui_divide_factor_c12} {1}
set_instance_parameter_value pll {gui_divide_factor_c13} {1}
set_instance_parameter_value pll {gui_divide_factor_c14} {1}
set_instance_parameter_value pll {gui_divide_factor_c15} {1}
set_instance_parameter_value pll {gui_divide_factor_c16} {1}
set_instance_parameter_value pll {gui_divide_factor_c17} {1}
set_instance_parameter_value pll {gui_divide_factor_c2} {1}
set_instance_parameter_value pll {gui_divide_factor_c3} {1}
set_instance_parameter_value pll {gui_divide_factor_c4} {1}
set_instance_parameter_value pll {gui_divide_factor_c5} {1}
set_instance_parameter_value pll {gui_divide_factor_c6} {1}
set_instance_parameter_value pll {gui_divide_factor_c7} {1}
set_instance_parameter_value pll {gui_divide_factor_c8} {1}
set_instance_parameter_value pll {gui_divide_factor_c9} {1}
set_instance_parameter_value pll {gui_divide_factor_n} {1}
set_instance_parameter_value pll {gui_dps_cntr} {C0}
set_instance_parameter_value pll {gui_dps_dir} {Positive}
set_instance_parameter_value pll {gui_dps_num} {1}
set_instance_parameter_value pll {gui_dsm_out_sel} {1st_order}
set_instance_parameter_value pll {gui_duty_cycle0} {50}
set_instance_parameter_value pll {gui_duty_cycle1} {50}
set_instance_parameter_value pll {gui_duty_cycle10} {50}
set_instance_parameter_value pll {gui_duty_cycle11} {50}
set_instance_parameter_value pll {gui_duty_cycle12} {50}
set_instance_parameter_value pll {gui_duty_cycle13} {50}
set_instance_parameter_value pll {gui_duty_cycle14} {50}
set_instance_parameter_value pll {gui_duty_cycle15} {50}
set_instance_parameter_value pll {gui_duty_cycle16} {50}
set_instance_parameter_value pll {gui_duty_cycle17} {50}
set_instance_parameter_value pll {gui_duty_cycle2} {50}
set_instance_parameter_value pll {gui_duty_cycle3} {50}
set_instance_parameter_value pll {gui_duty_cycle4} {50}
set_instance_parameter_value pll {gui_duty_cycle5} {50}
set_instance_parameter_value pll {gui_duty_cycle6} {50}
set_instance_parameter_value pll {gui_duty_cycle7} {50}
set_instance_parameter_value pll {gui_duty_cycle8} {50}
set_instance_parameter_value pll {gui_duty_cycle9} {50}
set_instance_parameter_value pll {gui_en_adv_params} {0}
set_instance_parameter_value pll {gui_en_dps_ports} {0}
set_instance_parameter_value pll {gui_en_phout_ports} {0}
set_instance_parameter_value pll {gui_en_reconf} {0}
set_instance_parameter_value pll {gui_enable_cascade_in} {0}
set_instance_parameter_value pll {gui_enable_cascade_out} {0}
set_instance_parameter_value pll {gui_enable_mif_dps} {0}
set_instance_parameter_value pll {gui_feedback_clock} {Global Clock}
set_instance_parameter_value pll {gui_frac_multiply_factor} {1.0}
set_instance_parameter_value pll {gui_fractional_cout} {32}
set_instance_parameter_value pll {gui_mif_generate} {0}
set_instance_parameter_value pll {gui_multiply_factor} {1}
set_instance_parameter_value pll {gui_number_of_clocks} {2}
set_instance_parameter_value pll {gui_operation_mode} {normal}
set_instance_parameter_value pll {gui_output_clock_frequency0} {143.0}
set_instance_parameter_value pll {gui_output_clock_frequency1} {143.0}
set_instance_parameter_value pll {gui_output_clock_frequency10} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency11} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency12} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency13} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency14} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency15} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency16} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency17} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency2} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency3} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency4} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency5} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency6} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency7} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency8} {100.0}
set_instance_parameter_value pll {gui_output_clock_frequency9} {100.0}
set_instance_parameter_value pll {gui_phase_shift0} {0}
set_instance_parameter_value pll {gui_phase_shift1} {0}
set_instance_parameter_value pll {gui_phase_shift10} {0}
set_instance_parameter_value pll {gui_phase_shift11} {0}
set_instance_parameter_value pll {gui_phase_shift12} {0}
set_instance_parameter_value pll {gui_phase_shift13} {0}
set_instance_parameter_value pll {gui_phase_shift14} {0}
set_instance_parameter_value pll {gui_phase_shift15} {0}
set_instance_parameter_value pll {gui_phase_shift16} {0}
set_instance_parameter_value pll {gui_phase_shift17} {0}
set_instance_parameter_value pll {gui_phase_shift2} {0}
set_instance_parameter_value pll {gui_phase_shift3} {0}
set_instance_parameter_value pll {gui_phase_shift4} {0}
set_instance_parameter_value pll {gui_phase_shift5} {0}
set_instance_parameter_value pll {gui_phase_shift6} {0}
set_instance_parameter_value pll {gui_phase_shift7} {0}
set_instance_parameter_value pll {gui_phase_shift8} {0}
set_instance_parameter_value pll {gui_phase_shift9} {0}
set_instance_parameter_value pll {gui_phase_shift_deg0} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg1} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg10} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg11} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg12} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg13} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg14} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg15} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg16} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg17} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg2} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg3} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg4} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg5} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg6} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg7} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg8} {0.0}
set_instance_parameter_value pll {gui_phase_shift_deg9} {0.0}
set_instance_parameter_value pll {gui_phout_division} {1}
set_instance_parameter_value pll {gui_pll_auto_reset} {Off}
set_instance_parameter_value pll {gui_pll_bandwidth_preset} {High}
set_instance_parameter_value pll {gui_pll_cascading_mode} {Create an adjpllin signal to connect with an upstream PLL}
set_instance_parameter_value pll {gui_pll_mode} {Integer-N PLL}
set_instance_parameter_value pll {gui_ps_units0} {ps}
set_instance_parameter_value pll {gui_ps_units1} {ps}
set_instance_parameter_value pll {gui_ps_units10} {ps}
set_instance_parameter_value pll {gui_ps_units11} {ps}
set_instance_parameter_value pll {gui_ps_units12} {ps}
set_instance_parameter_value pll {gui_ps_units13} {ps}
set_instance_parameter_value pll {gui_ps_units14} {ps}
set_instance_parameter_value pll {gui_ps_units15} {ps}
set_instance_parameter_value pll {gui_ps_units16} {ps}
set_instance_parameter_value pll {gui_ps_units17} {ps}
set_instance_parameter_value pll {gui_ps_units2} {ps}
set_instance_parameter_value pll {gui_ps_units3} {ps}
set_instance_parameter_value pll {gui_ps_units4} {ps}
set_instance_parameter_value pll {gui_ps_units5} {ps}
set_instance_parameter_value pll {gui_ps_units6} {ps}
set_instance_parameter_value pll {gui_ps_units7} {ps}
set_instance_parameter_value pll {gui_ps_units8} {ps}
set_instance_parameter_value pll {gui_ps_units9} {ps}
set_instance_parameter_value pll {gui_refclk1_frequency} {100.0}
set_instance_parameter_value pll {gui_refclk_switch} {0}
set_instance_parameter_value pll {gui_reference_clock_frequency} {50.0}
set_instance_parameter_value pll {gui_switchover_delay} {0}
set_instance_parameter_value pll {gui_switchover_mode} {Automatic Switchover}
set_instance_parameter_value pll {gui_use_locked} {0}

add_instance prim_assembly_fifo altera_avalon_fifo 19.1
set_instance_parameter_value prim_assembly_fifo {avalonMMAvalonMMDataWidth} {32}
set_instance_parameter_value prim_assembly_fifo {avalonMMAvalonSTDataWidth} {32}
set_instance_parameter_value prim_assembly_fifo {bitsPerSymbol} {32}
set_instance_parameter_value prim_assembly_fifo {channelWidth} {0}
set_instance_parameter_value prim_assembly_fifo {errorWidth} {0}
set_instance_parameter_value prim_assembly_fifo {fifoDepth} {4096}
set_instance_parameter_value prim_assembly_fifo {fifoInputInterfaceOptions} {AVALONST_SINK}
set_instance_parameter_value prim_assembly_fifo {fifoOutputInterfaceOptions} {AVALONST_SOURCE}
set_instance_parameter_value prim_assembly_fifo {showHiddenFeatures} {0}
set_instance_parameter_value prim_assembly_fifo {singleClockMode} {0}
set_instance_parameter_value prim_assembly_fifo {singleResetMode} {0}
set_instance_parameter_value prim_assembly_fifo {symbolsPerBeat} {1}
set_instance_parameter_value prim_assembly_fifo {useBackpressure} {1}
set_instance_parameter_value prim_assembly_fifo {useIRQ} {0}
set_instance_parameter_value prim_assembly_fifo {usePacket} {0}
set_instance_parameter_value prim_assembly_fifo {useReadControl} {1}
set_instance_parameter_value prim_assembly_fifo {useRegister} {0}
set_instance_parameter_value prim_assembly_fifo {useWriteControl} {1}

add_instance raster_fifo altera_avalon_fifo 19.1
set_instance_parameter_value raster_fifo {avalonMMAvalonMMDataWidth} {32}
set_instance_parameter_value raster_fifo {avalonMMAvalonSTDataWidth} {32}
set_instance_parameter_value raster_fifo {bitsPerSymbol} {32}
set_instance_parameter_value raster_fifo {channelWidth} {0}
set_instance_parameter_value raster_fifo {errorWidth} {0}
set_instance_parameter_value raster_fifo {fifoDepth} {4096}
set_instance_parameter_value raster_fifo {fifoInputInterfaceOptions} {AVALONST_SINK}
set_instance_parameter_value raster_fifo {fifoOutputInterfaceOptions} {AVALONST_SOURCE}
set_instance_parameter_value raster_fifo {showHiddenFeatures} {0}
set_instance_parameter_value raster_fifo {singleClockMode} {0}
set_instance_parameter_value raster_fifo {singleResetMode} {0}
set_instance_parameter_value raster_fifo {symbolsPerBeat} {1}
set_instance_parameter_value raster_fifo {useBackpressure} {1}
set_instance_parameter_value raster_fifo {useIRQ} {0}
set_instance_parameter_value raster_fifo {usePacket} {0}
set_instance_parameter_value raster_fifo {useReadControl} {1}
set_instance_parameter_value raster_fifo {useRegister} {0}
set_instance_parameter_value raster_fifo {useWriteControl} {1}

add_instance reset_bridge altera_reset_bridge 19.1
set_instance_parameter_value reset_bridge {ACTIVE_LOW_RESET} {0}
set_instance_parameter_value reset_bridge {NUM_RESET_OUTPUTS} {2}
set_instance_parameter_value reset_bridge {SYNCHRONOUS_EDGES} {deassert}
set_instance_parameter_value reset_bridge {USE_RESET_REQUEST} {0}

add_instance vert_processing_fifo altera_avalon_fifo 19.1
set_instance_parameter_value vert_processing_fifo {avalonMMAvalonMMDataWidth} {32}
set_instance_parameter_value vert_processing_fifo {avalonMMAvalonSTDataWidth} {32}
set_instance_parameter_value vert_processing_fifo {bitsPerSymbol} {32}
set_instance_parameter_value vert_processing_fifo {channelWidth} {0}
set_instance_parameter_value vert_processing_fifo {errorWidth} {0}
set_instance_parameter_value vert_processing_fifo {fifoDepth} {4096}
set_instance_parameter_value vert_processing_fifo {fifoInputInterfaceOptions} {AVALONST_SINK}
set_instance_parameter_value vert_processing_fifo {fifoOutputInterfaceOptions} {AVALONST_SOURCE}
set_instance_parameter_value vert_processing_fifo {showHiddenFeatures} {0}
set_instance_parameter_value vert_processing_fifo {singleClockMode} {0}
set_instance_parameter_value vert_processing_fifo {singleResetMode} {0}
set_instance_parameter_value vert_processing_fifo {symbolsPerBeat} {1}
set_instance_parameter_value vert_processing_fifo {useBackpressure} {1}
set_instance_parameter_value vert_processing_fifo {useIRQ} {0}
set_instance_parameter_value vert_processing_fifo {usePacket} {0}
set_instance_parameter_value vert_processing_fifo {useReadControl} {1}
set_instance_parameter_value vert_processing_fifo {useRegister} {0}
set_instance_parameter_value vert_processing_fifo {useWriteControl} {1}

add_instance vga_controller altera_up_avalon_video_vga_controller 18.0
set_instance_parameter_value vga_controller {board} {DE1-SoC}
set_instance_parameter_value vga_controller {device} {VGA Connector}
set_instance_parameter_value vga_controller {resolution} {SVGA 800x600}
set_instance_parameter_value vga_controller {underflow_flag} {0}

add_instance video_pll altera_up_avalon_video_pll 18.0
set_instance_parameter_value video_pll {camera} {5MP Digital Camera (THDB_D5M)}
set_instance_parameter_value video_pll {gui_refclk} {50.0}
set_instance_parameter_value video_pll {gui_resolution} {SVGA 800x600}
set_instance_parameter_value video_pll {lcd} {7" LCD on VEEK-MT and MTL/MTL2 Modules}
set_instance_parameter_value video_pll {lcd_clk_en} {0}
set_instance_parameter_value video_pll {vga_clk_en} {1}
set_instance_parameter_value video_pll {video_in_clk_en} {0}

# exported interfaces
add_interface clk clock sink
set_interface_property clk EXPORT_OF pll.refclk
add_interface gpu_main_external_interface conduit end
set_interface_property gpu_main_external_interface EXPORT_OF gpu_main.external_interface
add_interface instr_fifo_in avalon_streaming sink
set_interface_property instr_fifo_in EXPORT_OF instr_fifo.in
add_interface instr_fifo_out avalon_streaming source
set_interface_property instr_fifo_out EXPORT_OF instr_fifo.out
add_interface memory conduit end
set_interface_property memory EXPORT_OF hps.memory
add_interface pll_outclk clock source
set_interface_property pll_outclk EXPORT_OF pll.outclk1
add_interface prim_assembly_fifo_in avalon_streaming sink
set_interface_property prim_assembly_fifo_in EXPORT_OF prim_assembly_fifo.in
add_interface prim_assembly_fifo_out avalon_streaming source
set_interface_property prim_assembly_fifo_out EXPORT_OF prim_assembly_fifo.out
add_interface raster_fifo_in avalon_streaming sink
set_interface_property raster_fifo_in EXPORT_OF raster_fifo.in
add_interface raster_fifo_out avalon_streaming source
set_interface_property raster_fifo_out EXPORT_OF raster_fifo.out
add_interface reset_in reset sink
set_interface_property reset_in EXPORT_OF reset_bridge.in_reset
add_interface reset_out1 reset source
set_interface_property reset_out1 EXPORT_OF reset_bridge.out_reset_1
add_interface vert_processing_fifo_in avalon_streaming sink
set_interface_property vert_processing_fifo_in EXPORT_OF vert_processing_fifo.in
add_interface vert_processing_fifo_out avalon_streaming source
set_interface_property vert_processing_fifo_out EXPORT_OF vert_processing_fifo.out
add_interface vga_controller_external_interface conduit end
set_interface_property vga_controller_external_interface EXPORT_OF vga_controller.external_interface
add_interface video_pll_ref_clk clock sink
set_interface_property video_pll_ref_clk EXPORT_OF video_pll.ref_clk

# connections and connection parameters
add_connection address_span_extender.expanded_master hps.f2h_axi_slave
set_connection_parameter_value address_span_extender.expanded_master/hps.f2h_axi_slave arbitrationPriority {1}
set_connection_parameter_value address_span_extender.expanded_master/hps.f2h_axi_slave baseAddress {0x0000}
set_connection_parameter_value address_span_extender.expanded_master/hps.f2h_axi_slave defaultConnection {0}

add_connection gpu_main.avalon_master address_span_extender.windowed_slave
set_connection_parameter_value gpu_main.avalon_master/address_span_extender.windowed_slave arbitrationPriority {1}
set_connection_parameter_value gpu_main.avalon_master/address_span_extender.windowed_slave baseAddress {0x0000}
set_connection_parameter_value gpu_main.avalon_master/address_span_extender.windowed_slave defaultConnection {0}

add_connection hps.h2f_axi_master instr_fifo.in_csr
set_connection_parameter_value hps.h2f_axi_master/instr_fifo.in_csr arbitrationPriority {1}
set_connection_parameter_value hps.h2f_axi_master/instr_fifo.in_csr baseAddress {0x0060}
set_connection_parameter_value hps.h2f_axi_master/instr_fifo.in_csr defaultConnection {0}

add_connection hps.h2f_axi_master pixel_dma.avalon_control_slave
set_connection_parameter_value hps.h2f_axi_master/pixel_dma.avalon_control_slave arbitrationPriority {1}
set_connection_parameter_value hps.h2f_axi_master/pixel_dma.avalon_control_slave baseAddress {0x0080}
set_connection_parameter_value hps.h2f_axi_master/pixel_dma.avalon_control_slave defaultConnection {0}

add_connection hps.h2f_axi_master prim_assembly_fifo.out_csr
set_connection_parameter_value hps.h2f_axi_master/prim_assembly_fifo.out_csr arbitrationPriority {1}
set_connection_parameter_value hps.h2f_axi_master/prim_assembly_fifo.out_csr baseAddress {0x0000}
set_connection_parameter_value hps.h2f_axi_master/prim_assembly_fifo.out_csr defaultConnection {0}

add_connection hps.h2f_axi_master raster_fifo.out_csr
set_connection_parameter_value hps.h2f_axi_master/raster_fifo.out_csr arbitrationPriority {1}
set_connection_parameter_value hps.h2f_axi_master/raster_fifo.out_csr baseAddress {0x0040}
set_connection_parameter_value hps.h2f_axi_master/raster_fifo.out_csr defaultConnection {0}

add_connection hps.h2f_axi_master vert_processing_fifo.out_csr
set_connection_parameter_value hps.h2f_axi_master/vert_processing_fifo.out_csr arbitrationPriority {1}
set_connection_parameter_value hps.h2f_axi_master/vert_processing_fifo.out_csr baseAddress {0x0020}
set_connection_parameter_value hps.h2f_axi_master/vert_processing_fifo.out_csr defaultConnection {0}

add_connection hps.h2f_reset address_span_extender.reset

add_connection hps.h2f_reset gpu_main.reset

add_connection hps.h2f_reset instr_fifo.reset_in

add_connection hps.h2f_reset instr_fifo.reset_out

add_connection hps.h2f_reset pixel_dma.reset

add_connection hps.h2f_reset pixel_fifo_mod.reset_stream_in

add_connection hps.h2f_reset pixel_fifo_mod.reset_stream_out

add_connection hps.h2f_reset prim_assembly_fifo.reset_in

add_connection hps.h2f_reset prim_assembly_fifo.reset_out

add_connection hps.h2f_reset raster_fifo.reset_in

add_connection hps.h2f_reset raster_fifo.reset_out

add_connection hps.h2f_reset vert_processing_fifo.reset_in

add_connection hps.h2f_reset vert_processing_fifo.reset_out

add_connection hps.h2f_reset vga_controller.reset

add_connection hps.h2f_reset video_pll.ref_reset

add_connection pixel_dma.avalon_pixel_dma_master hps.f2h_axi_slave
set_connection_parameter_value pixel_dma.avalon_pixel_dma_master/hps.f2h_axi_slave arbitrationPriority {1}
set_connection_parameter_value pixel_dma.avalon_pixel_dma_master/hps.f2h_axi_slave baseAddress {0x0000}
set_connection_parameter_value pixel_dma.avalon_pixel_dma_master/hps.f2h_axi_slave defaultConnection {0}

add_connection pixel_dma.avalon_pixel_source pixel_fifo_mod.avalon_dc_buffer_sink

add_connection pixel_fifo_mod.avalon_dc_buffer_source vga_controller.avalon_vga_sink

add_connection pll.outclk0 address_span_extender.clock

add_connection pll.outclk0 gpu_main.clk

add_connection pll.outclk0 hps.f2h_axi_clock

add_connection pll.outclk0 hps.h2f_axi_clock

add_connection pll.outclk0 hps.h2f_lw_axi_clock

add_connection pll.outclk0 instr_fifo.clk_in

add_connection pll.outclk0 instr_fifo.clk_out

add_connection pll.outclk0 pixel_dma.clk

add_connection pll.outclk0 pixel_fifo_mod.clock_stream_in

add_connection pll.outclk0 prim_assembly_fifo.clk_in

add_connection pll.outclk0 prim_assembly_fifo.clk_out

add_connection pll.outclk0 raster_fifo.clk_in

add_connection pll.outclk0 raster_fifo.clk_out

add_connection pll.outclk0 reset_bridge.clk

add_connection pll.outclk0 vert_processing_fifo.clk_in

add_connection pll.outclk0 vert_processing_fifo.clk_out

add_connection reset_bridge.out_reset address_span_extender.reset

add_connection reset_bridge.out_reset gpu_main.reset

add_connection reset_bridge.out_reset instr_fifo.reset_in

add_connection reset_bridge.out_reset instr_fifo.reset_out

add_connection reset_bridge.out_reset pixel_dma.reset

add_connection reset_bridge.out_reset pixel_fifo_mod.reset_stream_in

add_connection reset_bridge.out_reset pll.reset

add_connection reset_bridge.out_reset prim_assembly_fifo.reset_in

add_connection reset_bridge.out_reset prim_assembly_fifo.reset_out

add_connection reset_bridge.out_reset raster_fifo.reset_in

add_connection reset_bridge.out_reset raster_fifo.reset_out

add_connection reset_bridge.out_reset vert_processing_fifo.reset_in

add_connection reset_bridge.out_reset vert_processing_fifo.reset_out

add_connection reset_bridge.out_reset video_pll.ref_reset

add_connection video_pll.reset_source pixel_fifo_mod.reset_stream_out

add_connection video_pll.reset_source vga_controller.reset

add_connection video_pll.vga_clk pixel_fifo_mod.clock_stream_out

add_connection video_pll.vga_clk vga_controller.clk

# interconnect requirements
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}

save_system {gpu_qsys.qsys}
