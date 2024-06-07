module level_state(input clk, input H, input M, input L, input init, output [2:0]water_level_state);

	wire inv_low_level, inv_medium_level, inv_high_level;
	
	not inv0(inv_low_level, L);
	not inv1(inv_medium_level, M);
	not inv2(inv_high_level, H);
	
	//state 1
	and(aux0, L, inv_medium_level,inv_high_level);
	not(aux0_bar, aux0);
	
	and(low_level, aux0, init);
	and(low_level_inverse, aux0_bar, init);
	
	
	jk_flip_flop(0, 0, clk, low_level_inverse, low_level, water_level_state[0]);

	
	//state 2
	and(aux1, L, M, inv_high_level);
	not(aux1_bar, aux1);
	
	and(middle_level, aux1, init);
	and(middle_level_inverse, aux1_bar, init);
	
	jk_flip_flop(0, 0, clk, middle_level_inverse, middle_level, water_level_state[1]);

	
	
	
	//state 3
	and(aux2, L, M, H);
	not(aux2_bar, aux2);
	
	and(high_level, aux2, init);
	and(high_level_inverse, aux2_bar, init);
	
	
	jk_flip_flop(0, 0, clk, high_level_inverse, high_level, water_level_state[2]);



	/*
	COMO FUNCIONA?
 	001 -> nível baixo
  	010 -> nível médio
   	100 -> nível alto
    	000 -> erro OU nivel crítico
 	*/


endmodule
