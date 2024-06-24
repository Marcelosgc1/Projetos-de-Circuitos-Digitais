module mux16_4(input [3:0]A, input [3:0]B, input [3:0]C, input [3:0]D, input [1:0]seletor, output [3:0]Y);

and(aux, A[0], !seletor[0], !seletor[1]);
and(aux1, B[0], seletor[0], !seletor[1]);
and(aux2, C[0], !seletor[0], seletor[1]);
and(aux3, D[0], seletor[0], seletor[1]);

or(Y[0], aux, aux1, aux2, aux3);

and(aux4, A[1], !seletor[0], !seletor[1]);
and(aux5, B[1], seletor[0], !seletor[1]);
and(aux6, C[1], !seletor[0], seletor[1]);
and(aux7, D[1], seletor[0], seletor[1]);

or(Y[1], aux4, aux5, aux6, aux7);

and(aux8, A[2], !seletor[0], !seletor[1]);
and(aux9, B[2], seletor[0], !seletor[1]);
and(aux10, C[2], !seletor[0], seletor[1]);
and(aux11, D[2], seletor[0], seletor[1]);

or(Y[2], aux8, aux9, aux10, aux11);

and(aux12, A[3], !seletor[0], !seletor[1]);
and(aux13, B[3], seletor[0], !seletor[1]);
and(aux14, C[3], !seletor[0], seletor[1]);
and(aux15, D[3], seletor[0], seletor[1]);

or(Y[3], aux12, aux13, aux14, aux15);

endmodule
