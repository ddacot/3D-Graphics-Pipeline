set_false_path -from [get_ports hps_io_hps_io_uart0_inst_RX] -to *
set_false_path -from * -to [get_ports hps_io_hps_io_uart0_inst_TX]
set_false_path -from [get_ports hps_io_hps_io_uart0_inst_CTS] -to *
set_false_path -from * -to [get_ports hps_io_hps_io_uart0_inst_RTS]