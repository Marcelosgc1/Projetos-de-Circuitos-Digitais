module encoder_irrigation(
input sprinkler,
input drip,
input aut,
output S0,
output S1
);
	
	
	or Or0(S0, sprinkler, aut);
	or Or1(S1, drip, aut);




endmodule 