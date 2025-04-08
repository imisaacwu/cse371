/* Testbench for Homework 1 Problem 1 */
module hw1p1_tb();
	logic clk, reset, x, y, S;
	
	hw1p1 dut (clk, reset, x, y, S);

	parameter CLK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD / 2) clk <= ~clk;
	end

	initial begin
		// Initialize
		reset <= 0;	x <= 0;	y <= 0;	S <= 0;
		reset <= 1;										@(posedge clk);
		reset <= 0;										@(posedge clk);
		
		// 0 + 0
															@(posedge clk);
															@(posedge clk);
															@(posedge clk);
		// 1 + 0
						x <= 1;							@(posedge clk);
															@(posedge clk);
															@(posedge clk);
		// 0 + 1
						x <= 0;	y <= 1;				@(posedge clk);
															@(posedge clk);
															@(posedge clk);
		// 1 + 1
						x <= 1;							@(posedge clk);
															@(posedge clk);
															@(posedge clk);
		$stop;
		
	end  // initial
	
endmodule  // hw1p1_tb
