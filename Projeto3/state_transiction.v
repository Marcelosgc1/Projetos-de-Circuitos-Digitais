module state_transiction(input clk, input [1:0]state, output pulse);

level_to_pulse(clk, state[0], aux0);
level_to_pulse(clk, !state[0], aux1);
level_to_pulse(clk, state[1], aux2);
level_to_pulse(clk, !state[1], aux3);

or(pulse, aux0, aux1, aux2, aux3);

endmodule
