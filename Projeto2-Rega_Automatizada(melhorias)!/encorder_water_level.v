module encorder_water_level(
	input [3:0] water_level,
	output [1:0] coded_wl
);

//teste



or(coded_wl[0], water_level[1], water_level[3]);
or(coded_wl[1], water_level[2], water_level[3]);








/*
	00 - erro ou nível crítico
	01 - nível baixo
	10 - nível médio
	11 - nível alto
*/

endmodule