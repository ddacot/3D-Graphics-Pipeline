`include "global_parameters.vh"

module gpu_qsys_inst(
	input  wire        clk_clk,                               
	input  wire        reset_reset,
	output wire [12:0] memory_mem_a,                            
	output wire [2:0]  memory_mem_ba,                           
	output wire        memory_mem_ck,                           
	output wire        memory_mem_ck_n,                         
	output wire        memory_mem_cke,                          
	output wire        memory_mem_cs_n,                         
	output wire        memory_mem_ras_n,                        
	output wire        memory_mem_cas_n,                        
	output wire        memory_mem_we_n,                         
	output wire        memory_mem_reset_n,                      
	inout  wire [7:0]  memory_mem_dq,                           
	inout  wire        memory_mem_dqs,                          
	inout  wire        memory_mem_dqs_n,                        
	output wire        memory_mem_odt,                          
	output wire        memory_mem_dm,                           
	input  wire        memory_oct_rzqin,                        
	output wire        vga_controller_external_interface_CLK,            
	output wire        vga_controller_external_interface_HS,             
	output wire        vga_controller_external_interface_VS,             
	output wire        vga_controller_external_interface_BLANK,          
	output wire        vga_controller_external_interface_SYNC,           
	output wire [7:0]  vga_controller_external_interface_R,              
	output wire [7:0]  vga_controller_external_interface_G,             
	output wire [7:0]  vga_controller_external_interface_B,             
	input  wire        video_pll_ref_clk_clk,                             
	input  wire        instr_fifo_in_valid,                    
	input  wire [31:0] instr_fifo_in_data,                      
	output wire        instr_fifo_in_ready                    

);

	/* ===================== WIRES ===================== */
	wire 			pll_clock;
	wire 			sys_reset;
	
	wire [29:0] 	gpu_main_external_interface_address;     
	wire [3:0]  	gpu_main_external_interface_byte_enable;
	wire        	gpu_main_external_interface_read;        
	wire        	gpu_main_external_interface_write;       
	wire [31:0] 	gpu_main_external_interface_write_data;  
	wire       		gpu_main_external_interface_acknowledge; 
	wire [31:0]		gpu_main_external_interface_read_data ;
	
	/* ================================================== */
	
	wire        	instr_fifo_out_valid;                   
	wire [31:0] 	instr_fifo_out_data;                     
	reg         	instr_fifo_out_ready;                 
	
	wire 			vert_processing_fifo_out_valid;       
	wire [31:0] 	vert_processing_fifo_out_data;                     
	wire			vert_processing_fifo_out_ready;

	reg 			vert_processing_fifo_in_valid;          
	reg [31:0]  	vert_processing_fifo_in_data;         
	wire			vert_processing_fifo_in_ready;

	wire 			prim_assembly_fifo_out_valid;          
	wire [31:0] 	prim_assembly_fifo_out_data;                                        
	wire			prim_assembly_fifo_out_ready; 

	wire 			prim_assembly_fifo_in_valid;            
	wire [31:0] 	prim_assembly_fifo_in_data;            
	wire			prim_assembly_fifo_in_ready; 
	
	wire 		 	raster_fifo_out_valid;            
	wire [31:0] 	raster_fifo_out_data;            
	wire		 	raster_fifo_out_ready; 

	wire 		 	raster_fifo_in_valid;         
	wire [31:0] 	raster_fifo_in_data;           
	wire		 	raster_fifo_in_ready; 

	gpu_sm g1(

		.pll_clock(pll_clock),
        .sys_reset(sys_reset),

        .instr_fifo_out_valid(instr_fifo_out_valid),                   
        .instr_fifo_out_data(instr_fifo_out_data),                     
        .instr_fifo_out_ready(instr_fifo_out_ready),    

        .vert_processing_fifo_in_valid(vert_processing_fifo_in_valid),          
        .vert_processing_fifo_in_data(vert_processing_fifo_in_data),         
        .vert_processing_fifo_in_ready(vert_processing_fifo_in_ready)
	);

   	raster r1(
		.pll_clock								(pll_clock), 
		.sys_reset								(sys_reset), 
		.gpu_main_external_interface_address	(gpu_main_external_interface_address),     
    	.gpu_main_external_interface_byte_enable(gpu_main_external_interface_byte_enable), 
    	.gpu_main_external_interface_read		(gpu_main_external_interface_read),        
    	.gpu_main_external_interface_write		(gpu_main_external_interface_write),       
    	.gpu_main_external_interface_write_data	(gpu_main_external_interface_write_data),  
    	.gpu_main_external_interface_acknowledge(gpu_main_external_interface_acknowledge), 
    	.gpu_main_external_interface_read_data	(gpu_main_external_interface_read_data), 
		.raster_fifo_out_valid					(raster_fifo_out_valid),                    
		.raster_fifo_out_data					(raster_fifo_out_data),                   
		.raster_fifo_out_ready					(raster_fifo_out_ready)
	);
	
	 vert_processing v1(
		.pll_clock								(pll_clock), 
		.sys_reset								(sys_reset), 
		.prim_assembly_fifo_in_valid			(prim_assembly_fifo_in_valid),                    
		.prim_assembly_fifo_in_data				(prim_assembly_fifo_in_data),                    
		.prim_assembly_fifo_in_ready			(prim_assembly_fifo_in_ready),
		.vert_processing_fifo_out_valid			(vert_processing_fifo_out_valid),                  
		.vert_processing_fifo_out_data			(vert_processing_fifo_out_data),                  
		.vert_processing_fifo_out_ready			(vert_processing_fifo_out_ready)
	);

	prim_assembly p1(
		.pll_clock								(pll_clock), 
		.sys_reset								(sys_reset), 
		.raster_fifo_in_valid					(raster_fifo_in_valid),                    
		.raster_fifo_in_data					(raster_fifo_in_data),                     
		.raster_fifo_in_ready					(raster_fifo_in_ready),
		.prim_assembly_fifo_out_valid			(prim_assembly_fifo_out_valid),                   
		.prim_assembly_fifo_out_data			(prim_assembly_fifo_out_data),                  
		.prim_assembly_fifo_out_ready			(prim_assembly_fifo_out_ready)
	);

	gpu_qsys u0 (
		.clk_clk                            	 (clk_clk),
		.reset_in_reset                       	 (reset_reset),
		.reset_out1_reset						 (sys_reset),
		.pll_outclk_clk					  	     (pll_clock),
		.gpu_main_external_interface_address     (gpu_main_external_interface_address),     
		.gpu_main_external_interface_byte_enable (gpu_main_external_interface_byte_enable),
		.gpu_main_external_interface_read        (gpu_main_external_interface_read),       
		.gpu_main_external_interface_write       (gpu_main_external_interface_write),      
		.gpu_main_external_interface_write_data  (gpu_main_external_interface_write_data), 
		.gpu_main_external_interface_acknowledge (gpu_main_external_interface_acknowledge),
		.gpu_main_external_interface_read_data   (gpu_main_external_interface_read_data),   
		.prim_assembly_fifo_out_valid			 (prim_assembly_fifo_out_valid),            
		.prim_assembly_fifo_out_data			 (prim_assembly_fifo_out_data),             
		.prim_assembly_fifo_out_ready			 (prim_assembly_fifo_out_ready),            
		.prim_assembly_fifo_in_valid			 (prim_assembly_fifo_in_valid),            
		.prim_assembly_fifo_in_data			 	 (prim_assembly_fifo_in_data),            
		.prim_assembly_fifo_in_ready			 (prim_assembly_fifo_in_ready),            
		.raster_fifo_out_valid					 (raster_fifo_out_valid),                   
		.raster_fifo_out_data					 (raster_fifo_out_data),                   
		.raster_fifo_out_ready					 (raster_fifo_out_ready),
		.raster_fifo_in_valid					 (raster_fifo_in_valid),                   
		.raster_fifo_in_data					 (raster_fifo_in_data),                    
		.raster_fifo_in_ready					 (raster_fifo_in_ready),  
		.vert_processing_fifo_out_valid          (vert_processing_fifo_out_valid),          
		.vert_processing_fifo_out_data           (vert_processing_fifo_out_data),           
		.vert_processing_fifo_out_ready          (vert_processing_fifo_out_ready),
		.vert_processing_fifo_in_valid           (vert_processing_fifo_in_valid),          
		.vert_processing_fifo_in_data            (vert_processing_fifo_in_data),           
		.vert_processing_fifo_in_ready           (vert_processing_fifo_in_ready),
		.instr_fifo_out_valid					 (instr_fifo_out_valid),                    
		.instr_fifo_out_data					 (instr_fifo_out_data),                  
		.instr_fifo_out_ready					 (instr_fifo_out_ready),          
		.instr_fifo_in_valid					 (instr_fifo_in_valid),                     
		.instr_fifo_in_data						 (instr_fifo_in_data),                      
		.instr_fifo_in_ready					 (instr_fifo_in_ready),                     
 		
		 /* .memory_mem_a                            (memory_mem_a),                          
		.memory_mem_ba                           (memory_mem_ba),                         
		.memory_mem_ck                           (memory_mem_ck),                        
		.memory_mem_ck_n                         (memory_mem_ck_n),                      
		.memory_mem_cke                          (memory_mem_cke),                        
		.memory_mem_cs_n                         (memory_mem_cs_n),                       
		.memory_mem_ras_n                        (memory_mem_ras_n),                      
		.memory_mem_cas_n                        (memory_mem_cas_n),                      
		.memory_mem_we_n                         (memory_mem_we_n),                       
		.memory_mem_reset_n                      (memory_mem_reset_n),                   
		.memory_mem_dq                           (memory_mem_dq),                        
		.memory_mem_dqs                          (memory_mem_dqs),                       
		.memory_mem_dqs_n                        (memory_mem_dqs_n),                      
		.memory_mem_odt                          (memory_mem_odt),                       
		.memory_mem_dm                           (memory_mem_dm),                        
		.memory_oct_rzqin                        (memory_oct_rzqin), */

		.vga_controller_external_interface_CLK	 (vga_controller_external_interface_CLK),            
		.vga_controller_external_interface_HS	 (vga_controller_external_interface_HS),             
		.vga_controller_external_interface_VS	 (vga_controller_external_interface_VS),             
		.vga_controller_external_interface_BLANK (vga_controller_external_interface_BLANK),         
		.vga_controller_external_interface_SYNC  (vga_controller_external_interface_SYNC),           
		.vga_controller_external_interface_R	 (vga_controller_external_interface_R),             
		.vga_controller_external_interface_G	 (vga_controller_external_interface_G),              
		.vga_controller_external_interface_B	 (vga_controller_external_interface_B),             
		.video_pll_ref_clk_clk					 (video_pll_ref_clk_clk)        
	);

endmodule