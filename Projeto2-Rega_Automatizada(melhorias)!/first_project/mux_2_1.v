/* Selects one value of the inputs, referents the to water level
   and irrigation status, to display in the 7-segment display.  */

module mux_2_1
(
	input  segment_water_tank_level_i,
	input  segment_irrigation_condition_i,
	input  selector_i,
	output segment_value_o
);

	// Declaring wires
	wire w0, w1, w2;
	
	// Inverting the selector value
	not inv0(w0, selector_i);
	
	// Applying AND gates between the selector and decoder inputs 
	and and0(w1, w0, segment_water_tank_level_i);
	and and1(w2, selector_i, segment_irrigation_condition_i);
	
	// Using OR gate on the AND gates outputs
	or input_selected(segment_value_o, w1, w2);
	
endmodule
