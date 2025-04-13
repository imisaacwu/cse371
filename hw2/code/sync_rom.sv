/* sync_rom is an example module that implements a read-only
 * memory (ROM) whose data is loaded from a file using the
 * $readmem system task. Currently takes in a 1-bit clk signal
 * along with a 4-bit addr to select from its 16 addresses.
 * The output data is 7 bits wide.
 */
module sync_rom (input  logic clk,
					  input  logic [3:0] addr,
					  output logic [6:0] data);
	
	// signal declaration
	logic [6:0] rom [0:15];
	
	// load binary values from a dummy text file into ROM
	initial
		$readmemb("data.txt", rom);
	
	// synchronously reads out data from requested addr
	always_ff @(posedge clk)
		data <= rom[addr];
	
endmodule  // sync_rom