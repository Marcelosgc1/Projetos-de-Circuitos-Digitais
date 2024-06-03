/* Synchronous crescent counter with range from 0 to 4 */

module driver_zero_four_counter
(
	input wire        clk,
	output wire [2:0] bin_number
);
	wire [1:0] aux;
	
	// J0 and K0
	not inv0(aux[0], bin_number[2]);
	jk_flip_flop jk_ff0(aux[0], 1, clk, , , bin_number[0], );
	
	// J1 and K1
	jk_flip_flop jk_ff1(bin_number[0], bin_number[0], clk, , , bin_number[1], );
	
	// J2 and K2
	and and0(aux[1], bin_number[0], bin_number[1]);
	jk_flip_flop jk_ff2(aux[1], 1, clk, , , bin_number[2], );

endmodule
