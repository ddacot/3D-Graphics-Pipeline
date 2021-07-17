`ifndef global_parameters
`define global_parameters

	localparam GPU_IDLE = 0;
	localparam GPU_COMMAND_READ = 1;
	localparam GPU_VERT_PROC_COMMAND_SEND = 2;
	localparam GPU_VERT_PROC_DATA_READ = 3;
	localparam GPU_VERT_PROC_DATA_SEND = 4;
	localparam GL_END = 5;	
	localparam GL_TRIANGLES = 6;
	localparam GL_POINTS = 7;
	localparam GL_VERT_TRANSF_MATRIX = 8;
	localparam GL_COLOR = 9;

	localparam VERT_PROC_COMMAND_READ = 0;
	localparam VERT_PROC_DATA_READ = 1;
    
`endif
