`timescale 1 ns / 1 ns
module raster_shading;

reg pll_clock;
reg sys_reset;


//--------------------------
//  Vertice
//  |s|20.10
//  Color
//  |s|10.20
//  
//--------------------------



reg [6:0] raster_state;
reg [31:0] address;

reg [31:0] GPU_COMMAND;
reg [31:0] vertex_buffer [0:2][0:3];
reg [31:0] vertex_color [0:2][0:2];

reg [3:0] i;
reg [3:0] j;
reg [3:0] k;
reg [3:0] mult_cnt;
reg [9:0] temp;
reg [10:0] color;

integer ii;

reg i_start;
wire o_overflow;
reg [31:0] i_dividend;
reg [31:0] i_divisor;
wire [31:0] o_quotient_out;
wire o_complete;
wire [31:0] o_remainder_out;
reg [31:0] wait_cnt;

parameter COLOR_SHIFT = 11;
parameter VERTICE_SHIFT = 0;
parameter WAIT_DELAY = 15;
parameter LMP_DIVIDE_LATENCY = 32;
parameter MULTIPLY_ADDER_LATENCY = 15;


reg signed [31:0] A01, B01, A12, B12, A20, B20, w0,w1,w2;

reg signed [31:0] area;
reg signed [31:0] w_rows[0:2];
reg signed [31:0] w [0:2];
reg signed [31:0] P[0:2];
reg signed [31:0] RENDERED_PIXEL[0:2];
reg signed [31:0] P_color[0:2];
wire signed [31:0] edgeFunction;
reg signed [31:0] a[0:2], b[0:2], c[0:2];
reg signed [31:0] minX,minY,maxX,maxY;
wire signed [31:0] mul_add_result;

lpm_div intdiv_inst (
	.clock ( pll_clock ),
	.denom ( i_divisor ),
	.numer ( i_dividend ),
	.quotient ( o_quotient_out ),
	.remain ( o_remainder_out )
	);

int_mult_add m1(
    .result(mul_add_result),  //  result.result
    .dataa_0((b[0] - a[0])), // dataa_0.dataa_0
    .dataa_1((b[1] - a[1])), // dataa_1.dataa_1
    .datab_0((c[1] - a[1])), // datab_0.datab_0
    .datab_1((c[0] - a[0])),  // datab_1.datab_1
    .clock0(pll_clock)
);
always 
#1 pll_clock = ~pll_clock;

always @(posedge pll_clock)
begin
    if(sys_reset == 1)
    begin
        raster_state <= 2;

       /*  gpu_main_external_interface_address <= 0;
        gpu_main_external_interface_write <= 0;
        gpu_main_external_interface_byte_enable <= 0;
        gpu_main_external_interface_read <= 0; */

        i <= 0;
        j <= 0;
        k <= 0;

        wait_cnt<=0;

       // raster_fifo_out_ready <= 1;
        
		GPU_COMMAND <= 0;
        vertex_color[0][0] <= 32'h3FF << COLOR_SHIFT;
        vertex_color[0][1] <= 32'h0;
        vertex_color[0][2] <= 32'h0;

        vertex_color[1][0] <= 11'h0;
        vertex_color[1][1] <= 32'h3FF << COLOR_SHIFT;
        vertex_color[1][2] <= 32'h0;

        vertex_color[2][0] <= 32'h0;
        vertex_color[2][1] <= 32'h0;
        vertex_color[2][2] <= 32'h3FF << COLOR_SHIFT;


        for( ii = 0; ii < 3; ii=ii+1)
        begin
            a[ii] <= 0;
            b[ii] <= 0;
            c[ii] <= 0;
            P[ii] <= 0;
        end

    end
    else
    begin
		case (raster_state)

        2:
        begin
            //find min x
            if (vertex_buffer[0][0] <= vertex_buffer[1][0] && vertex_buffer[0][0] <= vertex_buffer[2][0]) 
                minX <= vertex_buffer[0][0]; 

            else if (vertex_buffer[1][0] <= vertex_buffer[0][0] && vertex_buffer[1][0] <= vertex_buffer[2][0]) 
                minX <= vertex_buffer[1][0];

            else
                minX <= vertex_buffer[2][0];

            //min y 
            if (vertex_buffer[0][1] <= vertex_buffer[1][1] && vertex_buffer[0][1] <= vertex_buffer[2][1]) 
                minY <= vertex_buffer[0][1];
            
            else if (vertex_buffer[1][1] <= vertex_buffer[0][1] && vertex_buffer[1][1] <= vertex_buffer[2][1]) 
                minY <= vertex_buffer[1][1];
        
            else
                minY <= vertex_buffer[2][1];

            //find max x
            if (vertex_buffer[0][0] >= vertex_buffer[1][0] && vertex_buffer[0][0] >= vertex_buffer[2][0]) 
                maxX <= vertex_buffer[0][0];
  
            else if (vertex_buffer[1][0] >= vertex_buffer[0][0] && vertex_buffer[1][0] >= vertex_buffer[2][0]) 
                maxX <= vertex_buffer[1][0];
        
            else
                maxX <= vertex_buffer[2][0];

            //max y 
            if (vertex_buffer[0][1] >= vertex_buffer[1][1] && vertex_buffer[0][1] >= vertex_buffer[2][1]) 
                maxY <= vertex_buffer[0][1];
  
            else if (vertex_buffer[1][1] >= vertex_buffer[0][1] && vertex_buffer[1][1] >= vertex_buffer[2][1]) 
                maxY <= vertex_buffer[1][1];
        
            else
                maxY <= vertex_buffer[2][1];

            raster_state <= 3;
        end

        //area
        3:    
        begin

            A01 <= vertex_buffer[0][1] - vertex_buffer[1][1]; 
            B01 <= vertex_buffer[1][0] - vertex_buffer[0][0];
            A12 <= vertex_buffer[1][1] - vertex_buffer[2][1]; 
            B12 <= vertex_buffer[2][0] - vertex_buffer[1][0];
            A20 <= vertex_buffer[2][1] - vertex_buffer[0][1]; 
            B20 <= vertex_buffer[0][0] - vertex_buffer[2][0];

            P[0] <= minX;
            P[1] <= minY;
            P[2] <= 0;

            for( ii = 0; ii < 3; ii=ii+1)
            begin
                a[ii] <= vertex_buffer[0][ii];
                b[ii] <= vertex_buffer[1][ii];
                c[ii] <= vertex_buffer[2][ii];
            end
            
            raster_state <= 4;
        end

        //w_rows[0]
        4:
        begin
            
            for( ii = 0; ii < 3; ii=ii+1)
            begin
                a[ii] <= vertex_buffer[1][ii];
                b[ii] <= vertex_buffer[2][ii];
                c[ii] <= P[ii];
            end

            raster_state <= 5;
        end
        //w_rows[1]
        5:
        begin
           
            for( ii = 0; ii < 3; ii=ii+1)
            begin
                a[ii] <= vertex_buffer[2][ii];
                b[ii] <= vertex_buffer[0][ii];
                c[ii] <= P[ii];
            end

            raster_state <= 6;

        end
        //w_rows[1]

        6:
        begin
           
            for( ii = 0; ii < 3; ii=ii+1)
            begin
                a[ii] <= vertex_buffer[0][ii];
                b[ii] <= vertex_buffer[1][ii];
                c[ii] <= P[ii];
            end

            raster_state <= 7;
           
        end

        7:
        begin
            if(wait_cnt > 96)
            begin   
                wait_cnt <= 0; 
                area <= mul_add_result;
                raster_state <= 8;
            end
            else
                wait_cnt <= wait_cnt + 1;   
        end

        8:
        begin

            w_rows[0] <= mul_add_result;//area[31] == 1 ? (~mul_add_result + 1) : mul_add_result;
            raster_state <= 9;
        end

        9:
        begin
            w_rows[1] <= mul_add_result;//area[31] == 1 ? (~mul_add_result + 1) : mul_add_result;
            raster_state <= 10;
        end

        10:
        begin
            w_rows[2] <= mul_add_result;//area[31] == 1 ? (~mul_add_result + 1) : mul_add_result;
            raster_state <= 11; 
        end

        11:
        begin   
            w0 <= w_rows[0];
            w1 <= w_rows[1];
            w2 <= w_rows[2];
            raster_state <= 12; 
        end

        12:
        begin
            wait_cnt <= 0; 
            k <= 0;
            if(area[31] == 1 ? (-w0 | -w1 | -w2) >= 0 : (w0 | w1 | w2) >= 0)
                raster_state <= 13;
            else
                raster_state <= 19;
        end

        13:
        begin
            k <= k + 1;

            if(k == 0)
                i_dividend <= (w0 << COLOR_SHIFT);
            else if(k == 1)
                i_dividend <= (w1 << COLOR_SHIFT);
            else
            begin
                k <= 0;
                i_dividend <= (w2 << COLOR_SHIFT);
                raster_state <= 15;
            end

            i_divisor <= area;
        end

        15:
        begin
            if(wait_cnt > 29)
            begin
                w[k] <= o_quotient_out;

                if(k == 2)
                    raster_state <= 16;
                else
                    k <= k + 1;
            end
            else
                wait_cnt <= wait_cnt + 1;
        end

        16:
        begin
            P_color[0] <= (w[0]*vertex_color[0][0] + w[1]*vertex_color[1][0] + w[2]*vertex_color[2][0]) >> (COLOR_SHIFT << 1);
            P_color[1] <= (w[0]*vertex_color[0][1] + w[1]*vertex_color[1][1] + w[2]*vertex_color[2][1]) >> (COLOR_SHIFT << 1);
            P_color[2] <= (w[0]*vertex_color[0][2] + w[1]*vertex_color[1][2] + w[2]*vertex_color[2][2]) >> (COLOR_SHIFT << 1);
            
            raster_state <= 17;
        end

        17:
        begin
            RENDERED_PIXEL[0] <= P[0];
            RENDERED_PIXEL[1] <= P[1];
           /*  gpu_main_external_interface_write_data <= {2'b0, P_color[0][9:0], P_color[1][9:0],P_color[2][9:0]};
            gpu_main_external_interface_address <= 32'h32000000 + ((P[1][9:0]*32'd800 + P[0][9:0]) << 2);
            gpu_main_external_interface_byte_enable <= 32'hF;
            gpu_main_external_interface_read <= 0;
            gpu_main_external_interface_write <= 1;  */
            
            raster_state <= 18;
        end
        18:
        begin
            //if(gpu_main_external_interface_acknowledge == 1)
            //begin
                //gpu_main_external_interface_write <= 0; 
               
                raster_state <= 19;
            //end 
        end

        19:
        begin
            w0 <= w0 + A12;
            w1 <= w1 + A20;
            w2 <= w2 + A01;

            if(P[0] < maxX)
            begin
                P[0] <= P[0] + 1;
                raster_state <= 12;
            end
            else
            begin
                w_rows[0] <= w_rows[0] + B12;
                w_rows[1] <= w_rows[1] + B20;
                w_rows[2] <= w_rows[2] + B01;

                if(P[1] < maxY)
                begin
                    P[0] <= minX;
                    P[1] <= P[1] + 1;
                    raster_state <= 11;
                end
                else
                begin
                    //WE ARE DONE
                    raster_state <= 0;
                end
            end
        end
		endcase
    end
end

initial 
begin
    // $monitor("%d (%d,%d) %d %d %d",  area, P[0], P[1], w0, w1, w2);
   $monitor("P(%d, %d) = C(%h,%h,%h)", RENDERED_PIXEL[0],  RENDERED_PIXEL[1], P_color[0], P_color[1], P_color[2]);

    vertex_buffer[0][0] <= 0;
    vertex_buffer[0][1] <= 0;
    vertex_buffer[0][2] <= 0;
    vertex_buffer[0][3] <= 0;
    
    vertex_buffer[1][0] <= 10;
    vertex_buffer[1][1] <= 0;
    vertex_buffer[1][2] <= 0;
    vertex_buffer[1][3] <= 0;

    vertex_buffer[2][0] <= 10;
    vertex_buffer[2][1] <= 10;
    vertex_buffer[2][2] <= 0;
    vertex_buffer[2][3] <= 0;

    vertex_color[0][0] <= 32'h3FF << COLOR_SHIFT;
    vertex_color[0][1] <= 32'h00;
    vertex_color[0][2] <= 32'h00;
    vertex_color[1][0] <= 32'h00;
    vertex_color[1][1] <= 32'h3FF << COLOR_SHIFT;
    vertex_color[1][2] <= 32'h00;
    vertex_color[2][0] <= 32'h00;
    vertex_color[2][1] <= 32'h00;
    vertex_color[2][2] <= 32'h3FF << COLOR_SHIFT;
    raster_state <= 2;
    sys_reset = 1;
    pll_clock = 0;
    #5 sys_reset = 0;

#4000000;
$stop;
end
endmodule
 