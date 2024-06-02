module mux_2x1_4bit 
(
    input  [3:0] bin_number0,   
    input  [3:0] bin_number1,   
    input 		  sel,         
    output [3:0] selected_number
);
    mux_2x1_1bit mux0(bin_number0[0], bin_number1[0], 
							 sel, selected_number[0]);
    mux_2x1_1bit mux1(bin_number0[1], bin_number1[1], 
						    sel, selected_number[1]);
    mux_2x1_1bit mux2(bin_number0[2], bin_number1[2], 
							 sel, selected_number[2]);
    mux_2x1_1bit mux3(bin_number0[3], bin_number1[3], 
							 sel, selected_number[3]);

endmodule
