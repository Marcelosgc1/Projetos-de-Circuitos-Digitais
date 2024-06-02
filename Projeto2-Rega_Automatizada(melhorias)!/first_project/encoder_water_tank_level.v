/* Encodes the eight measurement possibilities 
   of the water tank into four possibilities. */

module encoder_water_tank_level
(
	input  high_level_indicator_i,
	input  medium_level_indicator_i,
	input  low_level_indicator_i,
	output bit0_o,
	output bit1_o
);
	
	// Declaring wires
	wire w0;
	
	// Applying XNOR gate to high and medium level signals
	xnor xnor0
	(
		w0, high_level_indicator_i, 
		medium_level_indicator_i
	);
	
	// Computing the output values
	and bit0_value(bit0_o, w0, low_level_indicator_i);
	and bit1_value
	(
		bit1_o, low_level_indicator_i, 
		medium_level_indicator_i
	);
	
endmodule 
