/* Implementation of a D flip-flop */

module d_flip_flop
(
	input wire d, clk, 
	output reg q
);
		
	always @(posedge clk) begin
		q = d;
	end

endmodule
