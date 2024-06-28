module timer(input clk, input [1:0]state, input [1:0]irrigation_type, input pulse_transiction, input init_pulse, output [1:0]DS, output [3:0]US, output clk_off);

wire [2:0]timer_needed;

wire [1:0]psDS;
wire [1:0]psUS;
wire [1:0]clDS;
wire [1:0]clUS;



encoder_timer(state, irrigation_type, timer_needed);
presets(timer_needed, pulse_transiction, psDS, psUS, clDS, clUS);

counter_9_0(clk_on, init_pulse, psUS, clUS, US);

and(flag_seconds, US[3],!US[2],!US[1],US[0]);

counter_3_0(flag_seconds, init_pulse, psDS, clDS, DS);


and(clk_on, clk, clk_enb);

or(clk_enb, US[0],US[1],US[2],US[3],DS[1],DS[0]);

not(clk_off, clk_enb);



endmodule