module frequency_divider(input clk_896hz, output aux1, output sprinkler_clk, output drip_clk, output fill_clk, output clk_1hz);




//clock do gerador de função --> clk_28hz

t_flip_flop(1, clk_896hz, 0,, clk_448hz);
t_flip_flop(1, clk_448hz, 0,, clk_224hz);
t_flip_flop(1, clk_224hz, 0,, clk_112hz);
t_flip_flop(1, clk_112hz, 0,, clk_56hz);
t_flip_flop(1, clk_56hz, 0,, clk_28hz);

//clock do gerador de função --> clk_28hz





//28hz->7hz
t_flip_flop(1, clk_28hz, 0,, aux0);
t_flip_flop(1, aux0, 0,, aux1);



//7hz->1hz (counter 7)

and(count_clear0, Q0, Q1, Q2);

t_flip_flop(1, aux1, count_clear0, Q0, aux2);
t_flip_flop(1, aux2, count_clear0, Q1, aux3);
t_flip_flop(1, aux3, count_clear0, Q2, clk_1hz);

//=================================================

//28hz->5,6hz (counter 5)

and(count_clear1, Q3, !Q4, Q5);

t_flip_flop(1, clk_28hz, count_clear1, Q3, aux4);
t_flip_flop(1, aux4, count_clear1, Q4, aux5);
t_flip_flop(1, aux5, count_clear1, Q5, aux6);



//28/5hz->28/35hz (0,8hz) (counter 7)

and(count_clear2, Q6, Q7, Q8);

t_flip_flop(1, aux6, count_clear2, Q6, aux7);
t_flip_flop(1, aux7, count_clear2, Q7, aux8);
t_flip_flop(1, aux8, count_clear2, Q8, fill_clk);



//28/5hz->28/15hz (counter 3)

and(count_clear3, Q9, Q10);

t_flip_flop(1, aux6, count_clear3, Q9, aux9);
t_flip_flop(1, aux9, count_clear3, Q10, aux10);



//28/15hz->7/15hz

t_flip_flop(1, aux10, 0,, aux11);
t_flip_flop(1, aux11, 0,, sprinkler_clk);

//7/15hz->7/30hz

t_flip_flop(1, sprinkler_clk, 0,, drip_clk);


endmodule
