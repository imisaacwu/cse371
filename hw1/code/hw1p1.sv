/* Module for EE/CSE371 Homework 1 Problem 1.
 * A simple synchronous signal with a DFF and fullAdder.
 */
module hw1p1 (clk, reset, x, y, S);
	input logic clk, reset, x, y;
	output logic S;
	logic Q, C;
	
	fullAdder adder (.a(x), .b(y), .cin(Q), .sum(S), .cout(C));
	
	always_ff @(posedge clk) begin
		if (reset) Q <= 0;
		else Q <= C;
	end

endmodule  // hw1p1
