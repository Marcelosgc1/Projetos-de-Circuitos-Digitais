module level_state(input clk, input H, input M, input L, input init, output [3:0]water_level_state);

	wire inv_low_level, inv_medium_level, inv_high_level;
	
	not inv0(inv_low_level, L);
	not inv1(inv_medium_level, M);
	not inv2(inv_high_level, H);
	
	
	
	//state 1
	and(aux0, inv_low_level, inv_medium_level,inv_high_level);
	not(aux0_bar, aux0);
	
	and(crit_level, aux0, init);
	and(crit_level_inverse, aux0_bar, init);
	
	
	jk_flip_flop(0, 0, clk, crit_level_inverse, crit_level, water_level_state[0]);
	
	
	
	//state 2
	and(aux1, L, inv_medium_level,inv_high_level);
	not(aux1_bar, aux1);
	
	and(low_level, aux1, init);
	and(low_level_inverse, aux1_bar, init);
	
	
	jk_flip_flop(0, 0, clk, low_level_inverse, low_level, water_level_state[1]);

	
	//state 3
	and(aux2, L, M, inv_high_level);
	not(aux2_bar, aux1);
	
	and(middle_level, aux2, init);
	and(middle_level_inverse, aux2_bar, init);
	
	jk_flip_flop(0, 0, clk, middle_level_inverse, middle_level, water_level_state[2]);

	
	
	
	//state 4
	and(aux3, L, M, H);
	not(aux3_bar, aux2);
	
	and(high_level, aux3, init);
	and(high_level_inverse, aux3_bar, init);
	
	
	jk_flip_flop(0, 0, clk, high_level_inverse, high_level, water_level_state[3]);



	/*
	COMO FUNCIONA?
	0001 -> nível crítico
 	0010 -> nível baixo
  	0100 -> nível médio
   1000 -> nível alto
   0000 -> erro
 	*/


endmodule
