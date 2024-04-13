module decoder_waterLevel(
input Bit0,
input Bit1,
output a,
output b,
output c,
output d,
output e,
output f,
output g,
output digit
);

	wire S0;
	
	not Invbit0(S0, Bit0);
	
	//A tem o mesmo valor do Bit1
	and AndSa(a, Bit1, Bit1);
	or OrB(b, Bit0, Bit1);
	//C tem o mesmo valor do Bit0
	and AndSc(c, Bit0, Bit0);
	//D tem o mesmo valor do Bit1
	and AndSd(d, Bit1, Bit1);
	and AndE(e, S0, Bit1);
	and AndF(f, S0, Bit0);
	//G tem os mesmos valores do Bit1
	and AndSg(g, Bit1, Bit1);
	
	and AndDigit(digit, S0, Bit0);
	
	
	
endmodule 
