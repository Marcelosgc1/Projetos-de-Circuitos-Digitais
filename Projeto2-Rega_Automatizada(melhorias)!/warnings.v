module warnings(
	input [3:0]water_level,
	output error,
	output inlet_valve,
	output alarm	
);

//error
nor(error, water_level[0],water_level[1],water_level[2],water_level[3]);

//inlet_valve
or(inlet_valve, water_level[0],water_level[1],water_level[2]);

//alarm
or(alarm, error, water_level[0]);

endmodule
