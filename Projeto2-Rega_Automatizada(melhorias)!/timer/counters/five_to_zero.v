
/* */

module five_to_zero
(
	input  clk, 
	output [3:0] bin_number,
	input [3:0]clear,
	input [3:0]preset
);
	wire [5:0] aux;
	
	
	
	// J0 and K0
	not inv0(aux[0], clk);
	or  or0(aux[1], clk, aux[0]);
	FFJK jk_ff0(clk, aux[1], aux[1], bin_number[0], , clear[0], preset[0]);
	
	// J1 and K1
	not inv1(aux[2], bin_number[0]);
	and and0(aux[3], bin_number[2], aux[2]);
	FFJK jk_ff1(clk, aux[3], aux[2], bin_number[1], , clear[1], preset[1]);
	
	// J2 and K2
	not inv2(aux[4], bin_number[1]);
	and and1(aux[5], aux[4], aux[2]);
	FFJK jk_ff2(clk, aux[5], aux[2], bin_number[2], , clear[2], preset[2]);
	
	// Granting the MSB to be always 0, 
	// as decoder supports only 4-bit vectors
	and and2(bin_number[3], clk, aux[0]);
	
endmodule
