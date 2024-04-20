/* Triggers drip system based on water tank level, 
	irrigation state, temperature and air humidity. */

module drip_trigger
(
	input wire  medium_level_indicator_i,
	input wire  irrigation_state_i,
	input wire  temperature_i,
	input wire  air_humidity_i,	
	output wire drip_state_o
);
	// Declaring wires
	wire w0, w1;
	
	// Iverting medium level signal
	not inv0(w0, medium_level_indicator_i);
	
	// Applying OR gate on inverted medium and temperature
	or or0(w1, w0, temperature_i);
	
	// Using AND gate between or0, air 
	// humidity and irrigation trigger
	and drip_activation_result
	(
		 drip_state_o, w1, 
		 air_humidity_i, 
		 irrigation_state_i
	);
	
endmodule
 