module encoder_irrigation(
input sprinkler,
input drip,
input aut,
output b0,
output b1
);
	wire w_aut_inverted, w_sprinker_inverted, w_drip_inverted, w_aut_inverted_xor_sprinkler, w_aut_inverted_xor_drip, S4;
	
	not AutInverter(w_aut_inverted, aut);
	not SprinklerInverter(w_sprinker_inverted, sprinkler);
	not DripInverter(w_drip_inverted, drip);
	
	
	xor Aut_Inverted_Sprinkler_Xor(w_aut_inverted_xor_sprinkler, w_aut_inverted, sprinkler);
	and Drip_Inverted_Aut_Inverted_Xor_Sprinkler_And(b1, w_drip_inverted, w_aut_inverted_xor_sprinkler);
	
	xor Aut_Inverted_Drip_Xor(w_aut_inverted_xor_drip, w_aut_inverted, drip);
	and Sprinkler_Inverted_Aut_Inverted_Xor_Drip_And(b0, w_aut_inverted_xor_drip, w_sprinker_inverted);




endmodule 
