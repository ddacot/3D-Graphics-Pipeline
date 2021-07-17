set_global_assignment -entity "altfp_muladd" -library "lib_altfp_muladd" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "altfp_muladd" -library "lib_altfp_muladd" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "altfp_muladd" -library "lib_altfp_muladd" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_altfp_muladd" -name SPD_FILE [file join $::quartus(sip_path) "altfp_muladd.spd"]

set_global_assignment -library "lib_altfp_muladd" -name MISC_FILE [file join $::quartus(sip_path) "altfp_muladd_sim/altfp_muladd.vo"]
