/* Encodes the irrigations states into three possibilities. */

module encoder_irrigation_condition
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
	not not0(w0, drip_status_i);
	not not1(w1, sprinkler_status_i);
	
	// Applying XNOR gates between each 
	// irrigation system and irrigation status
	xnor xnor0(w2, irrigation_status_i, sprinkler_status_i);
	xnor xnor1(w3, irrigation_status_i, drip_status_i);
	
	// Using AND gate into the XNOR gates outputs
	// and the status of each inverted irrigation system
	and bit0_value(bit0_o, w0, w2);
	and bit1_value(bit1_o, w1, w3);
	

endmodule
