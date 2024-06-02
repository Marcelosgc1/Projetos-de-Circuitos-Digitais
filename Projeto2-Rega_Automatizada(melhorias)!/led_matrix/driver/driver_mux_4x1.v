/* Multiplexes the first 4 values for 
	the LED matrix rows using 2x1 muxes */

module driver_mux_4x1
(
	input wire [3:0] rows_values,    
   input wire [1:0] bin_number_sel,  
   output wire		  row_status
);
	wire [1:0] results;
	 
	driver_mux_2x1 muxes_two_first_values(
		rows_values[1:0], 
		bin_number_sel[0], 
		results[0]
	);
	
	driver_mux_2x1 muxes_two_last_values(
		rows_values[3:2], 
		bin_number_sel[0], 
		results[1]
	);
	 
	driver_mux_2x1 muxes_results(
		results, 
		bin_number_sel[1], 
		row_status
	);
	 
endmodule
