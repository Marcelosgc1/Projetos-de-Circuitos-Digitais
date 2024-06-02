module kronos(
	input T,
	input Ua,
	input H,
	output [3:0] PresetUS,
	output [3:0] PresetDS,
	output [3:0] PresetUM,
	output [3:0] PresetDM,
	output [3:0] ClearUS,
	output [3:0] ClearDS,
	output [3:0] ClearUM,
	output [3:0] ClearDM
);

//----- DEZENA MINUTOS
//P0 = Ua ( T + H' ) + Ua'.H

not (T_bar, T);
not (Ua_bar, Ua);
not (H_bar, H);

or (w0, T, H_bar);
and(w1, Ua, w0);

and (w3, Ua_bar, H);
or (PresetDM[0], w1, w3);

//P1 = Ua.H
and (PresetDM[1], Ua, H);

//P2 = 0
assign PresetDM[2] = 0;
//P3 = 0
assign PresetDM[3] = 0;
//----- UNIDADE MINUTOS
//P0 = H' + Ua'
or (PresetUM[0], Ua_bar, H_bar);

//P1 = Ua'.H' + T'.Ua.H 
and (w5, Ua_bar, H_bar);

and (w6, T_bar, Ua, H);

or(PresetUM[1], w5, w6);


//P2 = H' + Ua'
or (PresetUM[2], H_bar, Ua_bar);

//P3 = 0
assign PresetUM[3] = 0;

//----- DEZENA SEGUNDOS
//P0 = H'.(Ua'+T')
or (w7, Ua_bar, T_bar);
and (PresetDS[0], H_bar, w7);

//P1 = H'.(Ua'+T')
or (w8, Ua_bar, T_bar);
and (PresetDS[1], H_bar, w8);

//P2 = 0
assign PresetDS[2] = 0;

//P3 = 0
assign PresetDS[3] = 0;

//----- UNIDADE SEGUNDOS
assign PresetUS[2] = 0;
assign PresetUS[2] = 0;
assign PresetUS[2] = 0;
assign PresetUS[2] = 0;
//-----CLEAR
not(ClearUS, PresetUS);
not(ClearDS, PresetDS);
not(ClearUM, PresetUM);
not(ClearDM, PresetDM);

endmodule
