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
		{Resetn, s, LA, EB, Done, DataA, DataB, R, Q} <= '0;	@(posedge clk)	// Reset everything
		
		$stop;
	end

endmodule	// divider_tb