/* Testbench for Homework 3 Problem 1 */
module fifo_tb ();

	// for you to implement
	parameter DATA_WIDTH = 8, ADDR_WIDTH = 4;
	logic clk, reset, rd, wr, empty, full;
	logic [DATA_WIDTH*2-1:0] w_data;
	logic [DATA_WIDTH-1:0] r_data;

	initial begin
	
		// for you to implement
		
	end  // initial
	
endmodule  // fifo_tb
