module half_adder(input A, input B, output S, output carry_out);
	
	xor (S, A, B);
	and (carry_out, A, B);


endmodule 