/* Activates each segment of the 7-segment display based
	on the level of the water tank provided by the encoder. */

module decoder_water_tank_level
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

	/***************************************************************** 
	 * INPUT POSSIBILITIES | OUTPUT ON DISPLAY | 		MEANING 		  *
	 *---------------------|-------------------|---------------------*
	 * 	      00			  | 			0 	 		 | ERROR / CRIT LEVEL  *
	 *			   01			  |			1	 		 |	LOW LEVEL		     *
	 *          10         |			2	 		 |	MEDIUM LEVEL        *
	 *			   11			  |			3	 		 | HIGH LEVEL	 	     *
	 *****************************************************************/
	
	// Declaring wires
	wire w0;
	
	// Inverting bit1 from encoder
	not inv0(w0, bit1_i);
	
	// Applying several logic gates to activate each segment correctly
	not segment_a_status(segment_a_o, bit1_i); 
	nor segment_b_status(segment_b_o, bit0_i, bit1_i);	
	not segment_c_status(segment_c_o, bit0_i); 
	not segment_d_status(segment_d_o, bit1_i);
	or  segment_e_status(segment_e_o, bit0_i, w0);
	or  segment_f_status(segment_f_o, bit1_i, w0);
	and segment_g_status(segment_g_o, bit0_i, w0);
			
endmodule 
