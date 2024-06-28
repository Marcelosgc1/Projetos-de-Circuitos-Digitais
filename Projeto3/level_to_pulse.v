module level_to_pulse(input clk, input [1:0]state, output pulse);









d_flip_flop(pulse, clk, qc);

d_flip_flop(state[1], clk, q1);

d_flip_flop(state[0], clk, q0);




or(pulse, aux0, aux1);

xor(aux0, q0, state[0]);

xor(aux1, q1, state[1]);




endmodule