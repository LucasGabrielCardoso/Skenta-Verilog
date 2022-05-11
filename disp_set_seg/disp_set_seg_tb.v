module disp_set_seg_tb();
	reg	clk;
	reg	rst_n;
	wire	[7:0]seg;
	wire	[3:0]dig;
	
	disp_set_seg u1(
							.clk(clk),
							.rst_n(rst_n),
							.seg(seg),
							.dig(dig)
						);
						
	initial
	begin
		clk	=	1'b0;
		rst_n	=	1'b0;
		#100	rst_n	=1'b1;
		#40_000_000;
		$stop;
	end
	
	always #10 clk = ~clk;
	
endmodule