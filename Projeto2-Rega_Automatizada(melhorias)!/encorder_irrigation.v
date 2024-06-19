module encorder_irrigation(
	input [2:0] irrigation,
	input [3:0] ddm,
	input [3:0] udm,
	input alarm,
	output [1:0] coded_irg
);


//start drip condition
and(aux0, !ddm[1], !ddm[0]);
and(aux1, ddm[0], !udm[3], !udm[2]);
and(aux2, ddm[0], udm[2], !udm[1]);
or(start_drip, aux0, aux1, aux2);


//bit0
and(aux3, irrigation[0], !start_drip);
or(aux4, irrigation[2], aux3);
and(coded_irg[0], aux4, !alarm);

//bit1
and(aux5, irrigation[0], start_drip);
or(aux6, irrigation[1], aux5);
and(coded_irg[1], aux6, !alarm);




/*
	00 - Nada
	01 - Aspersão
	10 - Gotejamento
	11 - Não acontece no sistema
*/

	/*
		COMO FUNCIONA?
		001 -> Irrigação Aspersão-Gotejamento (quando começa em aspersão em 22:30 min e vai pra gotejamento depois.
		010 -> Irrigação tipo Gotejamento
   	100 -> Irrigação tipo Aspersão
    	000 -> Sem irrigação (PS: ISSO NÃO VALIDA ERRO OU NIVEL D'AGUA, APENAS SE O SOLO JÁ ESTÁ ÚMIDO.)
 	*/
endmodule
