/* Synchronous descending counter with range from 5 to 0 */

module timer_five_zero_counter
(
	input  wire       clk, 
	input  wire [3:0] clear, preset,
	output wire [3:0] bin_number
);
	wire [5:0] aux;
	
	// J0 and K0
	jk_flip_flop jk_ff0(1, 1, clk, clear[0], preset[0], bin_number[0], );
	
	// J1 and K1
	not inv1(aux[0], bin_number[0]);
	and and0(aux[1], bin_number[2], aux[0]);
	
	jk_flip_flop jk_ff1(aux[1], aux[0], clk, clear[1], preset[1], bin_number[1], );
	
	// J2 and K2
	not inv2(aux[2], bin_number[1]);
	and and1(aux[3], aux[2], aux[0]);
	
	jk_flip_flop jk_ff2(aux[3], aux[0], clk, clear[2], preset[2], bin_number[2], );
	
	// Granting the MSB to be always 0, 
	// as decoder supports only 4-bit vectors
	assign bin_number[3] = 0;
	
endmodule

