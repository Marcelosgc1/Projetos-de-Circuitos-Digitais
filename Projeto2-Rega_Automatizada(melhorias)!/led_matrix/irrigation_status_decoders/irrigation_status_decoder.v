/* Decodes the current irrigation condition */

module irrigation_status_decoder
(
	input wire  [ 1:0] irrigation_status,
	output wire [34:0] rows_values
	
);
	// Each decoder outputs the image of one column

	irrigation_status_decoder_column0 decodes_to_column0(
		irrigation_status, 
		rows_values[6:0]
	);
	
	irrigation_status_decoder_column1 decodes_to_column1(
		irrigation_status, 
		rows_values[13:7]
	);
	
	irrigation_status_decoder_column2 decodes_to_column2(
		irrigation_status, 
		rows_values[20:14]
	);
	
	irrigation_status_decoder_column3 decodes_to_column3(
		irrigation_status, 
		rows_values[27:21]
	);
	
	irrigation_status_decoder_column4 decodes_to_column4(
		irrigation_status, 
		rows_values[34:28]
	);

endmodule
