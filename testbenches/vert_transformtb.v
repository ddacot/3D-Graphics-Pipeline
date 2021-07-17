`timescale 1 ns / 1 ns
module vert_transformtb;

reg pll_clock;
reg sys_reset;

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
reg [31:0] vert_processing_state;


reg	[31:0] div_num;
reg	[31:0] div_den;
wire [31:0]	div_res;

reg	[31:0] mul_a;
reg	[31:0] mul_b;
wire [31:0]	mul_res;

wire [31:0]	mul_add_res;

reg  add_operation;
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

/* altfp_muladd altfp_muladd1(
		.clk(pll_clock),    //    clk.clk
		.areset(sys_reset), // areset.reset
		.a(mul_a),      //      a.a
		.b(mul_b),      //      b.b
		.c(vertex_buffer_transformed[vertex_address[5:2]]),      //      c.c
		.q(mul_add_res)       //      q.q
	); */

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

//flt2int fi (pll_clock, fp2int_a, fp2int_res);

always @(posedge pll_clock)
begin
    if(sys_reset == 1)
    begin
       
        vert_processing_state <= 2;
        add_operation <= 1;
        count <= 0;
		i <= 0;
        GPU_COMMAND <= 0;
        mul_a <= 0;
        mul_b <=0;
        vertex_address[31:0] <= 0;
        
    end
    else
    begin
        case (vert_processing_state)
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
                    //vertex_buffer_transformed[vertex_address[5:2]] <= mul_add_res;
                    vert_processing_state <= 4;
                    vertex_address <= 0;
                    count <= 0;
				end
            end

            4:
            begin
                add_a <= MULTIPLICATION_RESULT[vertex_address];
                add_b <= MULTIPLICATION_RESULT[vertex_address + 1];
                //add_operation <= 1;
                
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
                div_den <= vertex_buffer_transformed[(vertex_address[3:2] << 2) + 3];

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
                    i <= i+1;
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
                        i <= i+1;
                        
                    end
                end
            end/*
            22:
            begin
                if(prim_assembly_fifo_in_ready)
                begin
                    prim_assembly_fifo_in_valid <= 1;
                    prim_assembly_fifo_in_data <= vertex_buffer_transformed[i];  

                    if(i == 11)
                        vert_processing_state <= 23;
                    else
                        i <= i+1;
                end
                else
                    prim_assembly_fifo_in_valid <= 0;
            end */
            23:
            begin
                i <= 0;
                vertex_address <= 0;
                //prim_assembly_fifo_in_valid <= 0;
                GPU_COMMAND <= 0;
                vert_processing_state <= 0;
            end
        endcase
    end
end

always 
#1 pll_clock = ~pll_clock;

initial 
begin

//$monitor("%d  ",fp2int_res ); 
 $monitor("\n \ %d
          %h %h %h %h \n \"
          %h %h %h %h \n \"
          %h %h %h %h \n ", vert_processing_state,
                            vertex_buffer_transformed[0], vertex_buffer_transformed[1], vertex_buffer_transformed[2], vertex_buffer_transformed[3],
                            vertex_buffer_transformed[4], vertex_buffer_transformed[5], vertex_buffer_transformed[6], vertex_buffer_transformed[7],
                            vertex_buffer_transformed[8], vertex_buffer_transformed[9], vertex_buffer_transformed[10], vertex_buffer_transformed[11],
                            );  

vert_transf_matrix[0] = 32'h3f800000;
vert_transf_matrix[1] = 32'h0;
vert_transf_matrix[2] = 32'h0;
vert_transf_matrix[3] = 32'h0;

vert_transf_matrix[4] = 32'h0;
vert_transf_matrix[5] = 32'h3f800000;
vert_transf_matrix[6] = 32'h0;
vert_transf_matrix[7] = 32'h0;

vert_transf_matrix[8] = 32'h0;
vert_transf_matrix[9] = 32'h0;
vert_transf_matrix[10] = 32'h3f800000;
vert_transf_matrix[11] = 32'h0;

vert_transf_matrix[12] = 32'h0;
vert_transf_matrix[13] = 32'h0;
vert_transf_matrix[14] = 32'h0;
vert_transf_matrix[15] = 32'h3f800000;

vertex_buffer[0] = 32'h40000000;  // -1
vertex_buffer[1] = 32'h0; // -1
vertex_buffer[2] = 32'h0;
vertex_buffer[3] = 32'h3f800000; 

vertex_buffer[4] = 32'h0;   //  -1
vertex_buffer[5] = 32'h0; 	//0
vertex_buffer[6] = 32'h0;
vertex_buffer[7] = 32'h3f800000; 

vertex_buffer[8] =  32'h0; //0
vertex_buffer[9] =  32'h0; // 0
vertex_buffer[10] = 32'h0;
vertex_buffer[11] = 32'h3f800000; 

for(ii = 0; ii < 12; ii=ii+1)
    vertex_buffer_transformed[ii] = 0;

vert_processing_state = 2;
sys_reset = 1;
pll_clock = 0;
#5 sys_reset = 0;

#15000;
$stop;
end


endmodule