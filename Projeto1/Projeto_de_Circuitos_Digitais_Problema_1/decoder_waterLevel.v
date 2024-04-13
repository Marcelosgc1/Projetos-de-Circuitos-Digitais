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

	wire S1;
	
	not Invbit1(S1, Bit1);
	
	//A tem os mesmos valores do Bit0
	and AndSa(a, Bit0, Bit0);
	or OrB(b, Bit0, Bit1);
	//C tem os mesmos valores do Bit1
	and AndSc(c, Bit1, Bit1);
	//D tem os mesmos valores do Bit0
	and AndSd(d, Bit0, Bit0);
	and AndE(e, Bit0, S1);
	and AndF(f, S1, Bit1);
	//G tem os mesmos valores do Bit0
	and AndSg(g, Bit0, Bit0);
	
	and AndDigit(digit, S1, Bit1);
	
	
	
endmodule 
