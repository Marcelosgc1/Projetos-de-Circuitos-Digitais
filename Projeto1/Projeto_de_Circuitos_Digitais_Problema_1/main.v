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
	
	
	wire Autorizacao, ValvulaDeAspersao, ValvulaDeGotejamento, bit1, bit0, bit2, bit3;
	wire Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ia, Ib, Ic, Id, Ie, If, Ig;
	
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
			.a(Ca),
			.b(Cb),
			.c(Cc),
			.d(Cd),
			.e(Ce),
			.f(Cf),
			.g(Cg),
			.digit(digit)
		
		
		);
		
	encoder_irrigation encoderI_inst
	(
		.sprinkler(high),
		.drip(middle),
		.aut(low),
		.S0(Bit2),
		.S1(Bit3)
	);
		
	decoder_irrigation decoderI_inst
		(
			.Bit0(bit2),
			.Bit1(bit3),
			.a(Ia),
			.b(Ib),
			.c(Ic),
			.d(Id),
			.e(Ie),
			.f(If),
			.g(Ig),
		
		
		);	
		
		
		
	
endmodule	