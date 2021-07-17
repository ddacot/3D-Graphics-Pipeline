`include "global_parameters.vh"

module gpu_sm(
            input wire pll_clock,
            input wire sys_reset,

            input wire        	instr_fifo_out_valid,                   
            input wire [31:0] 	instr_fifo_out_data,                     
            output reg         	instr_fifo_out_ready,    
            
            output reg 			vert_processing_fifo_in_valid,          
            output reg [31:0]  	vert_processing_fifo_in_data,         
            input wire			vert_processing_fifo_in_ready

        );

	//-------------------------------

	reg 	[31:0] GPU_COMMAND;
	reg 	[31:0] GPU_STATE;
	reg 	[31:0] temp_data;

	/* ===================== ADDRESSES ===================== */
	
	always@(posedge pll_clock or posedge sys_reset)
	begin
		if(sys_reset == 1)
		begin
			vert_processing_fifo_in_valid 	<= 0;
			instr_fifo_out_ready 		   	<= 1; 
			temp_data 						<= 0;
			GPU_STATE 						<= GPU_COMMAND_READ;
			GPU_COMMAND						<= 0;
		end
		else 
		begin
			
			case (GPU_STATE)
			GPU_COMMAND_READ:
			begin
				vert_processing_fifo_in_valid 	<= 0;
				instr_fifo_out_ready 		 	<= 1;
				if(instr_fifo_out_ready == 1 && instr_fifo_out_valid == 1)
				begin
					
					GPU_COMMAND <= instr_fifo_out_data;
					GPU_STATE <= GPU_VERT_PROC_COMMAND_SEND;
				end
			end

			GPU_VERT_PROC_COMMAND_SEND:
			begin
				instr_fifo_out_ready <= 0;

				if(vert_processing_fifo_in_ready == 1)
				begin
					vert_processing_fifo_in_valid <= 1;
					vert_processing_fifo_in_data  <= GPU_COMMAND;
					GPU_STATE <= GPU_VERT_PROC_DATA_READ;
				end
			end

			GPU_VERT_PROC_DATA_READ:
			begin
				vert_processing_fifo_in_valid <= 0;
				instr_fifo_out_ready <= 1;

				if(instr_fifo_out_ready == 1 && instr_fifo_out_valid == 1)
				begin
					
					temp_data <= instr_fifo_out_data;
					GPU_STATE <= GPU_VERT_PROC_DATA_SEND;
				end
			end
			
			GPU_VERT_PROC_DATA_SEND:
			begin
				instr_fifo_out_ready <= 0;
				
				if(vert_processing_fifo_in_ready == 1)
				begin
					if(temp_data == GL_END)
					begin
						vert_processing_fifo_in_valid <= 0;
						GPU_STATE <= GPU_COMMAND_READ;
					end
					else
					begin
						GPU_STATE <= GPU_VERT_PROC_DATA_READ;
						vert_processing_fifo_in_valid <= 1;
						vert_processing_fifo_in_data <= temp_data;
					end
				end
				else
					vert_processing_fifo_in_valid <= 0;
			end
			endcase

		end
	end
	
	/* =========================================== END GPU_SM ==============================================*/

endmodule