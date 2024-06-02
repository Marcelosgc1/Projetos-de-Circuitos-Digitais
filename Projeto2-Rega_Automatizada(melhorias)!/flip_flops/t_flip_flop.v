/* Implementation of a T flip-flop with a clear input */

module t_flip_flop
(
	input wire t, clk, clear, 
	output reg q,
	output wire q_bar
);
	always @ (posedge clk or posedge clear) begin
		if (clear) begin
			q <= 0;
		end
		else if (t) begin
			q <= ~q;
		end
	end
	
	assign q_bar = ~q;

endmodule
