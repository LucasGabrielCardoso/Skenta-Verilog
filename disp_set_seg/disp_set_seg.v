module disp_set_seg(dig, seg, clk, rst_n);
	input			clk;
	input			rst_n;
	output reg	[7:0]seg;
	output reg	[3:0]dig;
	
	reg 			[25:0]cnt;
	reg			[25:0]cnt2;
	reg			clk_1s;
	reg			clk_4s;
	reg			[1:0]state;
	reg			[13:0]numb;
	reg			[3:0]hold;
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)								cnt <= 26'b0;			
		else if(cnt==26'd124_999)			cnt <= 26'b0;
		else										cnt <= cnt+1'b1;
	end
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)								clk_1s <= 1'b0;
		else if(cnt==26'd124_999)			clk_1s <= ~clk_1s;
		else										clk_1s <= clk_1s;
	end
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)								cnt2	<=	26'b0;
		else if(cnt2==26'd49_999_999)		cnt2	<=	26'b0;
		else										cnt2	<= cnt2+1'b1;
	end
	
	always@(posedge clk, negedge rst_n)
	begin
		if(!rst_n)								clk_4s	<=	1'b0;
		else if(cnt2==26'd49_999_999)		clk_4s	<= ~clk_4s;
		else										clk_4s	<= clk_4s;
	end
	
	always@(posedge clk_1s, negedge rst_n)
	begin
		if(!rst_n)								
		begin
			dig 		<= 4'b1111;
			state	<= 2'b00;
		end
		
		else
		begin
			case(state)
				2'b00:
				begin
					dig	<=	4'b1110;
					state	<=	2'b01;
				end
				2'b01:
				begin
					dig	<= 4'b1101;
					state	<= 2'b10;
				end
				2'b10:
				begin
					dig	<=	4'b1011;
					state	<= 2'b11;
				end
				2'b11:
				begin
					dig	<=	4'b0111;
					state <= 2'b00;
				end
				
				default:	state <= 2'b00;
				
			endcase
		end
	end
	
	always@(posedge clk_1s, negedge rst_n)
	begin
		if(!rst_n)	seg	<= 8'b11111111;
		else
		begin
			case(hold)
				4'b0000:	seg	<=	8'b11000000;
				4'b0001: seg	<= 8'b11111001;
				4'b0010:	seg	<=	8'b10100100;
				4'b0011: seg	<=	8'b10110000;
				4'b0100: seg	<=	8'b10011001;
				4'b0101: seg	<= 8'b10010010;
				4'b0110: seg	<=	8'b10000011;
				4'b0111:	seg	<=	8'b11111000;
				4'b1000:	seg	<=	8'b10000000;
				4'b1001:	seg	<=	8'b10011000;
				default:	seg	<= 8'b11111111;
			endcase
		end
	end
	
	always@(posedge clk_4s, negedge rst_n)
	begin
		if(!rst_n)						numb	<=	14'b0;
		else if(numb==14'd9999)		numb	<=	14'b0;
		else								numb	<=	numb+1'b1;
	end
	
	always@(posedge clk_1s, negedge rst_n)
	begin
		if(!rst_n)						hold	<= 4'b0;
		else
		begin
			case(state)
				2'b11:					hold	<=	numb%10;
				2'b00:					hold	<= (numb/10)%10;
				2'b01:					hold	<= (numb/100)%10;
				2'b10:					hold	<=	(numb/1000);
			endcase
		end
	end
	
endmodule