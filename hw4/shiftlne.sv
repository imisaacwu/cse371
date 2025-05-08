/* left shift register for use in homework 4.
 *
 * Inputs:
 *   R      - input to load into register
 *   L      - signal to load new value
 *   E      - enable signal to shift bits
 *   w      - new bit to shift into register
 *   Clock  - should be connected to a 50 MHz clock
 *
 * Outputs:
 *   Q     - current stored value
 *
 * Parameters:
 *   n     - bit-length of register
 */
module shiftlne (R, L, E, w, Clock, Q);
	parameter n = 4;
	input [n-1:0] R;
	input L, E, w, Clock;
	output reg [n-1:0] Q;
	integer k;

	always @(posedge Clock)
	begin
		if (L)
			Q <= R;
		else if (E)
			begin
				for (k = n-1; k >= 1; k = k-1) //changed from n-1 to 1, bus could be [0, 1, 1, 0, 0] where Q[0] is rightmost and Q[n-1] is leftmost, to shift left, set Q[n-1] to Q[n-2], Q[n-2] to Q[n-3], ..., Q[1] to Q[0], Q[0] to w
					Q[k] <= Q[k-1];
				Q[0] <= w; //shifting shift operation order, do w last (was first before) and do Q[0]
			end
	end

endmodule

