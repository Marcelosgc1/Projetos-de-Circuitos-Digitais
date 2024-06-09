/* Manages each dot of the 7-segment 
   display based on the selected digit */

module dot_enabler
(
	input  wire [1:0] frequencies,
	output wire 		dot_status
);
	wire aux;
	
	not inv0(aux, frequencies[1])

	or  dot_signal(dot_status, frequencies[0], aux);

endmodule
