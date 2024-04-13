module main(
input high,
input middle,
input low,
input umidadeDoSolo,
input umidadeDoAr,
input temperatura,
input seletor,
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
			.bit0(bit2),
			.bit1(bit3),
			.a(Ia),
			.b(Ib),
			.c(Ic),
			.d(Id),
			.e(Ie),
			.f(If),
			.g(Ig),
		
		);
		
	Mux_2_1 Mux_A
	(
		.A(Ca),
		.B(Ia),
		.S(seletor),
		.X(a)
	);
	
	Mux_2_1 Mux_B
	(
		.A(Cb),
		.B(Ib),
		.S(seletor),
		.X(b)
	);
	
	Mux_2_1 Mux_C
	(
		.A(Cc),
		.B(Ic),
		.S(seletor),
		.X(c)
	);

	Mux_2_1 Mux_D
	(
		.A(Cd),
		.B(Id),
		.S(seletor),
		.X(d)
	);
	
	Mux_2_1 Mux_E
	(
		.A(Ce),
		.B(Ie),
		.S(seletor),
		.X(e)
	);
	
	Mux_2_1 Mux_F
	(
		.A(Cf),
		.B(If),
		.S(seletor),
		.X(f)
	);
	
	Mux_2_1 Mux_G
	(
		.A(Cg),
		.B(Ig),
		.S(seletor),
		.X(g)
	);
		
	
endmodule	