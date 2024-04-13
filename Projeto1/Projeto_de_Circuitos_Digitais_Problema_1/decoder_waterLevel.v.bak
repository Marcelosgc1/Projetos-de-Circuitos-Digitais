module decoder(
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

	wire S0,Sa,Sb,Sc,Sd,Se,Sg;
	
	not Invbit(S0, Bit0);
	
	not InvA(Sa, Bit0);
	nor NorB(Sb, Bit0, Bit1);
	not InvC(Sc, Bit1);
	not InvD(Sd, Bit0);
	or OrE(Se, S0, Bit1);
	and AndF(f, !Bit1, Bit1);
	not InvG(Sg, Bit0);
	and AndDigit(digit, !Bit1, Bit1);
	
	
	not i0(a, Sa);
	not i1(b, Sb);
	not i2(c, Sc);
	not i3(d, Sd);
	not i4(e, Se);
	not i6(g, Sg);


endmodule 
