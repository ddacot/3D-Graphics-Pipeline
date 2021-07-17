set_global_assignment -entity "altfp_addsub" -library "lib_altfp_addsub" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "altfp_addsub" -library "lib_altfp_addsub" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "altfp_addsub" -library "lib_altfp_addsub" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_altfp_addsub" -name SPD_FILE [file join $::quartus(sip_path) "altfp_addsub.spd"]

set_global_assignment -library "lib_altfp_addsub" -name MISC_FILE [file join $::quartus(sip_path) "altfp_addsub_sim/altfp_addsub.vo"]
