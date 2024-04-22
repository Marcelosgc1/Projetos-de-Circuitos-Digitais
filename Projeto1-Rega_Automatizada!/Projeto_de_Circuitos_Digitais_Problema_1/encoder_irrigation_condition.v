/* Encodes the irrigations states into three possibilities. */

module new_encoder_irrigation_condition
(
	input  sprinkler_status_i,
	input  drip_status_i,
	input  irrigation_status_i,
	output bit0_o,
	output bit1_o
);

	// Declaring wires
	wire w0, w1, w2, w3;
	
	// Reversing both outputs of irrigation systems
	not not0(w0, sprinkler_status_i);
	not not1(w1, drip_status_i);
	
	// Applying AND gates between each irrigation
	// system inverted and irrigation status
	and and0(w2, w0, irrigation_status_i);
	and and1(w3, w1, irrigation_status_i);
	
	// Using XNOR gate into the AND gates outputs
	// and the status of each irrigation system
	xnor bit0_value(bit0_o, w2, drip_status_i); 
	xnor bit1_value(bit1_o, w3, sprinkler_status_i);

endmodule
