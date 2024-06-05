module timer(
	input new_clock,
	input [1:0] seletor,
	input [3:0] PresetUS, 
	input [3:0] PresetDS,
	input [3:0] PresetUM,
	input [3:0] PresetDM,
	input [3:0] ClearUS,
	input [3:0] ClearDS,
	input [3:0] ClearUM,
	input [3:0] ClearDM,
	output [6:0]Mostrador, 
	output stop,
	output digit0, 
	output digit1, 
	output digit2, 
	output digit3
);
//module

wire [3:0] UnidadeSegundos;
wire [3:0] DezenaSegundos;
wire [3:0] UnidadeMinutos;
wire [3:0] DezenaMinutos;
wire [3:0] Atual;

//coisas de display
demux1x4(1, seletor[0], seletor[1], digit0, digit1, digit2, digit3);

// UNIDADE SEGUNDOS
timer_nine_zero_counter counts_unit_of_seconds(
	new_clock, 
	ClearUS, 
	PresetUS,
	UnidadeSegundos
	);
// UNIDADE SEGUNDOS

and(barril, UnidadeSegundos[0], !UnidadeSegundos[1], !UnidadeSegundos[2], UnidadeSegundos[3]); //flag unidade s -> dezena s

//DEZENA SEGUNDOS
timer_five_zero_counter counts_dozen_of_seconds(
	barril, 
	ClearDS, 
	PresetDS,
	DezenaSegundos
	);
//DEZENA SEGUNDOS

and(barril_dobrado, DezenaSegundos[0],!DezenaSegundos[1],DezenaSegundos[2],!DezenaSegundos[3]); //flag dezena s -> unidade min

// UNIDADE MINUTOS
timer_nine_zero_counter counts_unit_of_minutes(
	barril_dobrado, 
	ClearUM, 
	PresetUM,
	UnidadeMinutos
	);
// UNIDADE MINUTOS

and(barril_triplicado, UnidadeMinutos[0], !UnidadeMinutos[1], !UnidadeMinutos[2], UnidadeMinutos[3]); //flag unidade min -> dezena min

// DEZENA MINUTOS
timer_five_zero_counter counts_dozen_of_minutes(
	barril_triplicado,  
	ClearDM, 
	PresetDM,
	DezenaMinutos
	);
// DEZENA MINUTOS


//escolher numero
mux_4x1(UnidadeSegundos,DezenaSegundos,UnidadeMinutos,DezenaMinutos,seletor,Atual);
timer_decoder_7seg_display decodes_timer(Atual, Mostrador);




// PARAR NO ZERO
nor(stop, 	UnidadeSegundos[0], UnidadeSegundos[1], UnidadeSegundos[2], UnidadeSegundos[3],
				DezenaSegundos[0], DezenaSegundos[1], DezenaSegundos[2], DezenaSegundos[3],
				UnidadeMinutos[0], UnidadeMinutos[1], UnidadeMinutos[2], UnidadeMinutos[3],
				DezenaMinutos[0], DezenaMinutos[1], DezenaMinutos[2], DezenaMinutos[3]
);
//




endmodule
