/* Decodes the water level on a 5x7 LED array */

module water_tank_level_decoder
(
	input  wire        _1Hz_frequency,
	input  wire [1:0]  tank_level_status,
	output wire [34:0] rows_values
);
	// Each decoder outputs the image of one column
	water_tank_level_decoder_column0 decodes_to_column0(
		tank_level_status,
		rows_values[6:0]
	);
	
	water_tank_level_decoder_column1 decodes_to_column1(
		tank_level_status,
		rows_values[13:7]
	);
	
	water_tank_level_decoder_column2 decodes_to_column2(
		_1Hz_frequency,
		tank_level_status,
		rows_values[20:14]
	);
	
	water_tank_level_decoder_column3 decodes_to_column3(
		tank_level_status,
		rows_values[27:21]
	);
	
	water_tank_level_decoder_column4 decodes_to_column4(
		tank_level_status,
		rows_values[34:28]
	);

endmodule
