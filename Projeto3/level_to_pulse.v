module level_to_pulse(input clk, input lvl, output pls);



d_flip_flop(lvl, clk, Qi);
not(Qi_bar, Qi);
and(pls, Qi_bar, lvl);




endmodule