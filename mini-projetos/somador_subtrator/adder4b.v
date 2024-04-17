module adder4b(input M, input [3:0] A, input [3:0] B, output [3:0] S, output overflow);

	wire x0, x1, x2, x3, c0, c1, c2;


	xor (x0, M, B[0]);
	

	full_adder FA0
	(
		A[0],
		x0,
		M,
		S[0],
		c0	
	);
	
	xor (x1, M, B[1]);
	

	full_adder FA1
	(
		A[1],
		x1,
		c0,
		S[1],
		c1	
	);

	xor (x2, M, B[2]);
	

	full_adder FA2
	(
		A[2],
		x2,
		c1,
		S[2],
		c2
	);


xor (x3, M, B[3]);
	

	full_adder FA3
	(
		A[3],
		x3,
		c2,
		S[3],
		overflow	
	);


endmodule
