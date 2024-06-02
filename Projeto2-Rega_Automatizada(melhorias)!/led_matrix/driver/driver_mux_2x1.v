/* Multiplexes the first 2 values 
	for the LED array rows */

module driver_mux_2x1
(
    input wire [1:0] rows_values,    
    input wire 		bin_number_sel,  
    output wire 		row_status
);
	 wire inv_bin_number_sel;
	 wire [1:0] aux;

    not inv0(inv_bin_number_sel, bin_number_sel);
	 
    and and0(aux[0], rows_values[0], inv_bin_number_sel);
    and and1(aux[1], rows_values[1], bin_number_sel);
	 
    or  row_value(row_status, aux[0], aux[1]);
	 
endmodule
