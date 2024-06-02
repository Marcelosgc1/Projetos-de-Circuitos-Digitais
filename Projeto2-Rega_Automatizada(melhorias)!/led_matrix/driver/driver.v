/* Controls the LED matrix by synchronizing 
	multiplexers and a decoder through a counter */

module driver
(
	input wire 			 clk, 
	input wire  [34:0] rows_values,
   output wire [ 6:0] rows_status,
	output wire [ 4:0] columns_status
);
	wire [2:0] bin_number;
	
	driver_zero_four_counter counts_from_0to4(
		clk, 
		bin_number
	);
	
	driver_rows_muxes multiplexes_to_rows(
		rows_values, 
		bin_number, 
		rows_status
	);
	
	driver_columns_decoder decodes_to_columns(
		bin_number, 
		columns_status
	);
	 
endmodule
