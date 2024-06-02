/* Decides whether the irrigation system should be activated
	or deactivated, according to the alarm and soil humidity. */

module irrigation_trigger
(
	input wire  alarm_state_i,
	input wire  soil_humidity_i,
	output wire irrigation_state_o
);
	
	// Applying the NOR gate in the alarm state and soil humidity signals
	nor irrigiration_activation_result
	(
		 irrigation_state_o,
		 alarm_state_i,
		 soil_humidity_i
	);

endmodule 