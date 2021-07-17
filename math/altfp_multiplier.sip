set_global_assignment -entity "altfp_multiplier" -library "lib_altfp_multiplier" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "altfp_multiplier" -library "lib_altfp_multiplier" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "altfp_multiplier" -library "lib_altfp_multiplier" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_altfp_multiplier" -name SPD_FILE [file join $::quartus(sip_path) "altfp_multiplier.spd"]

set_global_assignment -library "lib_altfp_multiplier" -name MISC_FILE [file join $::quartus(sip_path) "altfp_multiplier_sim/altfp_multiplier.vo"]
