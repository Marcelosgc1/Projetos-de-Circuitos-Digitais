module ckt0(out,A, B);
	input A, B;
	output out;
	nand Nand0(out, A, B);
endmodule