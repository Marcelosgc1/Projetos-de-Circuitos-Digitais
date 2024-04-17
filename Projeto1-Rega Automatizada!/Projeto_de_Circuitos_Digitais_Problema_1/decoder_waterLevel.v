module decoder_waterLevel(
input Bit0,
input Bit1,
output a,
output b,
output c,
output d,
output e,
output f,
output g
);

	//==Legenda== combinação dos bits -> significado (o que vai aparecer no mostrador)
	
	//00 -> ERROR/CRIT (0)
	//01 -> LOW (1)
	//10 -> MIDDLE (2)
	//11 -> HIGH (3)
	

	wire S0, S1;
	
	not Invbit0(S0, Bit0);
	not Invbit1(S1, Bit1);
	
	
	and AndSa(a, S1, S1); //A tem o valor invertido do Bit1
	and AndB(b, S0, S1);	
	and AndSc(c, S0, S0); //C tem o valor invertido do Bit0
	and AndSd(d, S1, S1); //D tem o valor invertido do Bit1
	or OrE(e, Bit0, S1);
	or OrF(f, Bit1, S1);
	and AndSg(g, S1, Bit0);
		
	
endmodule 
