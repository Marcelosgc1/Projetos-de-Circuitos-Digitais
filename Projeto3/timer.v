module timer(input clk, input [1:0]state, input [1:0]irrigation_type, input pulse_transiction, input init_pulse, output [1:0]DS, output [3:0]US, output clk_off);

wire [2:0]timer_needed;

wire [1:0]psDS;
wire [1:0]psUS;




encoder_timer(state, irrigation_type, timer_needed);
presets(timer_needed, pulse_transiction, psDS, psUS);

counter_9_0(clk_on, init_pulse, psUS, US);
counter_3_0(clk_on, init_pulse, psDS, DS);


and(clk_on, clk, clk_enb);

or(clk_enb, US[0],US[1],US[2],US[3],DS[1],DS[0]);

not(clk_off, clk_enb);



endmodule