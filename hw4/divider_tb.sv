module divider_tb();
	logic clk, Resetn, s, LA, EB, Done;
	logic [7:0] DataA, DataB, R, Q;
		
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	divider dut (.Clock(clk), .*);
	
	initial begin
		{Resetn, s, LA, EB, DataA, DataB} <= '0; 	@(posedge clk); // Reset all inputs
		Resetn <= 1;                             	@(posedge clk);
		
		// Try a divide
		DataA <= 8'hFF; DataB <= 8'hA7;          	@(posedge clk); // Delay to load registers
		LA <= 1; EB <= 1;									@(posedge clk);
		LA <= 0; EB <= 0;									@(posedge clk);
		
		s <= 1;                                  	@(posedge clk);
		
		repeat (2**5) @(posedge clk);
		
		// divide again		
		s <= 0;												@(posedge clk);
		DataA <= 8'hA6; DataB <= 8'h09;          	@(posedge clk); // Delay to load registers
		LA <= 1; EB <= 1;									@(posedge clk);
		LA <= 0; EB <= 0;									@(posedge clk);
		
		s <= 1;                                  	@(posedge clk);
		
		repeat (2**5) @(posedge clk);

		$stop;
	end

endmodule	// divider_tb