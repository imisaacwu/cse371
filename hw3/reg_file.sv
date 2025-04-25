/* Register file module for specified data and address bus widths.
 * Asynchronous read port (r_addr -> r_data) and synchronous write
 * port (w_data -> w_addr if w_en).
 */
module reg_file #(parameter DATA_WIDTH=8, ADDR_WIDTH=2)
                (clk, w_data, w_en, w_addr, r_addr, r_data);

	input  logic clk, w_en;
	input  logic [ADDR_WIDTH-1:0] w_addr, r_addr;
	input  logic [2*DATA_WIDTH-1:0] w_data;
	output logic [DATA_WIDTH-1:0] r_data;
	
	// array declaration (registers)
	//stores 2x data width, but reads data_width at a time
	logic [DATA_WIDTH-1:0] array_reg [0:2**ADDR_WIDTH-1];
	
	// write operation (synchronous)
	always_ff @(posedge clk)
	   if (w_en) begin
		   array_reg[w_addr] <= w_data[2*DATA_WIDTH-1:DATA_WIDTH];
			array_reg[w_addr + 1'b1] <= w_data[DATA_WIDTH-1:0];
		end
	
	// read operation (asynchronous)
	assign r_data = array_reg[r_addr];
	
endmodule  // reg_file