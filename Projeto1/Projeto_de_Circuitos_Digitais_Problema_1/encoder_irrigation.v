module encoder_irrigation(
input sprinkler,
input drip,
input aut,
output S0,
output S1
);
	wire no_aut;
	
	not Inv0(no_aut, aut);
	
	or Or0(S0, sprinkler, no_aut);
	or Or1(S1, drip, no_aut);




endmodule 