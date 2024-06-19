module irrigation_state(input clk, input T, input Ua, input Us, input init, output [2:0]type_of_irrigation_state);
	
	not inv0(T_bar, T);
	not inv1(Ua_bar, Ua);
	not inv2(Us_bar, Us);
	
	//state 1
	and(aux0, T_bar, Ua, Us_bar);
	not(aux0_bar, aux0);
	
	and(splinker_drip, aux0, init);
	and(splinker_drip_inverse, aux0_bar, init);
	
	
	jk_flip_flop(0, 0, clk, splinker_drip_inverse, splinker_drip, type_of_irrigation_state[0]);

	
	//state 2
	and(aux1, T, Ua, Us_bar);
	not(aux1_bar, aux1);
	
	and(drip, aux1, init);
	and(drip_inverse, aux1_bar, init);
	
	jk_flip_flop(0, 0, clk, drip_inverse, drip, type_of_irrigation_state[1]);

	
	
	
	//state 3
	and(aux2, Ua_bar, Us_bar);
	not(aux2_bar, aux2);
	
	and(sprinker, aux2, init);
	and(sprinker_inverse, aux2_bar, init);
	
	
	jk_flip_flop(0, 0, clk, sprinker_inverse, sprinker, type_of_irrigation_state[2]);
	
	/*
		COMO FUNCIONA?
		001 -> Irrigação Aspersão-Gotejamento (quando começa em aspersão em 22:30 min e vai pra gotejamento depois.
		010 -> Irrigação tipo Gotejamento
   	100 -> Irrigação tipo Aspersão
    	000 -> Sem irrigação (PS: ISSO NÃO VALIDA ERRO OU NIVEL D'AGUA, APENAS SE O SOLO JÁ ESTÁ ÚMIDO.)
 	*/




endmodule
