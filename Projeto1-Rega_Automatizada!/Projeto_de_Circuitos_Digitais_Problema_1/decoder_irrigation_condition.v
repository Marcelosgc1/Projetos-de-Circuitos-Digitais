/* Outputs the irrigation condition on the 7-segment display. If 
   irrigation is disabled, it displays a segment in the middle of
   a digit, otherwise it displays the irrigation mode being used. */

module decoder_irrigation_condition
(
	input  sprinkler_status_i,
	input  drip_status_i,
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
	
	// Inverting sprinkler output
	not inv0(w0, sprinkler_status_i);
	
	// Using several AND gates to activate each segment correctly
	nor segment_a_status(segment_a_o, sprinkler_status_i, drip_status_i);
	not segment_b_status(segment_b_o, sprinkler_status_i);
	nor segment_c_status(segment_c_o, sprinkler_status_i, drip_status_i);
	not segment_d_status(segment_d_o, drip_status_i);
	nor segment_e_status(segment_e_o, sprinkler_status_i, drip_status_i);
	nor segment_f_status(segment_f_o, sprinkler_status_i, drip_status_i);
	and segment_g_status(segment_g_o, w0, drip_status_i);	
	
endmodule
