module drip(
input wire M,
input wire aut,
input wire temp,
input wire Ua,	
output wire out
);

	wire S0, S1;
	
	not Inv0(S0, M);
	
	or Or0(S1, S0, temp);
	
	and And0(out, S1, Ua, aut);
	

endmodule 