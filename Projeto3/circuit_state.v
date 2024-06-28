module circuit_state(input clk, input initialize, input [3:0]water_tank_level, input [1:0]irrigation, output [1:0]state);


d_flip_flop bit0(d0, clk, state[0], initialize);
d_flip_flop bit1(d1, clk, state[1], initialize);


//D0 comb circuit
//!state[0].!state[1].water_tank_level[0].(irrigation[0]+irrigation[1]) + state[0].water_tank_level[2]
or(d0, aux0, aux1);


or(aux2, irrigation[0], irrigation[1]);
and(aux0, !state[0], !state[1], aux2, water_tank_level[0]);
and(aux1, state[0], water_tank_level[2]);



//D1 comb circuit
or(d1, aux3, aux4, aux5, aux6, aux7);

and(aux3, !water_tank_level[2], state[0]);
and(aux4, water_tank_level[3], state[1]);
and(aux5, state[0], state[1]);
and(aux6, state[0], irrigation[1], !water_tank_level[1]);
and(aux7, !state[0], !state[1], irrigation[1], !irrigation[0], water_tank_level[0]);





endmodule
