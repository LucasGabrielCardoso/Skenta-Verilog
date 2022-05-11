module led_water(clk, rst_n, led);
	input 				clk;
	input 				rst_n;
	output reg[3:0]	led;
	
	reg[1:0] 			state;
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)			led	<= 4'b1111;
		else
		begin
			case(state)
				0:
				begin
					led		<=	4'b0111;
					state		<=	2'd1;
				end
				1:
				begin
					led		<=	4'b1011;
					state		<=	2'd2;
				end
				2:
				begin
					led		<=	4'b1101;
					state		<=	2'd3;
				end
				3:
				begin
					led		<=	4'b1110;
					state		<=	2'd0;
				end
				default:		state <= 2'b0;
			endcase
		end
	end
endmodule