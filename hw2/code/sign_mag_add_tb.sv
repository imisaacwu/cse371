/* Testbench for Homework 2 Problem 3 */
module sign_mag_add_tb ();
	parameter N = 4;
	logic [N-1:0] sum;   // for the output of sign_mag_add - do not rename
	logic [N-1:0] data;  // for the output of sync_rom - do not rename
	
	logic [N-1:0] a, b;
	
	sign_mag_add dut1 (.*);

	// for you to implement BOTH sign_mag_add and sync_rom
	
	initial begin
		{a, b} = 8'h10; #10; //  1 +  0
		{a, b} = 8'h7F; #10; //  7 + -7
		{a, b} = 8'h79; #10; //  7 + -1
		{a, b} = 8'h1B; #10; //  1 + -3
		{a, b} = 8'h11; #10; //  1 +  1
		{a, b} = 8'h77; #10; //  7 +  7
		{a, b} = 8'h99; #10; // -1 + -1
		{a, b} = 8'hFF; #10; // -7 + -7
		
	end  // initial
	
endmodule  // sign_mag_add_tb