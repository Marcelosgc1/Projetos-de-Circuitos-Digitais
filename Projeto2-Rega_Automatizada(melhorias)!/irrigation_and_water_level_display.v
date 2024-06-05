/* Displays the irrigation status and 
   the water tank level in an LED array */

module irrigation_and_water_level_display
(
	input  wire			clk,
//	input  wire			_1Hz_frequency,
	input  wire [1:0] irrigation_status,
// input  wire [1:0] water_tank_level,
	output wire [6:0] rows_status,
	output wire [4:0] columns_status
);
	wire [34:0] rows_values;
	
	irrigation_status_decoder(
		irrigation_status,
		rows_values
	);
	
	// Sends the output of the decoders to the LED array driver
	driver(
		clk,
		rows_values,
		rows_status,
		columns_status
	);
	
	/* #TODO:
	   - Implement display of water tank level;
		- Make the multiplexing between water level and irrigation
	*/
	
endmodule
