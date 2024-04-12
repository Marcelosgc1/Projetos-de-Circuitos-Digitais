module valvulaDeEntrada(
	input wire erro, 
	input wire H,
	output wire VE
);

	nor Ve(VE, erro, H);
	
	
endmodule