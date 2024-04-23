/* Outputs the irrigation condition on the 7-segment display. If 
   irrigation is disabled, it displays a segment in the middle of
   a digit, otherwise it displays the irrigation mode being used. */

module decoder_irrigation_condition
(
	input  bit0_i,
	input  bit1_i,
	output segment_a_o,
	output segment_b_o,
	output segment_c_o,
	output segment_d_o,
	output segment_e_o,
	output segment_f_o,
	output segment_g_o
);

	// Declaring wires
	wire w0;
	
	// Inverting the LSB input from irrigation encoder
	not inv0(w0, bit0_i);
	
	// Using several AND gates to activate each segment correctly
	and segment_a_status(segment_a_o, bit0_i, bit1_i);
	and segment_b_status(segment_b_o, bit1_i, bit1_i);
	and segment_c_status(segment_c_o, bit0_i, bit1_i);
	and segment_d_status(segment_d_o, bit0_i, bit0_i);
	and segment_e_status(segment_e_o, bit0_i, bit1_i);
	and segment_f_status(segment_f_o, bit0_i, bit1_i);
	and segment_g_status(segment_g_o, w0, bit1_i);	
	
endmodule
