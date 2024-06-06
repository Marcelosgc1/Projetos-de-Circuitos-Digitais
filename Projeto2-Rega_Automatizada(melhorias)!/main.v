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
	input			b,
	output wire error_indicator_o, 
	output wire alarm_state_o, 
	output wire inlet_valve_o,
	output		[6:0]mostrador,
	output 		digit1_o,
	output 		digit2_o,
	output 		digit3_o,
	output 		digit4_o,
	output		init,
	output wire [6:0] rows_status,
	output wire [4:0] columns_status
);

	wire [1:0] selector_display;
	wire [3:0]ClearUS; 
	wire [3:0]ClearDS; 
	wire [3:0]ClearUM;
	wire	[3:0]ClearDM;
	wire	[3:0]PresetUS; 
	wire	[3:0]PresetDS; 
	wire	[3:0]PresetUM; 
	wire	[3:0]PresetDM;
	wire	[3:0]CUS;
	wire	[3:0]CDS;
	wire	[3:0]CUM;
	wire	[3:0]CDM;
	wire	[3:0]PUS;
	wire	[3:0]PDS;
	wire	[3:0]PUM;
	wire	[3:0]PDM;	
	
	// Declaring wires
	wire irrigation_state_w, sprinkler_state_w, drip_state_w, 
		  bit0_value, bit1_value, digit_control_w;
	// Declaring wires dedicated to keep the values of each 
	// segment of the selected digit in the 7-display segment 
	wire Ca, Cb, Cc, Cd, Ce, Cf, Cg, Ia, Ib, Ic, Id, Ie, If, Ig;
	
	// Inverting high level signal to manage the digits in the display
	not inv0(digit_control_w, high_level_indicator_i);
	
	// Declaring a serie of instances of  
	// components needed for the project  
	error_detector detects_error(
		high_level_indicator_i,
		middle_level_indicator_i,
		low_level_indicator_i,
		error_indicator_o
	);
	
	alarm_trigger triggers_alarm(
		low_level_indicator_i,
		error_indicator_o,
		alarm_state_o
	);
	
	inlet_valve_trigger triggers_inlet_valve(
		high_level_indicator_i,
		error_indicator_o,
		inlet_valve_o
	);
	
	irrigation_trigger triggers_irrigation(
		alarm_state_o,
		soil_humidity_i,
		irrigation_state_w
	);
	
	sprinkler_trigger triggers_sprinkler(
		middle_level_indicator_i,
		irrigation_state_w,
		temperature_i,
		air_humidity_i,
		sprinkler_state_w
	);
	
	drip_trigger triggers_drip(
		middle_level_indicator_i,
		irrigation_state_w,
		temperature_i,
		air_humidity_i,
		drip_state_w
	);
	
	encoder_water_tank_level encodes_water_tank_level(
		high_level_indicator_i,
		middle_level_indicator_i,
		low_level_indicator_i,
		bit0_value,
		bit1_value
	);
			
	decoder_water_tank_level decodes_water_tank_level(
		bit0_value,
		bit1_value,
		Ca,
		Cb,
		Cc,
		Cd,
		Ce,
		Cf,
		Cg
	);
		
	decoder_irrigation_condition decodes_irrigation_condition(
		sprinkler_state_w,
		drip_state_w,
		Ia,
		Ib,
		Ic,
		Id,
		Ie,
		If,
		Ig
	);
		
	mux_2_1 mux_segment_a(
		Ca,
		Ia,
		selector_i,
		segment_a_o
	);
	
	mux_2_1 mux_segment_b(
		Cb,
		Ib,
		selector_i,
		segment_b_o
	);
	
	mux_2_1 mux_segment_c(
		Cc,
		Ic,
		selector_i,
		segment_c_o
	);

	mux_2_1 mux_segment_d(
		Cd,
		Id,
		selector_i,
		segment_d_o
	);
	
	mux_2_1 mux_segment_e(
		Ce,
		Ie,
		selector_i,
		segment_e_o
	);
	
	mux_2_1 mux_segment_f(
		Cf,
		If,
		selector_i,
		segment_f_o
	);
	
	mux_2_1 mux_segment_g(
		Cg,
		Ig,
		selector_i,
		segment_g_o
	);
	
	frequency_divider(
		1,
		0,
		clk,
		new_clock,
		selector_display
	);
	
	kronos(
		temperature_i,
		air_humidity_i,
		high_level_indicator_i,
		middle_level_indicator_i, 
		error_indicator_o, 
		PresetUS, 
		PresetDS, 
		PresetUM, 
		PresetDM, 
		ClearUS, 
		ClearDS, 
		ClearUM, 
		ClearDM
	);
	
	settimer_mux(
		init,
		ClearUS, 
		ClearDS, 
		ClearUM, 
		ClearDM, 
		PresetUS, 
		PresetDS, 
		PresetUM, 
		PresetDM,
		CUS,
		CDS,
		CUM,
		CDM,
		PUS,
		PDS,
		PUM,
		PDM
	);
	
	timer(
		new_clock,
		selector_display,
		PUS, 
		PDS, 
		PUM, 
		PDM, 
		CUS, 
		CDS, 
		CUM, 
		CDM,
		mostrador,
		digit1_o,
		digit2_o,
		digit3_o,
		digit4_o
	);
	
	irrigation_and_water_level_display(
		selector_display[1],
	// new_clock,
		{drip_state_w, sprinkler_state_w},
	// {bit1_value, bit0_value},
      rows_status,
		columns_status
	);
	
	debouncer(
		b,
		selector_display[1],
		init
	);
//a
	
	
endmodule
	
