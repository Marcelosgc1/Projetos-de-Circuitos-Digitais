module nine_to_zero(input clk, output Q0, output Q1, output Q2, output Q3, input [3:0]clear, input [3:0]preset);

	wire j0, k0, j1, k1, j2, k2, j3, k3;

	
	FFJK(clk, 1, 1, Q0, Q0_bar, clear[0], preset[0]);
	FFJK(clk, j1, k1, Q1, Q1_bar, clear[1], preset[1]);
	FFJK(clk, j2, k2, Q2, Q2_bar, clear[2], preset[2]);
	FFJK(clk, j3, k3, Q3, Q3_bar, clear[3], preset[3]);

	//j1
	or (W0, Q2, Q3);
	and(j1, Q0_bar, W0);
	
	//k1
	not(k1, Q0);
	
	//j2
	and(j2, Q0_bar, Q3);
	
	//k2
	and(k2, Q0_bar, Q1_bar);
	
	//j3
	and(j3, Q0_bar, Q1_bar, Q2_bar);
	
	//k3
	not(k3, Q0);

endmodule
