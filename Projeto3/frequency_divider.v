module frequency_divider(input limpa, input clk_864hz, output aux10, output sprinkler_clk, output drip_clk, output fill_clk, output clk_1hz);




//clock do gerador de função --> clk_108hz
t_flip_flop(1, clk_864hz, limpa,, clk_432hz);
t_flip_flop(1, clk_432hz, limpa,, clk_216hz);
t_flip_flop(1, clk_216hz, limpa,, clk_108hz);
//clock do gerador de função --> clk_108hz



//108hz -> 21,6hz

and(count_clear1, Q0, !Q1, Q2);
or(clear_full1, count_clear1, limpa);

t_flip_flop(1, clk_108hz, clear_full1, Q0, aux0);
t_flip_flop(1, aux0, clear_full1, Q1, aux1);
t_flip_flop(1, aux1, clear_full1, Q2, clk_21_6hz);


//21,6hz -> 4,32hz

and(count_clear2, Q3, !Q4, Q5);
or(clear_full2, count_clear2, limpa);

t_flip_flop(1, clk_21_6hz, clear_full2, Q3, aux3);
t_flip_flop(1, aux3, clear_full2, Q4, aux4);
t_flip_flop(1, aux4, clear_full2, Q5, clk_4_32hz);

//4,32hz -> 0,432hz

t_flip_flop(1, clk_4_32hz, limpa,, clk_4_32l2hz);

and(count_clear3, Q6, !Q7, Q8);
or(clear_full3, count_clear3, limpa);

t_flip_flop(1, clk_4_32l2hz, clear_full3, Q6, aux6);
t_flip_flop(1, aux6, clear_full3, Q7, aux7);
t_flip_flop(1, aux7, clear_full3, Q8, sprinkler_clk);


t_flip_flop(1, sprinkler_clk, limpa,, drip_clk);




//		21,6hz->7,2hz 
and(count_clear4, Q9, Q10);
or(clear_full4, count_clear4, limpa);

t_flip_flop(1, clk_21_6hz, clear_full4, Q9, aux9);
t_flip_flop(1, aux9, clear_full4, Q10, aux10);

//		7,2hz->2,4hz 
and(count_clear5, Q11, Q12);
or(clear_full5, count_clear5, limpa);

t_flip_flop(1, aux10, clear_full5, Q11, aux11);
t_flip_flop(1, aux11, clear_full5, Q12, aux12);

//		2,4hz -> 0,8hz
and(count_clear6, Q13, Q14);
or(clear_full6, count_clear6, limpa);

t_flip_flop(1, aux12, clear_full6, Q13, aux13);
t_flip_flop(1, aux13, clear_full6, Q14, fill_clk);



t_flip_flop(1, clk_108hz, limpa,, clk_54hz);
t_flip_flop(1, clk_54hz, limpa,, clk_27hz);



//		27hz->9hz 
and(count_clear7, Q99, Q100);
or(clear_full7, count_clear7, limpa);

t_flip_flop(1, clk_27hz, clear_full7, Q99, aux99);
t_flip_flop(1, aux99, clear_full7, Q100, aux100);



//		9hz->3hz 
and(count_clear8, Qaa, Qb);
or(clear_full8, count_clear8, limpa);

t_flip_flop(1, aux100, clear_full8, Qaa, auxaa);
t_flip_flop(1, auxaa, clear_full8, Qb, auxb);


//		3hz->1hz 
and(count_clear9, QQW, Ql);
or(clear_full9, count_clear9, limpa);

t_flip_flop(1, auxb, clear_full9, QQW, auxQW);
t_flip_flop(1, auxQW, clear_full9, Ql, clk_1hz);




endmodule
