/* Outputs the image of the column 4 to show irrigation condition */

module irrigation_status_decoder_column4
(
	input wire  [1:0] irrigation_status,
	output wire [6:0] rows_status
);
	wire [1:0] aux;
	
	not inv0(aux[0], irrigation_status[0]);
	not inv1(aux[1], irrigation_status[1]);
	
	// Row 0
	or  row0_status(rows_status[0], aux[0], irrigation_status[0]);
	
	// Row 1
	and row1_status(rows_status[1], aux[0], aux[1]);
	
	// Row 2
	and row2_status(rows_status[2], aux[0], aux[0]);
	
	// Row 3
	and row3_status(rows_status[3], rows_status[1], rows_status[1]);
	
	// Row 4
	and row4_status(rows_status[4], rows_status[1], rows_status[1]);
	
	// Row 5
	and row5_status(rows_status[5], rows_status[1], rows_status[1]);
	
	// Row 6
	and row6_status(rows_status[6], aux[0], aux[0]);

endmodule
