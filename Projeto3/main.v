/* Main file of the project. Centralizes the rules and components 
   necessary for the operation of the automated irrigation system. */

module main
(
	input 		soil_humidity_i,
	input 		air_humidity_i,
	input 		temperature_i,
	input			clk_fg,					//clock de 224hz gerado pelo Gerador de função MFG-4205B disponíel nas bancadas do LEDS
	input			clk_50mhz,				//clock nativo do kit de desenvolvimento LEDS-CPLD 
	input			init_button,
	input			pesticide,
	output wire	alert_on,
	output wire alert_np,
	output		[6:0]mostrador,
	output		[3:0]digits,
	output wire [6:0] rows_status,
	output wire [4:0] columns_status

);

//any wires needed
wire		[3:0]DS;
wire 		[3:0]US;

wire [13:0]lines;
wire [1:0]states;
wire [1:0]type_of_irrigation_state;
assign DS[3] = 0;
assign DS[2] = 0;
// IN DEVELOPMENT!!

assign columns_status[0] = 1;
assign columns_status[1] = 1;
assign columns_status[2] = 1;
assign columns_status[3] = 1;
assign columns_status[4] = 1;
	
	
	debouncer(init_button, clk_50mhz, init_pulse);

	
	
	
	
	circuit_state(clk_fg, init_pulse, {lines[12], lines[10], lines[5], lines[1]}, type_of_irrigation_state, states);
	
	level_to_pulse(clk_50mhz, states, pulse_transiction);
	
	or(p,pulse_transiction,init_pulse);

	timer(clk_1hz, states, type_of_irrigation_state, p, init_pulse, DS[1:0], US, clock_off);
	
	
	irrigation_state(
		temperature_i,
		air_humidity_i,
		soil_humidity_i,
		init_pulse,
		type_of_irrigation_state
	);

	frequency_divider(
		p,
		clk_fg,
		fast_but_visible_clk,
		sprinkler_clk, 
		drip_clk, 
		fill_clk, 
		clk_1hz
	);
	
	and(clean_done, clock_off, !pulse_transiction);
	
	lines_control(
		init_pulse,
		fast_but_visible_clk,
		sprinkler_clk, 
		drip_clk, 
		fill_clk, 
		states,
		clean_done,
		lines,
		rows_status

	);

	
	display(clk_fg, states, DS, US, mostrador, digits);
		
	pesticide_verification(init_pulse, pesticide, clk_50mhz, states, alert_np, alert_on);
//a
	
	
endmodule
