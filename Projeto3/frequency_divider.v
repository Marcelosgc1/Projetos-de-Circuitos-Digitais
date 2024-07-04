module frequency_divider(input limpa, input clk_896hz, output aux1, output sprinkler_clk, output drip_clk, output fill_clk, output clk_1hz);




//clock do gerador de função --> clk_28hz

t_flip_flop(1, clk_896hz, limpa,, clk_448hz);
t_flip_flop(1, clk_448hz, limpa,, clk_224hz);
t_flip_flop(1, clk_224hz, limpa,, clk_112hz);
t_flip_flop(1, clk_112hz, limpa,, clk_56hz);
t_flip_flop(1, clk_56hz, limpa,, clk_28hz);

//clock do gerador de função --> clk_28hz





//28hz->7hz
t_flip_flop(1, clk_28hz, limpa,, aux0);
t_flip_flop(1, aux0, limpa,, aux1);



//7hz->1hz (counter 7)

and(count_clear0, Q0, Q1, Q2);
or(clear_full0, count_clear0, limpa);

t_flip_flop(1, aux1, clear_full0, Q0, aux2);
t_flip_flop(1, aux2, clear_full0, Q1, aux3);
t_flip_flop(1, aux3, clear_full0, Q2, clk_1hz);

//=================================================

//28hz->5,6hz (counter 5)

and(count_clear1, Q3, !Q4, Q5);
or(clear_full1, count_clear1, limpa);

t_flip_flop(1, clk_28hz, clear_full1, Q3, aux4);
t_flip_flop(1, aux4, clear_full1, Q4, aux5);
t_flip_flop(1, aux5, clear_full1, Q5, aux6);



//28/5hz->28/35hz (0,8hz) (counter 7)

and(count_clear2, Q6, Q7, Q8);
or(clear_full2, count_clear2, limpa);

t_flip_flop(1, aux6, clear_full2, Q6, aux7);
t_flip_flop(1, aux7, clear_full2, Q7, aux8);
t_flip_flop(1, aux8, clear_full2, Q8, fill_clk);



//28/5hz->28/15hz (counter 3)

and(count_clear3, Q9, Q10);
or(clear_full3, count_clear3, limpa);

t_flip_flop(1, aux6, clear_full3, Q9, aux9);
t_flip_flop(1, aux9, clear_full3, Q10, aux10);



//28/15hz->7/15hz

t_flip_flop(1, aux10, limpa,, aux11);
t_flip_flop(1, aux11, limpa,, sprinkler_clk);

//7/15hz->7/30hz

t_flip_flop(1, sprinkler_clk, limpa,, drip_clk);


endmodule