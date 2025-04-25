/* Testbench for Homework 3 Problem 3 */
module hw3p3_tb ();
	
	// for you to implement
	logic clk, reset, X, Ya, Yb, Yc, Z1, Z2;
	
	parameter CLOCK_PERIOD=10;
   initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	hw3p3 dut (.*);
	
	initial begin
		
		// for you to implement
		reset <= 1; X <= 0; 	@(posedge clk); // reset
		reset <= 0; X <= 0;	@(posedge clk); // s0 > s0
		X <= 1;					@(posedge clk); // s0 > s1
		X <= 0;					@(posedge clk); // s1 > s0
		X <= 1;					@(posedge clk); // s0 > s1
		X <= 1;					@(posedge clk); // s1 > s2
		X <= 1;					@(posedge clk); // s2 > s2 (z2)
		X <= 0;					@(posedge clk); // s2 > s0 (z1)
		X <= 1;					@(posedge clk); // s0 > s1
		reset <= 1;				@(posedge clk); // s1 > s0 [reset test]
									@(posedge clk);
									@(posedge clk);
		
		
		$stop;
		
	end  // initial
	
endmodule  // hw3p3_tb
