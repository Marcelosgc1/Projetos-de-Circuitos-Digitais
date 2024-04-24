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
		
	encoder_irrigation_condition encodes_irrigation_condition
	(
		ValvulaDeAspersao,
		ValvulaDeGotejamento,
		Autorizacao,
		bit2,
		bit3
	);
		
	decoder_irrigation_condition decodes_irrigation_condition
	(
		bit2,
		bit3,
		Ia,
		Ib,
		Ic,
		Id,
		Ie,
		If,
		Ig
	);
		
	mux_2_1 mux_segment_a
	(
		Ca,
		Ia,
		seletor,
		a
	);
	
	mux_2_1 mux_segment_b
	(
		Cb,
		Ib,
		seletor,
		b
	);
	
	mux_2_1 mux_segment_c
	(
		Cc,
		Ic,
		seletor,
		c
	);

	mux_2_1 mux_segment_d
	(
		Cd,
		Id,
		seletor,
		d
	);
	
	mux_2_1 mux_segment_e
	(
		Ce,
		Ie,
		seletor,
		e
	);
	
	mux_2_1 mux_segment_f
	(
		Cf,
		If,
		seletor,
		f
	);
	
	mux_2_1 mux_segment_g
	(
		Cg,
		Ig,
		seletor,
		g
	);
	
endmodule
	