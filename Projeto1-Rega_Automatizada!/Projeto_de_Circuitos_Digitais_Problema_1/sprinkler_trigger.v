/* Triggers sprinklers based on water tank level, 
	irrigation trigger, temperature and air humidity. */

module sprinkler_trigger
(
	input wire  medium_level_indicator_i,
	input wire  irrigation_state_i,
	input wire  temperature_i,
	input wire  air_humidity_i,
	output wire sprinker_state_o
);

	// Declaring wires
	wire w0, w1, w2, w3;
	
	// Inverting both air humidity and temperature signals
	not inv0(w0, air_humidity_i);
	not inv1(w1, temperature_i);
	
	// Using AND gate on medium level and inverted temperature signals
	and and0(w2, medium_level_indicator_i, w1);
	
	// Applying OR gate on inverted air humidity and and0 output
	or or0(w3, w0, w2);
	
	// Using AND gate between or0 and irrigation state
	and sprinkler_activaction_result(
		 sprinker_state_o, w3, 
		 irrigation_state_i);

endmodule
