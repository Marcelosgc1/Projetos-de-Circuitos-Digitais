module irrigation_state(input T, input Ua, input Us, input init, output [1:0]type_of_irrigation_state);
	
	
	
	not inv2(Us_bar, Us);
	
	
	
	//bit 1
	nand(aux0, Ua, T);
	and(temp0, aux0, Us_bar);
	not(temp0_bar, temp0);
	
	and(bit1, temp0, init);
	and(bit1_inverse, temp0_bar, init);
	
	
	jk_flip_flop(0, 0, 0, bit1_inverse, bit1, type_of_irrigation_state[0]);

	
	//bit  2
	and(temp1, Ua, Us_bar);
	not(temp1_bar, temp1);
	
	and(bit2, temp1, init);
	and(bit2_inverse, temp1_bar, init);
	
	jk_flip_flop(0, 0, 0, bit2_inverse, bit2, type_of_irrigation_state[1]);

	
	
	
	/*
		COMO FUNCIONA?
		11 -> Irrigação Aspersão-Gotejamento (quando começa em aspersão em 22 seg e vai pra gotejamento depois.
		10 -> Irrigação tipo Gotejamento
   	01 -> Irrigação tipo Aspersão
    	00 -> Sem irrigação (PS: ISSO NÃO VALIDA ERRO OU NIVEL D'AGUA, APENAS SE O SOLO JÁ ESTÁ ÚMIDO.)
 	*/




endmodule
