module pesticide_verification(input init, input button, input clk, input [1:0]state, output alert_np, output alert_on);


//quando é possivel por agrotox? 
//resposta:
//estado = 01 AND alert_on = 0


//mostra vermelho/amarelo quando nn puder adicionar agrotoxico!!
or(not_possible, !state[0], state[1], alert_on);
and(alert_np, button, not_possible);





//fazendo verde
debouncer(button, clk, pulse);

and(pesticedes_on, !state[1], state[0], pulse);
and(cleaning, state[1], !state[0]);

or(cleaning_or_init, cleaning, init);

jk_flip_flop(0, 0, 0, cleaning_or_init, pesticedes_on, alert_on);







endmodule
