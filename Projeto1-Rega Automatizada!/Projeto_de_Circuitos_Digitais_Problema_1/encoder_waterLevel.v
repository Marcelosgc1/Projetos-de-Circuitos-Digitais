module encoder_waterLevel(
input L,
input M,
input H,
output b0,
output b1
);
	wire w_H_xnor_M;
	
	
	xnor H_M_xnor(w_H_xnor_M, H, M);
	
	
	and L_H_xnor_M_and(b0, L, w_H_xnor_M);
	and M_L_and(b1, M, L);
	
	



endmodule 
