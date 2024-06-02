module new_mux(input stop, input [3:0]_input, input init, output [3:0]C_out);


not(init_bar, init);


and(w0, stop, init_bar);

and(w1, _input[0], init);
and(w2, _input[1], init);
and(w3, _input[2], init);
and(w4, _input[3], init);

or(C_out[0], w0, w1);
or(C_out[1], w0, w2);
or(C_out[2], w0, w3);
or(C_out[3], w0, w4);



endmodule

