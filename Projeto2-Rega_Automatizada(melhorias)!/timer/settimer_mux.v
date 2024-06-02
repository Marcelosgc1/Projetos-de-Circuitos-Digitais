module settimer_mux(
	input init,
	input stop,
	input [3:0]ClearUS,
	input [3:0]ClearDS,
	input [3:0]ClearUM,
	input [3:0]ClearDM,
	input [3:0]PresetUS,
	input [3:0]PresetDS,
	input [3:0]PresetUM,
	input [3:0]PresetDM,
	output [3:0]CUS,
	output [3:0]CDS,
	output [3:0]CUM,
	output [3:0]CDM,
	output [3:0]PUS,
	output [3:0]PDS,
	output [3:0]PUM,
	output [3:0]PDM
);


	new_mux(stop, ClearUS, init, CUS);
	new_mux(stop, ClearDS, init, CDS);
	new_mux(stop, ClearUM, init, CUM);
	new_mux(stop, ClearDM, init, CDM);

	new_mux(stop, PresetUS, init, PUS);
	new_mux(stop, PresetDS, init, PDS);
	new_mux(stop, PresetUM, init, PUM);
	new_mux(stop, PresetDM, init, PDM);


endmodule