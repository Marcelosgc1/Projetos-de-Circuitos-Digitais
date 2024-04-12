module sprinkler(
input wire M,
input wire aut,
input wire temp,
input wire Ua,
output wire out
);

	wire S1,S2,S3,S4;
	
	not Inv1(S1, Ua);
	not Inv2(S2, temp);
	
	and And0(S3, M, S2);
	or Or0(S4, S1, S3);
	and And1(out, S4, aut);

	

endmodule 