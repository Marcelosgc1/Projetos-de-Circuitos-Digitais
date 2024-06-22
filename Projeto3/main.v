/* Main file of the project. Centralizes the rules and components 
   necessary for the operation of the automated irrigation system. */

module main
(
	input 		high_level_indicator_i,
	input 		middle_level_indicator_i,
	input 		low_level_indicator_i,
	input 		soil_humidity_i,
	input 		air_humidity_i,
	input 		temperature_i,
	input 		selector_i,
	input			clk,
	input			init,
	output wire error_indicator_o, 
	output wire alarm_state_o, 
	output wire inlet_valve_o,
	output		[7:0]mostrador,
	output 		digit1_o,
	output 		digit2_o,
	output 		digit3_o,
	output 		digit4_o,
	output wire [6:0] rows_status,
	output wire [4:0] columns_status,
	output [13:0]lines

);
// IN DEVELOPMENT!!


lines_control(
	clk,
	0,
	lines

);
	
	
	
	irrigation_state(
		clk,
		temperature_i,
		air_humidity_i,
		soil_humidity_i,
		init,
		type_of_irrigation_state
	);



		
	
//a
	
	
endmodule
