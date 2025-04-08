/* Testbench for Homework 1 Problem 2 */
module hw1p2_tb();
	logic clk, reset, in, out;

	hw1p2 dut (clk, reset, in, out);

	parameter CLK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD / 2) clk <= ~clk;
	end

	initial begin
		// Initialize
		reset <= 0;	in <= 0;	out <= 0;
		reset <= 1;								@(posedge clk);	// State: 000, out: 0
		
		reset <= 0;	in <= 1;					@(posedge clk);	// State: 100, out: 1
													@(posedge clk);	// State: 011, out: 0
						in <= 0;					@(posedge clk);	// State: 001, out: 0
													@(posedge clk);	// State: 001, out: 0
						in <= 1;					@(posedge clk);	// State: 100, out: 1
						in <= 0;					@(posedge clk);	// State: 010, out: 0
						in <= 1;					@(posedge clk);	// State: 000, out: 1
						in <= 0;					@(posedge clk);	// State: 011, out: 0
						in <= 1;					@(posedge clk);	// State: 010, out: 1
						in <= 0;					@(posedge clk);	// State: 010, out: 0
		reset <= 1;								@(posedge clk);	// State: 000, out: 0
		
		$stop;
		
	end  // initial
	
endmodule  // hw1p2_tb
