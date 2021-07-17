module linedraw_tb;
reg pll_clock;
reg sys_reset;

reg [31:0] x;
reg [31:0] y;
reg [31:0] x0;
reg [31:0] y0;
reg [31:0] x1;
reg [31:0] y1;
reg signed [31:0] dx;
reg signed [31:0] dy;

reg signed [31:0] err;
reg [31:0] sx;
reg [31:0] sy;
reg signed [31:0] e2;
reg [6:0] nextState;

reg right;
reg down;

always 
#5 pll_clock = ~pll_clock;

always @(posedge pll_clock)
begin
    if(sys_reset == 1)
    begin
		
    end
    else
    begin
		case (nextState)
			1:
			begin
				dx = x1-x0;
				right = dx >= 0;
				if(~right) dx = -dx;

				dy = y1 -y0;
				down = dy>=0;
				if(down) dy = -dy;
				
				err = dx+dy;
				x <= x0;
				y <= y0;

				nextState <= 2;
			end
			
			2:
			begin
				//done
				if(x == x1 && y == y1)
					nextState = 3;
				else
				begin // not done
					e2 = err << 1;

					if(e2 > dy)
					begin
						err = err + dy;
						if(right) x <= x + 31'd1;
						else x <= x - 32'd1;
						
					end
					if(e2 < dx)
					begin
						err =err + dx;
						if(down) y <= y + 31'd1;
						else y <= y - 32'd1;
					end
				end
			end
		endcase
    end
end

initial 
begin
	
	x0 = 100;
	x1 = 200;
	y0 = 200;
	y1 = 300;

	nextState = 1;
	sys_reset = 1;
	pll_clock = 0;

	#5 sys_reset = 0;
	$monitor("STATE %d : %d, %d - %d , %d\n", nextState, x, y, x1,y1);
	#15000;
	$stop;
end
endmodule