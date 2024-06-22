module mux2_1(input A, input B, input S, output result);


or(result, outA, outB);
and(outA, A, S);
and(outB, B, !S);


endmodule
