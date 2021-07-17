set_global_assignment -entity "altfp_2int" -library "lib_altfp_2int" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "altfp_2int" -library "lib_altfp_2int" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "altfp_2int" -library "lib_altfp_2int" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_altfp_2int" -name SPD_FILE [file join $::quartus(sip_path) "altfp_2int.spd"]

set_global_assignment -library "lib_altfp_2int" -name MISC_FILE [file join $::quartus(sip_path) "altfp_2int_sim/altfp_2int.vo"]
