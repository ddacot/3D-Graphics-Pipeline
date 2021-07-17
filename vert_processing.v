`include "global_parameters.vh"

module vert_processing(
    input wire        pll_clock, 
    input wire        sys_reset, 

    output reg        prim_assembly_fifo_in_valid,                   
    output reg [31:0] prim_assembly_fifo_in_data,                     
    input wire        prim_assembly_fifo_in_ready,
    
    input wire        vert_processing_fifo_out_valid,                   
    input wire [31:0] vert_processing_fifo_out_data,                    
    output reg        vert_processing_fifo_out_ready                  
    );

reg 	[31:0] GPU_COMMAND;
reg     [31:0] vertex_buffer [0:11];
reg     [31:0] vert_transf_matrix [0:15];
reg 	[31:0] vertex_buffer_transformed [0:11];
reg     [31:0]  vertex_address;

parameter DELAY_TIME = 15;
// ------------- FPU ----------//


reg operation;

reg [31:0] MULTIPLICATION_RESULT[0:47];

reg [31:0] count;
reg [8:0] vert_processing_state;


reg	[31:0] div_num;
reg	[31:0] div_den;
wire [31:0]	div_res;

reg	[31:0] mul_a;
reg	[31:0] mul_b;
wire [31:0]	mul_res;

wire [31:0]	mul_add_res;

reg	[31:0] add_a;
reg	[31:0] add_b;
wire [31:0]	add_res;
wire [31:0]	sub_res;

reg	[31:0] fp2int_a;
wire [31:0]	fp2int_res;

reg [3:0] i;
reg [3:0] j;
reg [3:0] k;


integer ii;
parameter WAIT_DELAY = 15;
parameter ALTFFP_ADDSUB_LATENCY = 51;
parameter ALTFP_MULTIPLIER_LATENCY = 48;
parameter ALTFP_DIVIDER_LATENCY = 48;
altfp_divider divider1(
	.clk(pll_clock),
    .areset (sys_reset),
	.a(div_num),
	.b(div_den),
	.q(div_res)
    );

altfp_multiplier multiplier1(
	.clk(pll_clock),
    .areset(sys_reset),
	.a(mul_a),
	.b(mul_b),
	.q(mul_res)
    );

altfp_addsub addition1(
    .areset(sys_reset),
	.clk(pll_clock),
	.a(add_a),
	.b(add_b),
	.q(add_res),
    .s(sub_res)
    );

 altfp_2int	altfp_2int_inst (
    .areset (sys_reset), // areset.reset
    .a      (fp2int_a),      //      a.a
    .q      (fp2int_res),       //      q.q
	.clk ( pll_clock )
	);

always @(posedge pll_clock or posedge sys_reset)
begin
    if(sys_reset == 1)
    begin
        prim_assembly_fifo_in_valid <= 0;
        prim_assembly_fifo_in_data <= 0;
        vert_processing_fifo_out_ready <= 1;
        vert_processing_state <= VERT_PROC_COMMAND_READ;

        count <= 0;
		i <= 0;
        GPU_COMMAND <= GPU_IDLE;

        
        vertex_address <= 0;
        
        for(ii = 0; ii < 12; ii=ii+1)
        begin
            vertex_buffer[ii] <= 0;
            vertex_buffer_transformed[ii] <= 0;
            
        end

        for(ii = 0; ii < 16; ii=ii+1)
        begin
            
            vert_transf_matrix[ii] <= 32'h3f800000;
        end
    end
    else
    begin
        case (vert_processing_state)
            VERT_PROC_COMMAND_READ:
            begin    
                vert_processing_fifo_out_ready <= 1;
                if(vert_processing_fifo_out_valid == 1)
                begin
                    if(vert_processing_fifo_out_data == GL_TRIANGLES || vert_processing_fifo_out_data == GL_COLOR)
                    begin
                        prim_assembly_fifo_in_valid <= 1;
                        prim_assembly_fifo_in_data <= vert_processing_fifo_out_data;
                        GPU_COMMAND <= vert_processing_fifo_out_data;
                        vert_processing_state <= VERT_PROC_DATA_READ;
                    end
                    else
                        prim_assembly_fifo_in_valid <= 0;

                    if(vert_processing_fifo_out_data == GL_VERT_TRANSF_MATRIX)
                    begin
                        GPU_COMMAND <= vert_processing_fifo_out_data;
                        vert_processing_state <= VERT_PROC_DATA_READ;
                    end
                end
                else
                    prim_assembly_fifo_in_valid <= 0;
            end 
            
            VERT_PROC_DATA_READ: 
            begin
                if(vert_processing_fifo_out_valid == 1)
			    begin
                    case(GPU_COMMAND)
                        GL_TRIANGLES:
                        begin
                            prim_assembly_fifo_in_valid <= 0;
                            vertex_buffer[i] <= vert_processing_fifo_out_data;
                            if(i == 11)
                            begin
                                vert_processing_state <= 2;
                                vert_processing_fifo_out_ready <= 0;
                                i <= 0;
                            end
                            else
                                i <= i+4'd1;
                        end
                
                        GL_VERT_TRANSF_MATRIX:
                        begin
                            vert_transf_matrix[i] <= vert_processing_fifo_out_data;
                            prim_assembly_fifo_in_valid <= 0;
                            if(i == 15)
							begin
                                vert_processing_state <= 0;
                                i <= 0;
							end
                            else
                                i <= i+4'd1;
                        end

                        GL_COLOR:
                        begin
                            if(prim_assembly_fifo_in_ready)
                            begin
                                prim_assembly_fifo_in_valid <= 1;
                                prim_assembly_fifo_in_data <= vert_processing_fifo_out_data;

                                if(i == 8)
                                begin
                                    i <= 0;
                                    vert_processing_state <= 0;
                                end
                                else
                                begin
                                    i <= i + 4'd1;
                                end
                            end
                            else
                                prim_assembly_fifo_in_valid <= 0;
                        end

                    endcase
                end
                else
                    prim_assembly_fifo_in_valid <= 0;

            end

            2: // MULTIPLY M[0][j] with V[j]
            begin
                mul_a <= vert_transf_matrix[vertex_address[3:0]];
                mul_b <= vertex_buffer[{vertex_address[5:4], vertex_address[1:0]}];
                
                if(vertex_address[31:0] == 48)
                begin
                    vert_processing_state <= 3;
                    vertex_address <= 0;
                end
                else
                begin
                    vertex_address <= vertex_address + 1;
                end
            end
        
            3: // ADD UP THE MULTIPLICATION
            begin
                if(vertex_address < 48)
                begin
					MULTIPLICATION_RESULT[vertex_address] <= mul_res;
                    vertex_address <= vertex_address + 1;
                end
				else
				begin
                    vert_processing_state <= 4;
                    vertex_address <= 0;
                    count <= 0;
				end
            end

            4:
            begin
                add_a <= MULTIPLICATION_RESULT[vertex_address];
                add_b <= MULTIPLICATION_RESULT[vertex_address + 1];
               
                if(vertex_address[31:0] == 48)
                begin
                    vert_processing_state <= 5;
                    vertex_address <= 0;
                end
                else
                begin
                    vertex_address <= vertex_address + 2;
                end
            end 

            5:
            begin
                if(count < 26)
                    count <= count + 1;
                else
                begin
                    vert_processing_state <= 6;
                    count <= 0;
                end
            end

            6:
            begin
                
                if(vertex_address < 24)
                begin
                    MULTIPLICATION_RESULT[vertex_address] <= add_res;
                    vertex_address <= vertex_address + 1;
                end
                else
                begin
                    vertex_address <= 0;
                    vert_processing_state <= 7;
                end
            end
 
            7:
            begin
                add_a <= MULTIPLICATION_RESULT[vertex_address];
                add_b <= MULTIPLICATION_RESULT[vertex_address + 1];

                if(vertex_address[31:0] == 24)
                begin
                    vert_processing_state <= 8;
                    vertex_address <= 0;
                end
                else
                begin
                    vertex_address <= vertex_address + 2;
                end
            end

            8:
            begin
                if(count < 38)
                    count <= count + 1;
                else
                begin
                    vert_processing_state <= 9;
                    vertex_address <= 0;
                    count <= 0;
                end
            end

            9:
            begin
                if(vertex_address < 12)
                begin
                    vertex_buffer_transformed[vertex_address] <= add_res;
                    vertex_address <= vertex_address + 1;
                end
                else
                begin
                    vertex_address <= 0;
                    vert_processing_state <= 10;
                end
            end

            // PERSPECTIVE DIVISION
            10:
            begin
                div_num <= vertex_buffer_transformed[vertex_address[3:0]];
                div_den <= vertex_buffer_transformed[(vertex_address[3:2] << 2) + 32'd3];

                if(vertex_address[31:0] == 12)
                begin
                    vert_processing_state <= 11;
                    vertex_address <= 0;
                end
                else
                begin
                    vertex_address <= vertex_address + 1;
                end
            end

            11:
            begin
                if(count < 35)
                    count <= count + 1;
                else
                begin
                    vert_processing_state <= 12;
                    vertex_address <= 0;
                    count <= 0;
                end
            end

            12:
            begin
                vertex_buffer_transformed[vertex_address[3:0]] <= div_res;
                if(vertex_address == 12)
                begin
                    vert_processing_state <= 13;
                    vertex_address <= 0;
                end
                else
                    vertex_address <= vertex_address + 1;
            end
            /*
                X = (X + 1) * Viewport.Width * 0.5 +  Viewport.TopLeftX == (X+1) * 800/2
                Y = (1 - Y) * Viewport.Height * 0.5 + Viewport.TopLeftY == (1-Y) * 600/2
                Z = Viewport.MinDepth + Z * (Viewport.MaxDepth - Viewport.MinDepth) = Z * 0x4f000000
                W = 1
            */
            13:
            begin
                case(vertex_address[1:0])
                    0:
                    begin
                        add_a <= vertex_buffer_transformed[vertex_address[3:0]];
                        add_b <= 32'h3f800000;
                        
                    end
                    1:
                    begin
                        add_a <= 32'h3f800000;
                        add_b <= vertex_buffer_transformed[vertex_address[3:0]];
                        
                    end
                    2:
                    begin
                        add_a <= 0;
                        add_b <= vertex_buffer_transformed[vertex_address[3:0]];
                    end

                    3:
                    begin
                        add_a <= 0;
                        add_b <= vertex_buffer_transformed[vertex_address[3:0]];
                    end

                    default:
                    begin
                        add_a <= 0;
                        add_b <= 0;
                    end
                endcase
                
                if(vertex_address == 11)
                begin
                    vert_processing_state <= 15;
                    vertex_address <= 0;
                    count <= 0;
                end
                else
                    vertex_address <= vertex_address + 1;

            end
            
            15:
            begin
               if(count < 39)
					count <= count+1;
				else
				begin
                    vert_processing_state <= 16;
                end
            end

            16:
            begin
                if(vertex_address < 12)
                begin
                    vertex_buffer_transformed[vertex_address[3:0]] <= add_res;
                    vertex_address <= vertex_address + 1;
                end
                else
                begin
                    count <= 0;
                    vertex_address <= 0;
                    vert_processing_state <= 17;
                end
            end

            17:
            begin
                case(vertex_address[1:0])
                    0:
                    begin
                        mul_a <= vertex_buffer_transformed[vertex_address[3:0]];
                        mul_b <= 32'h43c80000;
                    end
                    1:
                    begin
                        mul_a <= vertex_buffer_transformed[vertex_address[3:0]];
                        mul_b <= 32'h43960000;
                    end
                    2:
                    begin
                        mul_a <= vertex_buffer_transformed[vertex_address[3:0]];
                        mul_b <= 32'h4f000000;
                    end
                    3:
                    begin
                        mul_a <= vertex_buffer_transformed[vertex_address[3:0]];
                        mul_b <= 32'h3f800000;
                    end
                    default:
                    begin
                        mul_a <= 0;
                        mul_b <= 0;
                    end
                endcase

                if(vertex_address == 11)
                begin
                    vert_processing_state <= 18;
                    vertex_address <= 0;
                    count <= 0;
                end
                else
                    vertex_address <= vertex_address + 1;
            end

            18:
            begin
                if(count < 36)
					count <= count+1;
				else
				begin
                    vert_processing_state <= 19;
                    
				end
            end

            19:
            begin
                if(vertex_address < 12)
                begin
                    vertex_buffer_transformed[vertex_address[3:0]] <= mul_res;
                    vertex_address <= vertex_address + 1;
                end
                else
                begin
                    i<=0;
                    count <= 0;
                    vertex_address <= 0;
                    vert_processing_state <= 20;
                end
            end   

            20:
            begin
                fp2int_a <= vertex_buffer_transformed[i];

                if(i == 11)
                begin
                    vert_processing_state <= 21;
                    i<=0;
                end
                else
                    i <= i+4'd1;
            end

            21:
            begin
                if(count <= 6)
                begin
                    count <= count + 1;
                end
				else
				begin
                    vertex_buffer_transformed[i] <= fp2int_res;
                    if(i == 11)
                    begin
                        i <= 0;
                        vert_processing_state <= 22;
                    end
                    else
                    begin
                        i <= i+4'd1;
                    end
                end
            end
            
            22:
            begin
                if(prim_assembly_fifo_in_ready)
                begin
                    prim_assembly_fifo_in_valid <= 1;
                    prim_assembly_fifo_in_data <= vertex_buffer_transformed[i];  

                    if(i == 11)
                        vert_processing_state <= 23;
                    else
                        i <= i+4'd1;
                 end
                else
                    prim_assembly_fifo_in_valid <= 0; 
            end
            
            23:
            begin
                i <= 0;
                vertex_address <= 0;
                prim_assembly_fifo_in_valid <= 0;
                GPU_COMMAND <= 0;
                vert_processing_state <= 0;
            end
          
        endcase
    end
end

endmodule