/* Displays the irrigation status and 
   the water tank level in an LED array */

module irrigation_and_water_level_display
(
	input  wire			clk,
	input  wire			_1Hz_frequency,
	input  wire [1:0] irrigation_status,
   input  wire [1:0] tank_level_status,
	output wire [6:0] rows_status,
	output wire [4:0] columns_status
);
	wire [69:0] rows_values;
	wire [34:0] selected_values;
	wire 			aux, slowed_1Hz_frequency;
	
	irrigation_status_decoder decodes_irrigation_status(
		irrigation_status,
		rows_values[34:0]
	);
	
	water_tank_level_decoder decodes_water_tank_level(
		_1Hz_frequency,
		tank_level_status,
		rows_values[69:35]
	);
	
	// Slows the clock and uses it as a selector
	t_flip_flop t_ff0_slows_1Hz_frequency(1, _1Hz_frequency, , aux, );
	t_flip_flop t_ff1_slows_1Hz_frequency(1, aux, , slowed_1Hz_frequency, );
	
	decoders_muxes selects_rows_values(
		rows_values,
		slowed_1Hz_frequency,
		selected_values
	);
	
	// Sends the output of the decoders to the LED array driver
	driver controls_matrix_leds(
		clk,
		selected_values,
		rows_status,
		columns_status
	);
	
endmodule
