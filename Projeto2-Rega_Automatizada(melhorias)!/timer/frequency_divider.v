/* Divides a 50 MHz clock to outputs nearly 1Hz and 
	other frequencies to synchronize the project */

module frequency_divider
(
	input wire        t, clear, _50MHz_clk, 
	output wire       _1Hz_frequency,
	output wire [1:0] frequencies
);
	wire [25:0] inv_slowed_clks;
	wire [21:0] unused_clks;
	wire [ 2:0] _3_division_clks;
	wire inv_50MHz_clk, new_clear_signal;
	
	not inv0(inv_50MHz_clk, _50MHz_clk);
	
	// Dividing the clock by 2 using a sequence of T flip-flops
	t_flip_flop t_ff0 (t, inv_50MHz_clk, 	   clear, , inv_slowed_clks[0]);
	t_flip_flop t_ff1 (t, inv_slowed_clks[0], clear, , inv_slowed_clks[1]);
	t_flip_flop t_ff2 (t, inv_slowed_clks[1], clear, , inv_slowed_clks[2]);
	t_flip_flop t_ff3 (t, inv_slowed_clks[2], clear, , inv_slowed_clks[3]);
	t_flip_flop t_ff4 (t, inv_slowed_clks[3], clear, , inv_slowed_clks[4]);
	//5
	
	t_flip_flop t_ff5 (t, inv_slowed_clks[4], clear, , inv_slowed_clks[5]);
	t_flip_flop t_ff6 (t, inv_slowed_clks[5], clear, , inv_slowed_clks[6]);
	t_flip_flop t_ff7 (t, inv_slowed_clks[6], clear, , inv_slowed_clks[7]);
	t_flip_flop t_ff8 (t, inv_slowed_clks[7], clear, , inv_slowed_clks[8]);
	t_flip_flop t_ff9 (t, inv_slowed_clks[8], clear, , inv_slowed_clks[9]);
	//10
	
	t_flip_flop t_ff10(t, inv_slowed_clks[ 9], clear, , inv_slowed_clks[10]);
	t_flip_flop t_ff11(t, inv_slowed_clks[10], clear, , inv_slowed_clks[11]);
	t_flip_flop t_ff12(t, inv_slowed_clks[11], clear, , inv_slowed_clks[12]);
	t_flip_flop t_ff13(t, inv_slowed_clks[12], clear, , inv_slowed_clks[13]);
	t_flip_flop t_ff14(t, inv_slowed_clks[13], clear, , inv_slowed_clks[14]);
	//15
	
	t_flip_flop t_ff15(t, inv_slowed_clks[14], clear, frequencies[0], inv_slowed_clks[15]);
	t_flip_flop t_ff16(t, inv_slowed_clks[15], clear, frequencies[1], inv_slowed_clks[16]);
	t_flip_flop t_ff17(t, inv_slowed_clks[16], clear, , inv_slowed_clks[17]);
	t_flip_flop t_ff18(t, inv_slowed_clks[17], clear, , inv_slowed_clks[18]);
	t_flip_flop t_ff19(t, inv_slowed_clks[18], clear, , inv_slowed_clks[19]);
	//20
	
	t_flip_flop t_ff20(t, inv_slowed_clks[19], clear, , inv_slowed_clks[20]);
	t_flip_flop t_ff21(t, inv_slowed_clks[20], clear, , inv_slowed_clks[21]);
	t_flip_flop t_ff22(t, inv_slowed_clks[21], clear, , inv_slowed_clks[22]);
	//23
	
	// Division by 3
	and and0(new_clear_signal, _3_division_clks[0], _3_division_clks[1]);
	t_flip_flop t_ff23(
		t, inv_slowed_clks[22], new_clear_signal, _3_division_clks[0], inv_slowed_clks[23]);
	t_flip_flop t_ff24(
		t, inv_slowed_clks[23], new_clear_signal, _3_division_clks[1], inv_slowed_clks[24]);
	
	// Last division by 2
	t_flip_flop t_ff25(t, inv_slowed_clks[24], clear, _1Hz_frequency, );

endmodule

