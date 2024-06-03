/* Debouncer to push-buttons */

module debouncer
(
	input  wire button_signal, clk, 
	output wire start_signal
);
	wire [2:0] aux;
	wire d_ff2_bar;
	
	d_flip_flop d_ff0(button_signal, clk, aux[0]);
	d_flip_flop d_ff1(aux[0], clk, aux[1]);
	d_flip_flop d_ff2(aux[1], clk, aux[2]);

	not inv0(d_ff2_bar, aux[2]);
	
	and button_pulse(start_signal, aux[1], d_ff2_bar);

endmodule
