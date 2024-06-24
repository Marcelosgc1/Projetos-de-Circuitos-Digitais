module fsm_lines(input init, input clk, input state, output [13:0]lines);



//Sistema da máquina de estados ligada entre linhas
	mux2_1(state, flag5, state, next_state_6);

	water_level_indicator linha6(
		init,
		clk,
		next_state_6,
		lines[13:12],
		flag6
	);
	
	mux2_1(flag6, flag4, state, next_state_5);
	
	water_level_indicator linha5(
		init,
		clk,
		next_state_5,
		lines[11:10],
		flag5
	);
	
	mux2_1(flag5, flag3, state, next_state_4);
	
	water_level_indicator linha4(
		init,
		clk,
		next_state_4,
		lines[9:8],
		flag4
	);
	
	mux2_1(flag4, flag2, state, next_state_3);
	
	water_level_indicator linha3(
		init,
		clk,
		next_state_3,
		lines[7:6],
		flag3
	);
	
	mux2_1(flag3, flag1, state, next_state_2);
	
	water_level_indicator linha2(
		init,
		clk,
		next_state_2,
		lines[5:4],
		flag2
	);
	
	mux2_1(flag2, flag0, state, next_state_1);
	
	water_level_indicator linha1(
		init,
		clk,
		next_state_1,
		lines[3:2],
		flag1
	);
	
	mux2_1(flag1, state, state, next_state_0);
	
	water_level_indicator linha0(
		init,
		clk,
		next_state_0,
		lines[1:0],
		flag0
	);
//Sistema da máquina de estados ligada entre linhas






endmodule
