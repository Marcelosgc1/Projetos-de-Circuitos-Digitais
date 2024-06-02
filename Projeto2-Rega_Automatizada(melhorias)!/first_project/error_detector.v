/* Search for measurement errors in the water tank. */

module error_detector
(
	input wire  high_level_indicator_i,	
	input wire  medium_level_indicator_i,	
	input wire  low_level_indicator_i,	
	output wire error_indicator_o
);
	
	// Declaring wires
	wire w0, w1, w2, w3;
	
	// Inverting both medium and low signals
	not inv0(w0, medium_level_indicator_i);
	not inv1(w1, low_level_indicator_i);
	
	// Applying AND gates to:
	//		- High and inverted medium signals
	//		- Medium and inverted low signals
	and and0(w2, high_level_indicator_i, w0);
	and and1(w3, medium_level_indicator_i, w1);
	
	// Using the OR gate in the outputs of the AND gates
	or error_checking_result(error_indicator_o, w3, w2);
	
endmodule
