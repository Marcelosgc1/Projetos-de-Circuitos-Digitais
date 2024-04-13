module error(input wire H,	input wire M,	input wire L,	output wire saida);
	
	wire S0, S1, S2, S3;
	
	not inv0(S0, M);
	not inv1(S1, L);
	and And0(S2, H, S0);
	and And1(S3, M, S1);
	or Or0(saida, S3, S2);
	
	
endmodule