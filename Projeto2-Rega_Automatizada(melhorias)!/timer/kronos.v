module kronos(
	input T,
	input Ua,
	input H,
	input M,
	input Error,
	output [3:0] PresetUS,
	output [3:0] PresetDS,
	output [3:0] PresetUM,
	output [3:0] PresetDM,
	output [3:0] ClearUS,
	output [3:0] ClearDS,
	output [3:0] ClearUM,
	output [3:0] ClearDM
);

//Criando variavel: Temporizador_habilitado

nor(TH, !M, Error);
//Se TH = 0, o temporizador vai mostrar 00.00, se TH = 1, vai ser possível setar o tempo normal.


//Invertendo logo pra usar depois

not (T_bar, T);
not (Ua_bar, Ua);
not (H_bar, H);


//----- DEZENA MINUTOS
//P0 = Ua ( T + H' ) + Ua'.H


or (w0, T, H_bar);
and(w1, Ua, w0);

and (w3, Ua_bar, H);
or (aux, w1, w3);
and (PresetDM[0], aux, TH);

//P1 = Ua.H
and (PresetDM[1], Ua, H, TH);

//P2 = 0
assign PresetDM[2] = 0;

//P3 = 0
assign PresetDM[3] = 0;


//----- UNIDADE MINUTOS
//P0 = H' + Ua'
or (aux1, Ua_bar, H_bar);
and(PresetUM[0], aux1, TH);

//P1 = Ua'.H' + T'.Ua.H 
and (w5, Ua_bar, H_bar);

and (w6, T_bar, Ua, H);
or(aux2, w5, w6);

and(PresetUM[1], aux2, TH);


//P2 = H' + Ua'
or (aux3, H_bar, Ua_bar);
and(PresetUM[2], aux3, TH);

//P3 = 0
assign PresetUM[3] = 0;


//----- DEZENA SEGUNDOS
//P0 = H'.(Ua'+T')
or (w7, Ua_bar, T_bar);
and (PresetDS[0], H_bar, w7, TH);

//P1 = H'.(Ua'+T')
or (w8, Ua_bar, T_bar);
and (PresetDS[1], H_bar, w8, TH);

//P2 = 0
assign PresetDS[2] = 0;

//P3 = 0
assign PresetDS[3] = 0;

//----- UNIDADE SEGUNDOS
assign PresetUS[0] = 0;
assign PresetUS[1] = 0;
assign PresetUS[2] = 0;
assign PresetUS[3] = 0;

//-----CLEAR
not(ClearUS[0], PresetUS[0]);
not(ClearUS[1], PresetUS[1]);
not(ClearUS[2], PresetUS[2]);
not(ClearUS[3], PresetUS[3]);

not(ClearDS[0], PresetDS[0]);
not(ClearDS[1], PresetDS[1]);
not(ClearDS[2], PresetDS[2]);
not(ClearDS[3], PresetDS[3]);

not(ClearUM[0], PresetUM[0]);
not(ClearUM[1], PresetUM[1]);
not(ClearUM[2], PresetUM[2]);
not(ClearUM[3], PresetUM[3]);

not(ClearDM[0], PresetDM[0]);
not(ClearDM[1], PresetDM[1]);
not(ClearDM[2], PresetDM[2]);
not(ClearDM[3], PresetDM[3]);

//aa



endmodule
