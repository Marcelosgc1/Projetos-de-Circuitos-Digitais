module counter_9_0(
	input wire	clk,
	input 		init,
	input wire  [1:0]preset,
	input wire  [1:0]reset,
	output wire [3:0] bin_number
);
wire [6:0] aux;
wire [2:0] inv_jk;

or(reset_bit_3,reset[0],reset[1]);

or(clear0, init, reset[0]);
or(clear1, init, reset[1]);
or(clear2, init, reset[0]);
or(clear3, init, reset_bit_3);



// J0 and K0
jk_flip_flop jk_ff0(1, 1, clk, clear0, preset[0], bin_number[0], inv_jk[0]);

// J1 and K1
or  or0 (aux[0], bin_number[2], bin_number[3]);
and and0(aux[1], inv_jk[0], aux[0]);
not inv0(aux[2], bin_number[0]);

jk_flip_flop jk_ff1(aux[1], aux[2], clk, clear1, preset[1], bin_number[1], inv_jk[1]);

// J2 and K2
and and1(aux[3], inv_jk[0], bin_number[3]);
and and2(aux[4], inv_jk[0], inv_jk[1]);

jk_flip_flop jk_ff2(aux[3], aux[4], clk, clear2, preset[0], bin_number[2], inv_jk[2]);

// J3 and K3
and and3(aux[5], inv_jk[0], inv_jk[1], inv_jk[2]);
not inv1(aux[6], bin_number[0]);

jk_flip_flop jk_ff3(aux[5], aux[6], clk, clear3, , bin_number[3], );

endmodule