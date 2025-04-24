/* Arbitrary ASM chart implementation to examine output timings */
module hw3p3 (clk, reset, X, Ya, Yb, Yc, Z1, Z2);
	input logic clk, reset, X;
	output logic Ya, Yb, Yc, Z1, Z2;
	
	enum logic [1:0] {S0 = 2'b00, S1 = 2'b01, S2 = 2'b10} ps, ns;
	
	always_comb begin
		case (ps)
			S0: begin
				ns = X ? S1 : S0;
				{Z1, Z2} = '0;
			end // S0
			
			S1: begin
				ns = X ? S2 : S0;
				{Z1, Z2} = '0;
			end // S1
			
			S2: begin
				ns = X ? S2 : S0;
				{Z1, Z2} = {!X, X};
			end // S2
			
			default: begin
				ns = ps;
				{Z1, Z2} = '0;
			end
		endcase
	end // always_comb
	
	assign Ya = (ps == S0);
	assign Yb = (ps == S1);
	assign Yc = (ps == S2);
	
	always_ff @(posedge clk)
		ps <= (reset ? S0 : ns);
	
endmodule  // hw3p3
