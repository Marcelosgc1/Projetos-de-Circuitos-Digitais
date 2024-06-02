/* Multiplexes each row value of 
	LED array using smaller muxes */

module driver_mux_5x1
(
   input wire  [4:0] rows_values,
   input wire  [2:0] bin_number_sel,    
   output wire 		row_status           
);
	wire result;
	
	driver_mux_4x1 muxes_first_four_values(
		rows_values[3:0], 
		bin_number_sel[1:0], 
		result
	);
	
	driver_mux_2x1 muxes_msb_and_result(
		{rows_values[4], result}, 
		bin_number_sel[2], 
		row_status
	);

endmodule


