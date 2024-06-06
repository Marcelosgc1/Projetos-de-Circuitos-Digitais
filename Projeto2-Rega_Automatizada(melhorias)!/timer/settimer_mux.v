module settimer_mux(
	input init,
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

	and(CUS[0], ClearUS[0], init);
   and(CUS[1], ClearUS[1], init);
   and(CUS[2], ClearUS[2], init);
   and(CUS[3], ClearUS[3], init);

	and(CDS[0], ClearDS[0], init);
   and(CDS[1], ClearDS[1], init);
   and(CDS[2], ClearDS[2], init);
   and(CDS[3], ClearDS[3], init);

	and(CUM[0], ClearUM[0], init);
   and(CUM[1], ClearUM[1], init);
   and(CUM[2], ClearUM[2], init);
   and(CUM[3], ClearUM[3], init);

	and(CDM[0], ClearDM[0], init);
   and(CDM[1], ClearDM[1], init);
   and(CDM[2], ClearDM[2], init);
   and(CDM[3], ClearDM[3], init);



	and(PUS[0], PresetUS[0], init);
   and(PUS[1], PresetUS[1], init);
   and(PUS[2], PresetUS[2], init);
   and(PUS[3], PresetUS[3], init);
	
	and(PDS[0], PresetDS[0], init);
   and(PDS[1], PresetDS[1], init);
   and(PDS[2], PresetDS[2], init);
   and(PDS[3], PresetDS[3], init);

	and(PUM[0], PresetUM[0], init);
   and(PUM[1], PresetUM[1], init);
   and(PUM[2], PresetUM[2], init);
   and(PUM[3], PresetUM[3], init);

	and(PDM[0], PresetDM[0], init);
   and(PDM[1], PresetDM[1], init);
   and(PDM[2], PresetDM[2], init);
   and(PDM[3], PresetDM[3], init);
    
endmodule
