module counter_9_0(
	input wire        clk,
	input			init,
	input wire  [1:0]preset,
	output wire [3:0] bin_number
);
	wire [6:0] aux;
	wire [2:0] inv_jk;

	// J0 and K0
	jk_flip_flop jk_ff0(1, 1, clk, init, preset[0], bin_number[0], inv_jk[0]);
	
	// J1 and K1
	or  or0 (aux[0], bin_number[2], bin_number[3]);
	and and0(aux[1], inv_jk[0], aux[0]);
	not inv0(aux[2], bin_number[0]);
	
	jk_flip_flop jk_ff1(aux[1], aux[2], clk, init, preset[1], bin_number[1], inv_jk[1]);
	
	// J2 and K2
	and and1(aux[3], inv_jk[0], bin_number[3]);
	and and2(aux[4], inv_jk[0], inv_jk[1]);
	
	jk_flip_flop jk_ff2(aux[3], aux[4], clk, init, preset[0], bin_number[2], inv_jk[2]);
	
	// J3 and K3
	and and3(aux[5], inv_jk[0], inv_jk[1], inv_jk[2]);
	not inv1(aux[6], bin_number[0]);
	
	jk_flip_flop jk_ff3(aux[5], aux[6], clk, init, , bin_number[3], );

endmodule