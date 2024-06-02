/* Instantiates the multiplexers to
	the seven lines of the LED array */

module driver_rows_muxes
(
	input wire  [34:0] rows_values,
	input wire  [ 2:0] bin_number,
	output wire [ 6:0] rows_status
);
	// Each mux receives the nth input from its source

	driver_mux_5x1 muxes_first_value(
		{rows_values[28], 
		 rows_values[21], 
		 rows_values[14], 
		 rows_values[ 7], 
		 rows_values[ 0]},  
		bin_number, 
		rows_status[0]
	);
	
	driver_mux_5x1 muxes_second_value(
		{rows_values[29], 
		 rows_values[22], 
		 rows_values[15], 
		 rows_values[ 8], 
		 rows_values[ 1]}, 
		bin_number, 
		rows_status[1]
	);
	
   driver_mux_5x1 muxes_third_value(
		{rows_values[30], 
		 rows_values[23], 
		 rows_values[16], 
		 rows_values[ 9], 
		 rows_values[ 2]}, 
		bin_number, 
		rows_status[2]
	);
	
   driver_mux_5x1 muxes_fourth_value(
		{rows_values[31], 
		 rows_values[24], 
		 rows_values[17], 
		 rows_values[10], 
		 rows_values[ 3]}, 
		bin_number, 
		rows_status[3]
	);
	
	driver_mux_5x1 muxes_fifth_value(
		{rows_values[32], 
		 rows_values[25], 
		 rows_values[18], 
		 rows_values[11], 
		 rows_values[ 4]}, 
		bin_number, 
		rows_status[4]
	);
	
	driver_mux_5x1 muxes_sixth_value(
		{rows_values[33], 
		 rows_values[26], 
		 rows_values[19], 
		 rows_values[12], 
		 rows_values[ 5]}, 
		bin_number, 
		rows_status[5]
	);
	
	driver_mux_5x1 muxes_seventh_value(
		{rows_values[34], 
		 rows_values[27], 
		 rows_values[20], 
		 rows_values[13], 
		 rows_values[6]}, 
		bin_number, 
		rows_status[6]
	);

endmodule
