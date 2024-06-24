/* Implementation of a D flip-flop */

module d_flip_flop
(
	input wire d, clk, 
	output reg q,
	input clear
);
		
	always @(posedge clk or posedge clear) begin
		if (clear) begin
			q <= 0;
		end
		else begin
		q = d;
		end
	end

endmodule
