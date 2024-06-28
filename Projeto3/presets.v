module presets(input [2:0]timer, input pls, output [1:0]psDS, output [1:0]psUS, output [1:0]clDS, output [1:0]clUS);



and(aux0, timer[1], timer[0]);
or(psDS1_temp, timer[2], aux0);

and(psDS[1], psDS1_temp, pls);
and(clDS[1], !psDS1_temp, pls);


xor(aux1, timer[1], timer[0]);
or(psDS0_temp, timer[2], aux1);

and(psDS[0], psDS0_temp, pls);
and(clDS[0], !psDS0_temp, pls);

//-------------------------------------
and(psUS1_temp, timer[1], timer[0]);

and(psUS[1], psUS1_temp, pls);
and(clUS[1], !psUS1_temp, pls);


nor(psUS0_temp, timer[2], timer[0]);

and(psUS[0], psUS0_temp, pls);
and(clUS[0], !psUS0_temp, pls);




endmodule