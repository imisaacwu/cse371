/* Module for EE/CSE371 Homework 1 Problem 2.
 * An arbitrary Mealy FSM.
 */
module hw1p2 (clk, reset, in, out);
	input logic clk, reset, in;
	output logic out;
	
	enum logic [2:0] {S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100} ps, ns;
	
	always_comb begin
		case (ps)
			S0: ns = (in ? S4 : S3);			
			S1: ns = (in ? S4 : S1);			
			S2: ns = (in ? S0 : S2);			
			S3: ns = (in ? S2 : S1);
			S4: ns = (in ? S3 : S2);
			default: ns = ps;
		endcase
		
		out = (in && ns != S3);
	end

	always_ff @(posedge clk)
		ps <= (reset ? S0 : ns);

endmodule  // hw1p2
