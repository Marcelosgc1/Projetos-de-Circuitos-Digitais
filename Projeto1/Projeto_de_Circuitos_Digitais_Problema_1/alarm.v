module alarm(
input wire L,
input wire erro,
output wire SaidaAlarme
);	
	wire S0;
	
	not Inv0(S0, L);
	or Or0(SaidaAlarme, S0, erro);
	
	
endmodule