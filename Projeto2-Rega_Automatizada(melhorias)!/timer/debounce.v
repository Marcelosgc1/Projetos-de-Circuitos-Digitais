module debounce(input b, input clk, output s);

FFD(clk, b, Q0);
FFD(clk,Q0, Q1);
FFD(clk,Q1, Q2);

not(Q2_bar, Q2);
and(s, Q1, Q2_bar);

endmodule
