/* Triggers an alarm if an error ocurrs or 
	if the water tank is at critical level. */

module alarm_trigger
(
	input wire  low_level_indicator_i,
	input wire  error_indicator_i,
	output wire alarm_state_o
);	
	// Declaring wire w0
	wire w0;
	
	// Inverting the low level signal
	not inv0(w0, low_level_indicator_i);
	
	// Applying the OR gate between the error and inverted low signals
	or alarm_activation_result(alarm_state_o, error_indicator_i, w0);
	
endmodule
