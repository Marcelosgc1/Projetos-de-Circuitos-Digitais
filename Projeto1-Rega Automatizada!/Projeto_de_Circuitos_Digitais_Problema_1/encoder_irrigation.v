module encoder_irrigation(
input sprinkler,
input drip,
input aut,
output b0,
output b1
);
	wire w_aut_inverted, w_sprinker_inverted, w_drip_inverted, w_aut_inverted_xor_sprinkler, w_aut_inverted_xor_drip, S4;
	
	not (w_aut_inverted, aut);
	not (w_sprinker_inverted, drip);
	not (w_drip_inverted, sprinkler);
	
	
	xor (w_aut_inverted_xor_sprinkler, w_aut_inverted, drip);
	and (b1, w_drip_inverted, w_aut_inverted_xor_sprinkler);
	
	xor (w_aut_inverted_xor_drip, w_aut_inverted, sprinkler);
	and (b0, w_aut_inverted_xor_drip, w_sprinker_inverted);




endmodule 
