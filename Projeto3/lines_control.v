module lines_control(input init, input clk, input sprinkler_clk, input drip_clk, input fill_clk, input [1:0]state, input clean_done, output [13:0]lines, output [6:0]rows);






//sistema de escolher clock baseado no estado {


and(aux0, !state[1], !state[0], fill_clk);
and(aux1, !state[1], state[0], sprinkler_clk);
and(aux2, state[1], state[0], drip_clk);
and(aux3, state[1], !state[0], clean_done);


or(clock_atual, aux0, aux1, aux2, aux3);


//sistema de escolher clock baseado no estado }


//encher ou desencher{

nor(fill_or_empty, state[1], state[0]);

//encher ou desencher}

fsm_lines(init, clock_atual, fill_or_empty, lines);


//decodificar fsm para matriz {

//linha0
nor(on_off0, lines[0], lines[1]);
and(blink0, !lines[1], clk);
or(rows[0], on_off0, blink0);

//linha1
nor(on_off1, lines[2], lines[3]);
and(blink1, !lines[3], clk);
or(rows[1], on_off1, blink1);

//linha2
nor(on_off2, lines[4], lines[5]);
and(blink2, !lines[5], clk);
or(rows[2], on_off2, blink2);

//linha3
nor(on_off3, lines[6], lines[7]);
and(blink3, !lines[7], clk);
or(rows[3], on_off3, blink3);

//linha4
nor(on_off4, lines[8], lines[9]);
and(blink4, !lines[9], clk);
or(rows[4], on_off4, blink4);

//linha5
nor(on_off5, lines[10], lines[11]);
and(blink5, !lines[11], clk);
or(rows[5], on_off5, blink5);

//linha6
nor(on_off6, lines[12], lines[13]);
and(blink6, !lines[13], clk);
or(rows[6], on_off6, blink6);


//decodificar fsm para matriz }



endmodule
