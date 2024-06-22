module water_level_indicator(input clk, input state, output [1:0]Q, output flag);

//flip-flops
d_flip_flop(D0, clk, Q[0]);
d_flip_flop(D1, clk, Q[1]);

//combinacional
or(D0, state, Q[1]);
and(D1, state, Q[0]);

//flag
and(aux0, state, Q[0]);
or(flag, aux0, Q[1]);

endmodule
