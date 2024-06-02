module mux_2x1_1bit
(
    input  bin_number0,    
    input  bin_number1,    
    input  sel,  
    output selected_number
);
    wire inv_sel;
	 wire [1:0] aux;

    not inv0(inv_sel, sel);
	 
    and and0(aux[0], bin_number0, inv_sel);
    and and1(aux[1], bin_number1, sel);
	 
    or  or0(selected_number, aux[0], aux[1]);
	 
endmodule
