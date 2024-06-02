/* Selects 1 of the 5 columns of
	the LED matrix, 1 at a time  */

module driver_columns_decoder
(
	input wire  [2:0] bin_number,
	output wire [4:0] column_status
);
	wire [2:0] aux;
	
	not inv0(aux[0], bin_number[0]);
	not inv1(aux[1], bin_number[1]);
	not inv2(aux[2], bin_number[2]);

	// Activates each column individually providing high logic level
	and column0_status(column_status[0], aux[0], aux[1], aux[2]);
	and column1_status(column_status[1], bin_number[0], aux[1]);
	and column2_status(column_status[2], aux[0], bin_number[1]);
	and column3_status(column_status[3], bin_number[0], bin_number[1]);
	and column4_status(column_status[4], bin_number[2], bin_number[2]);

endmodule
