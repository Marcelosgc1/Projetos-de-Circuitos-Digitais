/* Count from 59 to 0 seconds using the clock value */

module _60_seconds_timer
(
	input wire clk,
	input wire reset,
	output reg [5:0] seconds_counter
);
	
	// Declaring a register to compute seconds using the clock value
	reg [25:0] clk_counter;
	
	// Behavioral logic to measure time and reset timer
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			clk_counter <= 26'd0;
			seconds_counter <= 6'd59;
		end else if (clk_counter == 26'd50_000_000) begin
			clk_counter <= 26'd0;
			if (seconds_counter == 6'd0)
				seconds_counter <= 6'd59;
			else
				seconds_counter <= seconds_counter - 6'd1;
		end else
			clk_counter <= clk_counter + 26'd1;
	end

endmodule
