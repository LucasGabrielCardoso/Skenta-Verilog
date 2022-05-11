module pll_test
		(clk,
		 areset,
		 clk_25M,
		 clk_50M,
		 clk_75M,
		 clk_100M,
		 locked
		 );
		 
		 input		clk;
		 input		areset;
		 output		clk_25M;
		 output		clk_50M;
		 output		clk_75M;
		 output		clk_100M;
		 output		locked;
		 
		 new_pll	new_pll_inst(
										.areset(areset),
										.inclk0(clk),
										.c0(clk_25M),
										.c1(clk_50M),
										.c2(clk_75M),
										.c3(clk_100M),
										.locked(locked)
									);
endmodule