/* Selects seven bits from the values to the rows of LED array */

module decoder_mux_2x1_7bits
(
	input wire  [13:0] rows_values,
	input wire  		 bin_number_sel,
	output wire [ 6:0] selected_values
);
	// Each mux selects the nth value from two decoders
	decoder_mux_2x1 muxes_value0(
		{rows_values[0], rows_values[7]}, 
		 bin_number_sel,
		 selected_values[0]
	);
	
	decoder_mux_2x1 muxes_value1(
		{rows_values[1], rows_values[8]}, 
		 bin_number_sel,
		 selected_values[1]
	);
	
	decoder_mux_2x1 muxes_value2(
		{rows_values[2], rows_values[9]}, 
		 bin_number_sel,
		 selected_values[2]
	);
	
	decoder_mux_2x1 muxes_value3(
		{rows_values[3], rows_values[10]}, 
		 bin_number_sel,
		 selected_values[3]
	);
	
	decoder_mux_2x1 muxes_value4(
		{rows_values[4], rows_values[11]}, 
		 bin_number_sel,
		 selected_values[4]
	);
	
	decoder_mux_2x1 muxes_value5(
		{rows_values[5], rows_values[12]}, 
		 bin_number_sel,
		 selected_values[5]
	);
	
	decoder_mux_2x1 muxes_value6(
		{rows_values[6], rows_values[13]}, 
		 bin_number_sel,
		 selected_values[6]);

endmodule

	
	