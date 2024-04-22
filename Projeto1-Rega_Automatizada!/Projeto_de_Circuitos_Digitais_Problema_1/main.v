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
output digit1,
output digit2,
output digit3,
output digit4
);
	
	
	
	wire Autorizacao, ValvulaDeAspersao, ValvulaDeGotejamento, bit1, bit0, bit2, bit3, inversor;
	wire Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ia, Ib, Ic, Id, Ie, If, Ig;
	
	not inv0(inversor, high);
	or Or0(digit2, inversor, high);
	or Or1(digit3, inversor, high);
	or Or2(digit4, inversor, high);
	and And0(digit1, inversor, high);
	
	
	error_detector detects_error
	(
		high,
		middle,
		low,
		erro
	);
	
	alarm_trigger triggers_alarm
	(
		low,
		erro,
		saidaDoAlarme
	);
	
	inlet_valve_trigger triggers_inlet_valve
	(
		high,
		erro,
		ValvulaDeEntrada
	);
	
	irrigation_trigger triggers_irrigation
	(
		saidaDoAlarme,
		umidadeDoSolo,
		Autorizacao
	);
	
	sprinkler_trigger triggers_sprinkler
	(
		middle,
		Autorizacao,
		temperatura,
		umidadeDoAr,
		ValvulaDeAspersao
	);
	
	drip_trigger triggers_drip
	(
		middle,
		Autorizacao,
		temperatura,
		umidadeDoAr,
		ValvulaDeGotejamento
	);
	
	encoder_water_tank_level encodes_water_tank_level
	(
		high,
		middle,
		low,
		bit0,
		bit1
	);
		
		
	decoder_water_tank_level decodes_water_tank_level
		(
			bit0,
			bit1,
			Ca,
			Cb,
			Cc,
			Cd,
			Ce,
			Cf,
			Cg
		);
		
	encoder_irrigation encoderI_inst
	(
		.sprinkler(ValvulaDeAspersao),
		.drip(ValvulaDeGotejamento),
		.aut(Autorizacao),
		.b0(bit2),
		.b1(bit3)
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
			.g(Ig)
		
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