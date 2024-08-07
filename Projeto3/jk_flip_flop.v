/* Implementation of a JK flip-flop with clear and preset inputs */

module jk_flip_flop
(
	input wire  j, k, clk, clear, preset,
	output reg  q, 
	output wire q_bar
);

	always @ (posedge clk or posedge clear or posedge preset) begin
		if (preset) begin
			q <= 1;
		end
		else if (clear) begin
			q <= 0;
		end
		else begin
			case ({j,k})
				2'b00: q <= q;
				2'b01: q <= 0;
				2'b10: q <= 1;
				2'b11: q <= ~q;
			endcase
		end
	end
	
	assign q_bar = ~q;

endmodule
