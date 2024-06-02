module mux_4x1 
(
    input  [3:0] bin_number0,   
    input  [3:0] bin_number1,   
    input  [3:0] bin_number2,   
    input  [3:0] bin_number3,   
    input  [1:0] sel,   
    output [3:0] selected_number
);
    wire [3:0] aux0, aux1;

    mux_2x1_4bit mux0(bin_number0, bin_number1, sel[0], aux0);
    mux_2x1_4bit mux1(bin_number2, bin_number3, sel[0], aux1);
	 
    mux_2x1_4bit mux2(aux0, aux1, sel[1], selected_number);

endmodule

