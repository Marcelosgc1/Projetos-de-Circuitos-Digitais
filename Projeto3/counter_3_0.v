module counter_3_0(input clk, input init, input [1:0]preset, output [1:0]Q);

jk_flip_flop (1, 1, clk, init, preset[0], Q[0]);
jk_flip_flop (!Q[0], !Q[0], clk, init, preset[1], Q[1]);



endmodule