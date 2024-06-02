/* Decodes the timer and displays it in 
	decimal format on a 7-segment display */

module timer_decoder_7seg_display
(
	input wire  [3:0] bin_number,
	output wire [6:0] segments
);
	wire [ 3:0] inv_bin_number;
	wire [16:0] aux;

	not  inv0(inv_bin_number[0], bin_number[0]); 
	not  inv1(inv_bin_number[1], bin_number[1]); 
	not  inv2(inv_bin_number[2], bin_number[2]); 
	not  inv3(inv_bin_number[3], bin_number[3]);

	// Segment A
	and  and0(aux[0], inv_bin_number[3], inv_bin_number[2], bin_number[0]);
	and  and1(aux[1], bin_number[2], inv_bin_number[0]);
	or   or0(aux[2], aux[0], aux[1]);
	
	and  seg_a_out(segments[0], aux[2], inv_bin_number[1]);

	// Segment B
	xor  xor0(aux[3], bin_number[1], bin_number[0]);
	
	and  seg_b_out(segments[1], aux[3], bin_number[2]);

	// Segment C
	and  seg_c_out(segments[2], inv_bin_number[2], bin_number[1], inv_bin_number[0]);

	// Segment D
	and  and2(aux[4], inv_bin_number[3], inv_bin_number[2], inv_bin_number[1], bin_number[0]);
	xnor xnor0(aux[5], bin_number[1], bin_number[0]);
	and  and3(aux[6], bin_number[2], aux[5]);

	or   seg_d_out(segments[3], aux[4], aux[6]);
	
	// Segment E
	and  and4(aux[7], bin_number[2], inv_bin_number[1]);
	
	or   seg_e_out(segments[4], bin_number[0], aux[7]);
	
	// Segment F
	and  and5(aux[8], inv_bin_number[3], inv_bin_number[2], bin_number[0]);
	or   or1(aux[9], bin_number[0], inv_bin_number[2]);
	and  and6(aux[10], bin_number[1], aux[9]);
	
	or   seg_f_out(segments[5], aux[8], aux[10]);
	
	// Segment G
	and  and7(aux[11], bin_number[2], bin_number[1], bin_number[0]);
	and  and8(aux[12], inv_bin_number[3], inv_bin_number[2], inv_bin_number[1]);
	
	or   seg_g_out(segments[6], aux[11], aux[12]);
	
endmodule
