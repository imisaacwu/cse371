/* Register file module for specified data and address bus widths.
 * Asynchronous read port (r_addr -> r_data) and synchronous write
 * port (w_data -> w_addr if w_en).
 */
module reg_file #(parameter DATA_WIDTH=16, ADDR_WIDTH=2)
                (clk, w_data, w_en, w_addr, r_addr, r_data, same_read);

	input  logic clk, w_en, same_read;
	input  logic [ADDR_WIDTH-1:0] w_addr, r_addr;
	input  logic [DATA_WIDTH-1:0] w_data;
	output logic [DATA_WIDTH-1:0] r_data;
	
	// array declaration (registers)
	//stores 2x data width, but reads data_width at a time
	logic [2*DATA_WIDTH-1:0] array_reg [0:2**ADDR_WIDTH-1];
	
	// write operation (synchronous)
	always_ff @(posedge clk)
	   if (w_en)
		   array_reg[w_addr] <= w_data;
	
	// read operation (asynchronous)
	always_comb begin
		if (same_read) begin
			r_data = array_reg[r_addr][DATA_WIDTH/2-1:0];
		end else begin
			r_data = array_reg[r_addr][DATA_WIDTH-1:DATA_WIDTH/2];
		end
	end // always_comb
	
endmodule  // reg_file