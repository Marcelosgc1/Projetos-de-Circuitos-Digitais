/* Controls inlet valve status based 
	on water level and error sensor. */

module inlet_valve_trigger
(
	input wire  high_level_indicator_i,
	input wire  error_indicator_i, 
	output wire valve_state_o
);
	
	// Uses the NOR gate on error and high level signals  
	nor valve_activation_result
	(
		 valve_state_o, 
		 error_indicator_i, 
		 high_level_indicator_i
	);
	
endmodule
