module encoder_timer(input [1:0]state, input [1:0]irrigation_type, output [2:0]timer);



// Bit 2
and(timer[2], state[0], !irrigation_type[0]);


// Bit 1
and(timer[1], !state[1], state[0]);


// Bit 0
nor(aux0, state[1], state[0]);
and(aux1, !state[1], irrigation_type[1]);
or(timer[0], aux0, aux1);



/*
COMO FUNCIONA?

000 -> 5
001 -> 10
010 -> 15
011 -> 22
100 -> 30

*/





endmodule