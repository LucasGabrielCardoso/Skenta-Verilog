module led_water(clk, rst_n, led);
	input					clk;
	input					rst_n;
	output reg[3:0]	led;
	
	reg[1:0]		state;
	reg[25:0]	cnt;
	reg			clk_1s;
	
	//Blinking Led
	always@(posedge clk_1s, negedge rst_n)
	begin
		if(!rst_n)
		begin
			led	<=4'b1111;
			state	<=2'b0;
		end
		
		else
		begin
			case(state)
				0:
				begin
					led	<= 4'b0111;
					state <= 2'd1;
				end
				1:
				begin
					led	<= 4'b1011;
					state	<=	2'd2;
				end
				2:
				begin
					led	<=	4'b1101;
					state <= 2'd3;
				end
				3:
				begin
					led	<= 4'b1110;
					state	<= 2'd0;
				end
				default:	state	<= 2'b0;
			endcase
			end
		end
		
		//Conter
		always@(posedge clk, negedge rst_n)
		begin
			if(!rst_n)							cnt	<= 26'd12_999_999;
			else if(cnt==26'd12_999_999)	cnt	<=	26'b0;
			else									cnt	<=	cnt+1;
		end
		
		//Clock 1s
		always@(posedge clk, negedge rst_n)
		begin
			if(!rst_n)							clk_1s	<= 1'b0;
			else if(cnt==26'd12_999_999)	clk_1s	<= ~clk_1s;
			else									clk_1s	<= clk_1s;
		end
		
endmodule