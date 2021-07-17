
module gpu_qsys (
	clk_clk,
	gpu_main_external_interface_address,
	gpu_main_external_interface_byte_enable,
	gpu_main_external_interface_read,
	gpu_main_external_interface_write,
	gpu_main_external_interface_write_data,
	gpu_main_external_interface_acknowledge,
	gpu_main_external_interface_read_data,
	instr_fifo_in_valid,
	instr_fifo_in_data,
	instr_fifo_in_ready,
	instr_fifo_out_valid,
	instr_fifo_out_data,
	instr_fifo_out_ready,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	pll_outclk_clk,
	prim_assembly_fifo_in_valid,
	prim_assembly_fifo_in_data,
	prim_assembly_fifo_in_ready,
	prim_assembly_fifo_out_valid,
	prim_assembly_fifo_out_data,
	prim_assembly_fifo_out_ready,
	raster_fifo_in_valid,
	raster_fifo_in_data,
	raster_fifo_in_ready,
	raster_fifo_out_valid,
	raster_fifo_out_data,
	raster_fifo_out_ready,
	reset_in_reset,
	reset_out1_reset,
	vert_processing_fifo_in_valid,
	vert_processing_fifo_in_data,
	vert_processing_fifo_in_ready,
	vert_processing_fifo_out_valid,
	vert_processing_fifo_out_data,
	vert_processing_fifo_out_ready,
	vga_controller_external_interface_CLK,
	vga_controller_external_interface_HS,
	vga_controller_external_interface_VS,
	vga_controller_external_interface_BLANK,
	vga_controller_external_interface_SYNC,
	vga_controller_external_interface_R,
	vga_controller_external_interface_G,
	vga_controller_external_interface_B,
	video_pll_ref_clk_clk);	

	input		clk_clk;
	input	[29:0]	gpu_main_external_interface_address;
	input	[3:0]	gpu_main_external_interface_byte_enable;
	input		gpu_main_external_interface_read;
	input		gpu_main_external_interface_write;
	input	[31:0]	gpu_main_external_interface_write_data;
	output		gpu_main_external_interface_acknowledge;
	output	[31:0]	gpu_main_external_interface_read_data;
	input		instr_fifo_in_valid;
	input	[31:0]	instr_fifo_in_data;
	output		instr_fifo_in_ready;
	output		instr_fifo_out_valid;
	output	[31:0]	instr_fifo_out_data;
	input		instr_fifo_out_ready;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[7:0]	memory_mem_dq;
	inout		memory_mem_dqs;
	inout		memory_mem_dqs_n;
	output		memory_mem_odt;
	output		memory_mem_dm;
	input		memory_oct_rzqin;
	output		pll_outclk_clk;
	input		prim_assembly_fifo_in_valid;
	input	[31:0]	prim_assembly_fifo_in_data;
	output		prim_assembly_fifo_in_ready;
	output		prim_assembly_fifo_out_valid;
	output	[31:0]	prim_assembly_fifo_out_data;
	input		prim_assembly_fifo_out_ready;
	input		raster_fifo_in_valid;
	input	[31:0]	raster_fifo_in_data;
	output		raster_fifo_in_ready;
	output		raster_fifo_out_valid;
	output	[31:0]	raster_fifo_out_data;
	input		raster_fifo_out_ready;
	input		reset_in_reset;
	output		reset_out1_reset;
	input		vert_processing_fifo_in_valid;
	input	[31:0]	vert_processing_fifo_in_data;
	output		vert_processing_fifo_in_ready;
	output		vert_processing_fifo_out_valid;
	output	[31:0]	vert_processing_fifo_out_data;
	input		vert_processing_fifo_out_ready;
	output		vga_controller_external_interface_CLK;
	output		vga_controller_external_interface_HS;
	output		vga_controller_external_interface_VS;
	output		vga_controller_external_interface_BLANK;
	output		vga_controller_external_interface_SYNC;
	output	[7:0]	vga_controller_external_interface_R;
	output	[7:0]	vga_controller_external_interface_G;
	output	[7:0]	vga_controller_external_interface_B;
	input		video_pll_ref_clk_clk;
endmodule
