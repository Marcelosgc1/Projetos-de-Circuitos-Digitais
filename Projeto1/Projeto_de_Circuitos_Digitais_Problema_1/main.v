module main(
input high,
input middle,
input low,
input umidadeDoSolo,
input umidadeDoAr,
input temperatura,
output wire erro, 
output wire saidaDoAlarme, 
output wire ValvulaDeEntrada,
output a,
output b,
output c,
output d,
output e,
output f,
output g,
output digit
);
	
	
	wire Autorizacao, ValvulaDeAspersao, ValvulaDeGotejamento, bit1, bit0;
	
	error error_inst
	(
		.H(high),
		.M(middle),
		.L(low),
		.saida(erro)
	);
	
	alarm alarm_inst
	(
		.L(low),
		.erro(erro),
		.SaidaAlarme(saidaDoAlarme)
	);
	
	valvulaDeEntrada valvulaDeEntrada_inst
	(
		.H(high),
		.erro(erro),
		.VE(ValvulaDeEntrada)
	);
	
	authorizedToIrrigate authorizedToIrrigate_inst
	(
		.Al(saidaDoAlarme),
		.Us(umidadeDoSolo),
		.out(Autorizacao)
	);
	
	sprinkler sprinkler_inst
	(
		.M(middle),
		.aut(Autorizacao),
		.Ua(umidadeDoAr),
		.temp(temperatura),
		.out(ValvulaDeAspersao)
	);
	
	drip drip_inst
	(
		.M(middle),
		.aut(Autorizacao),
		.Ua(umidadeDoAr),
		.temp(temperatura),
		.out(ValvulaDeGotejamento)
	);
	
	encoder_waterLevel encoderWL_inst
	(
		.H(high),
		.M(middle),
		.L(low),
		.S0(Bit0),
		.S1(Bit1)
	);
		
		
		
	decoder_waterLevel decoderWL_inst
		(
			.Bit0(bit0),
			.Bit1(bit1),
			.a(a),
			.b(b),
			.c(c),
			.d(d),
			.e(e),
			.f(f),
			.g(g),
			.digit(digit)
		
		
		);
		
		
		
		
		
	
endmodule	