module water_level_indicator(input init, input clk, input state, output [1:0]Q, output flag);

//flip-flops
d_flip_flop bit0(D0, clk, Q[0], init);
d_flip_flop bit1(D1, clk, Q[1], init);

//combinacional
or(D0, state, Q[1]);
and(D1, state, Q[0]);

//flag
and(aux0, state, Q[0]);
or(flag, aux0, Q[1]);

endmodule
