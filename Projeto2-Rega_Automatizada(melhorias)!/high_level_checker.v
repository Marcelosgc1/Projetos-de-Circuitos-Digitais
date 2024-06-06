/* Manipulates the higher level sensor dinamically */

module high_level_checker
(
	input  wire [1:0] dozen_minutes_timer, dozen_minutes_preset, dozen_seconds_timer
	input  wire [2:0] unit_minutes_timer, 
	input  wire			high_level_indicator,
	output wire 		high_level_sensor
);
	wire [11:0] aux;
	wire [ 1:0] inv_dozen_timer, inv_dozen_preset, inv_unit_timer, inv_unit_preset;

	not inv0(inv_dozen_timer[0], dozen_minutes_timer[0]);
	not inv1(inv_dozen_timer[1], dozen_minutes_timer[1]);
	
	not inv2(inv_dozen_preset[0], dozen_minutes_preset[0]);
	not inv3(inv_dozen_preset[1], dozen_minutes_preset[1]);
	
	not inv4(inv_unit_timer[0], unit_minutes_timer[0]);
	not inv5(inv_unit_timer[1], unit_minutes_timer[1]);
	
	not inv6(inv_unit_preset[0], unit_minutes_preset[0]);
	not inv7(inv_unit_preset[1], unit_minutes_preset[1]);
	
	// When the dozen of minutes is equal 3
	and and0(aux[0], dozen_minutes_timer[1], dozen_minutes_timer[0]);
	
	// When the minutes counter is equal 15 and the dozen minutes preset is 0001
	and and1(aux[1], inv_dozen_timer[1], dozen_minutes_timer[0]);
	and and3(aux[2], inv_dozen_preset[1], dozen_minutes_preset[0]);
	and and2(aux[3], unit_minutes_timer[2], inv_unit_timer[1], unit_minutes_timer[0]);
	
	and and5(aux[4], aux[1], aux[2], aux[3]);
	
	// When the minutes counter is equal 22, the dozen of 
	// seconds is 3 and the dozen minutes preset is 0010
	and and6(aux[5], dozen_minutes_timer[1], inv_dozen_timer[0]);
	and and7(aux[6], dozen_minutes_preset[1], inv_dozen_preset[0]);
	and and8(aux[7], unit_minutes_timer[1], inv_unit_timer[0]);
	and and9(aux[8], dozen_seconds_timer[0], dozen_seconds_timer[1]);
	
	and and10(aux[9], aux[5], aux[6], aux[7], aux[8]);
	
	// Final expression
	or  or0(aux[11], aux[0], aux[4], aux[9]);
	and high_level_signal(high_level_sensor, high_level_indicator, aux[11]);

endmodule
