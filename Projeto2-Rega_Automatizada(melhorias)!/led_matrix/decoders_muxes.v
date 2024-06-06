/* Instantiates multiplexers to display the 
	water tank level or the irrigation status */

module decoders_muxes
(
	input  wire [69:0] rows_values,
	input  wire 		 bin_number_sel,
	output wire [34:0] rows_status
);
	// Each mux selects one image from a column
	decoder_mux_2x1_7bits selects_to_column0(
		{rows_values[6:0], rows_values[41:35]},
		 bin_number_sel,
		 rows_status[6:0]
	);
	
	decoder_mux_2x1_7bits selects_to_column1(
		{rows_values[13:7], rows_values[48:42]},
		 bin_number_sel,
		 rows_status[13:7]
	);
	
	decoder_mux_2x1_7bits selects_to_column2(
		{rows_values[20:14], rows_values[55:49]},
		 bin_number_sel,
		 rows_status[20:14]
	);
	
	decoder_mux_2x1_7bits selects_to_column3(
		{rows_values[27:21], rows_values[62:56]},
		 bin_number_sel,
		 rows_status[27:21]
	);
	
	decoder_mux_2x1_7bits selects_to_column4(
		{rows_values[34:28], rows_values[69:63]},
		 bin_number_sel,
		 rows_status[34:28]
	);

endmodule
