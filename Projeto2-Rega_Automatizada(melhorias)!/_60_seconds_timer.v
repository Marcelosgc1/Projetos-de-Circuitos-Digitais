module _60_seconds_timer
(
	input wire clk,
	input wire reset,
	output reg [5:0] seconds_counter
);

	reg [25:0] clk_counter;
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			clk_counter <= 26'd0;
			seconds_counter <= 6'd59;
		end else if (clk_counter == 26'd50_000_000) begin
			clk_counter <= 26'd0;
		end if (seconds_counter == 6'd0)
			seg <= 6'd59;
		end else begin
			seconds_counter <= seconds_counter - 6'd1;
			clk_counter <= clk_counter + 26'd1;
		end
	end

endmodule
