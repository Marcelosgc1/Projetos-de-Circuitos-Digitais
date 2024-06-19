/* Outputs the image of column 1 to water tank level */

module water_tank_level_decoder_column1
(
	input  wire [1:0] tank_level_status,
	output wire [6:0] rows_status
);
	wire [1:0] aux;
	
	not inv0(aux[0], tank_level_status[0]);
	not inv1(aux[1], tank_level_status[1]);
	
	// Row 0
	or  row0_status(rows_status[0], aux[0], aux[1]);
	
	// Row 1
	or  row1_status(rows_status[1], aux[0], aux[1]);
	
	// Row 2
	or  row2_status(rows_status[2], aux[0], aux[1]);
	
	// Row 3
	or  row3_status(rows_status[3], aux[1], aux[1]);
	
	// Row 4
	or  row4_status(rows_status[4], aux[1], aux[1]);
	
	// Row 5
	or  row5_status(rows_status[5], aux[1], aux[1]);
	
	// Row 6
	and row6_status(rows_status[6], aux[0], aux[1]);

endmodule
