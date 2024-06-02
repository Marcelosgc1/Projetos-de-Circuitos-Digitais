module FFJK(input clk, input j, input k, output reg Q, output Q_bar, input clear, input preset);

	always @ (posedge clk or posedge clear or posedge preset) begin
		if (clear) begin
			Q <= 0;
		end
		else if (preset) begin
			Q <= 1;
		end
		else begin
			case ({j,k})
				2'b00: Q <= Q;
				2'b01: Q <= 0;
				2'b10: Q <= 1;
				2'b11: Q <= !Q;
			endcase
		end
	end
	//a
	assign Q_bar = !Q;

endmodule
