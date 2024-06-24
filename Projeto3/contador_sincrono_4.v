module contador_sincrono_4(input clk, output [1:0]q);

	d_flip_flop(!q[0], clk, q[0]);
	d_flip_flop(d1, clk, q[1]);

	xor(d1, q[0], q[1]);


endmodule
