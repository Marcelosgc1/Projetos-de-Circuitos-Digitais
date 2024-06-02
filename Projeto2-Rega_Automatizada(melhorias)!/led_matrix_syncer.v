/* */

module led_matrix_syncer
(
	input wire  [2:0] bin_number,
	output wire [1:0] pulses
);
	wire [1:0] aux;
	
	// Drip mode pulse
	and and0(pulses[0], bin_number[0], bin_number[2]);
	
	// Sprinkler mode pulse
	not inv0(aux[0], bin_number[0]);
	and and1(aux[1], aux[0], bin_number[1]);
	or  or0(pulses[1], aux[1], pulses[0]);

endmodule
