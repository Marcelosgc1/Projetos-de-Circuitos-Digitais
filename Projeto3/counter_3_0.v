module counter_3_0(input clk, input init, input [1:0]preset, input [1:0]reset, output [1:0]Q);

or(clear0, init, reset[0]);
or(clear1, init, reset[1]);

jk_flip_flop (1, 1, clk, clear0, preset[0], Q[0]);
jk_flip_flop (!Q[0], !Q[0], clk, clear1, preset[1], Q[1]);



endmodule