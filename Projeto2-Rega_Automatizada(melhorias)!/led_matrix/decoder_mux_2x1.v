/* Selects one bit from the values to the rows of LED array */

module decoder_mux_2x1
(
    input  wire [1:0] rows_values,
    input  wire 		 sel,  
    output wire 		 selected_value
);
    wire inv_sel;
	 wire [1:0] aux;

    not inv0(inv_sel, sel);
	 
    and and0(aux[0], rows_values[0], inv_sel);
    and and1(aux[1], rows_values[1], sel);
	 
    or  or0(selected_value, aux[0], aux[1]);
	 
endmodule
