/* Testbench for Homework 2 Problem 3 */
module sign_mag_add_tb ();
	parameter N = 4;
	logic [N-1:0] sum;   // for the output of sign_mag_add - do not rename
	logic [N-1:0] data;  // for the output of sync_rom - do not rename
	
	logic [N-1:0] a, b;
	
	sign_mag_add dut1 (.*);
	
	logic clk;
	//logic [15:0] row;
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	sync_rom dut2 (.clk(clk), .addr({a, b}), .data(data));

	// for you to implement BOTH sign_mag_add and sync_rom
	
	initial begin
		{a, b} <= 8'h10; @(posedge clk); //  1 +  0
		{a, b} <= 8'h7F; @(posedge clk); //  7 + -7
		{a, b} <= 8'h79; @(posedge clk); //  7 + -1
		{a, b} <= 8'h1B; @(posedge clk); //  1 + -3
		{a, b} <= 8'h11; @(posedge clk); //  1 +  1
		{a, b} <= 8'h77; @(posedge clk); //  7 +  7
		{a, b} <= 8'h99; @(posedge clk); // -1 + -1
		{a, b} <= 8'hFF; @(posedge clk); // -7 + -7
		$stop;
	end  // initial
	
endmodule  // sign_mag_add_tb