/* Sets the water tank level dinamically */

module high_level_checker
(
	input  wire [1:0] dozen_minutes_timer,
	input  wire [2:0]	unit_minutes_timer,
	input  wire 		high_level_indicator,
	input  wire  		air_humidity,
	input  wire  		soil_humidity,
	input  wire  		temperature,
	output wire 		high_level_sensor
);
	wire [7:0] aux;
	wire [1:0] inv_dozen_timer;
	wire [1:0] inv_unit_timer;
	wire inv_air_humidity, inv_soil_humidity, inv_temperature;
	
	not inv0(inv_dozen_timer[0], dozen_minutes_timer[0]);
	not inv1(inv_dozen_timer[1], dozen_minutes_timer[1]);
	
	not inv2(inv_unit_timer[0], unit_minutes_timer[0]);
	not inv3(inv_unit_timer[1], unit_minutes_timer[1]);
	
	not inv4(inv_air_humidity, air_humidity);
	not inv5(inv_soil_humidity, soil_humidity);
	not inv6(inv_temperature, temperature);
	
	// When the dozen of minutes is equal 3
	and and0(aux[0], dozen_minutes_timer[1], dozen_minutes_timer[0]);
	
	// When the minutes counter is equal 15, 
	// air humidity is low and the soil is dry
	and and1(aux[1], inv_dozen_timer[1], dozen_minutes_timer[0]);
	and and2(aux[2], unit_minutes_timer[2], inv_unit_timer[1], unit_minutes_timer[0]);
	
	and and3(aux[3], aux[1], aux[2], inv_air_humidity, inv_soil_humidity);
	
	// When the minutes counter is equal 22, both air
   //	humidity and temperature are high and the soil is dry 
	and and4(aux[4], dozen_minutes_timer[1], inv_dozen_timer[0]);
	and and5(aux[5], unit_minutes_timer[1], inv_unit_timer[0]);
	
	and and6(aux[6], aux[4], aux[5], air_humidity, inv_temperature, inv_soil_humidity);
	
	// Final expression
	or  or0(aux[7], aux[0], aux[3], aux[6]);
	and high_level_signal(high_level_sensor, high_level_indicator, aux[7]);

endmodule
