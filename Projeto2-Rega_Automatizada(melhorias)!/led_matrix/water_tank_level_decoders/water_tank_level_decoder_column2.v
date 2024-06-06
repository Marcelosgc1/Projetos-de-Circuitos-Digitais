/* Outputs the image of column 2 to water tank level */

module water_tank_level_decoder_column2
(
	input  wire       _1Hz_frequency,
	input  wire [1:0] tank_level_status,
	output wire [6:0] rows_status
);
	wire [1:0] inv_tank_level;
	wire inv_clk;
	wire [3:0] aux;
	
	not inv0(inv_tank_level[0], tank_level_status[0]);
	not inv1(inv_tank_level[1], tank_level_status[1]);
	not inv2(inv_clk, _1Hz_frequency);
	
	// Row 0
	and and0(aux[0], inv_tank_level[0], tank_level_status[1]);
	and and1(aux[1], tank_level_status[0], inv_tank_level[1]);//
	and and2(aux[2], inv_clk, inv_tank_level[0]);
	and and3(aux[3], inv_clk, inv_tank_level[1]);
	
	or  row0_status(rows_status[0], aux[0], aux[1], aux[2], aux[3]);
	// Row 1
	or  row1_status(rows_status[1], rows_status[0], rows_status[0]);
	
	// Row 2
	or  row2_status(rows_status[2], rows_status[0], rows_status[0]);
	
	// Row 3
	or  row3_status(rows_status[3], aux[1], aux[3]);
	
	// Row 4
	or  row4_status(rows_status[4], aux[1], aux[3]);
	
	// Row 5
	or  row5_status(rows_status[5], inv_tank_level[1], inv_tank_level[1]);
	
	// Row 6
	and row6_status(rows_status[6], inv_clk, inv_tank_level[0], inv_tank_level[1]);

endmodule

	