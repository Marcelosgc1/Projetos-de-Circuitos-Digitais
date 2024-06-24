module display(input clk, input [1:0]state, input [3:0]Ds, input [3:0]Us, output [6:0]seg, output[3:0]digit);


wire [1:0]seletor;
wire [3:0]bits_atuais;
wire [3:0]estado_atual;
wire [3:0]valvula;

//codifica estado
xor(estado_atual[0], state[0], state[1]);
not(estado_atual[1], state[1]);
assign estado_atual[2] = state[1];
assign estado_atual[3] = 1;

//codifica valvula
and(valvula[0], state[0], state[1]);
nand(valvula[1], state[0], state[1]);
or(valvula[2], state[0], state[1]);
nand(valvula[3], state[0], state[1]);



//Criando Seletor
contador_sincrono_4(clk, seletor);

//Seleciona
mux16_4(estado_atual, valvula, Ds, Us, seletor, bits_atuais);


//SAIDA
nor(digit[0], seletor[0], seletor[1]);
and(digit[1], seletor[0], !seletor[1]);
and(digit[2], !seletor[0], seletor[1]);
and(digit[3], seletor[0], seletor[1]);

decoder_7_seg(bits_atuais, seg);




endmodule
