`include "global_parameters.vh"

module prim_assembly(
    input wire        pll_clock, 
    input wire        sys_reset, 

    output reg        raster_fifo_in_valid,                    //                    raster_fifo_in.valid
    output reg [31:0] raster_fifo_in_data,                     //                                  .data
    input wire        raster_fifo_in_ready,
    
    input wire        prim_assembly_fifo_out_valid,                    //                    instr_fifo_out.valid
    input wire [31:0] prim_assembly_fifo_out_data,                     //                                  .data
    output reg        prim_assembly_fifo_out_ready                    //  
    );



reg [6:0] prim_assembly_state;
reg [31:0] temp;

always @(posedge pll_clock or posedge sys_reset)
begin
    if(sys_reset == 1)
    begin
        prim_assembly_state <= 0;
        raster_fifo_in_valid <= 0;
        raster_fifo_in_data <= 0;
        prim_assembly_fifo_out_ready <= 1;
		
    end
    else
    begin
        case (prim_assembly_state)
            0:
            begin
                prim_assembly_fifo_out_ready <= 1;
                if(prim_assembly_fifo_out_valid == 1)
                begin
                    raster_fifo_in_valid <= 1;
                    raster_fifo_in_data <= prim_assembly_fifo_out_data;
                end
                else
                    raster_fifo_in_valid <= 0;
            end
        endcase
    end
end

endmodule
 