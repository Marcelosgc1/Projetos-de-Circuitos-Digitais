module authorizedToIrrigate(
input wire Al,
input wire Us,
output wire out
);
		
	nor Inv0(out, Us, Al);
	

endmodule 