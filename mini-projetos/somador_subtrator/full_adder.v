module full_adder(input A, input B, input carry_in, output S, output carry_out);

	wire CO, C1, S0;

	half_adder HA1
	(
		A,
		B,
		S0, 
		CO		
	);
	
	half_adder HA2
	(
		carry_in,
		S0,
		S,
		C1	
	);
	
	or (carry_out, CO, C1);

endmodule 