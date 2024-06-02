module demux1x4(input E, input S0, input S1, output Y0, output Y1, output Y2, output Y3);

not(S0_bar, S0);
not(S1_bar, S1);

nand(Y0, S0, S1, E);
nand(Y1, S0_bar, S1, E);
nand(Y2, S0, S1_bar, E);
nand(Y3, S0_bar, S1_bar, E);


endmodule
