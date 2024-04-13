module decoder_irrigation(
input bit0,
input bit1,
output a,
output b,
output c,
output d,
output e,
output f,
output g,
output digit
);
	
	wire S0, S1;
	
	//==Legenda== combinação dos bits -> significado (o que vai aparecer no mostrador)
	
	//00 -> Don't care. (não vai mostrar nada.)
	//01 -> SPRINKLER (A)
	//10 -> DRIP (G)
	//11 -> Sem Autorização (-)
	
	not Inv0(S0, bit0);
	not inv1(S1, bit1);
	
	
	xor XorA(a, bit0, bit1);
	and AndB(b, bit0, S1);
	xor XorC(c, bit0, bit1);
	and AndD(d, S0, bit1);
	xor XorE(e, bit0, bit1);
	xor Xorf(f, bit0, bit1);
	and Andg(g, bit0, bit0);	
	
	
endmodule 
