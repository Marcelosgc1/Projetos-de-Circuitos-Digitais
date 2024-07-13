module decoder_7_seg(input [3:0]b, output [6:0]segments);


//seg A 11
and(aux0, b[3], b[2], b[0]);
and(aux1, b[3], b[2], b[1]);
and(aux2, !b[3], !b[2], !b[1], b[0]);
and(aux3, !b[3], b[2], !b[1], !b[0]);
or(segments[0], aux0, aux1, aux2, aux3);


//seg B 11
and(aux4, b[3], b[2]);
and(aux5, b[2], !b[1], b[0]);
and(aux6, b[2], b[1], !b[0]);
and(aux7, b[3], b[1], !b[0]);
or(segments[1], aux4, aux5, aux6, aux7);



//seg C 11
and(aux8, !b[2], b[1], !b[0]);
and(aux9, b[3], b[1], !b[0]);
and(aux10, b[3], b[2], b[0]);
or(segments[2], aux8, aux9, aux10);


//seg D 11
and(aux11, b[1], b[2], b[0]);
and(aux12, b[3], b[0], b[1]);
and(aux13, b[3], b[2], b[1]);
and(aux14, !b[3], !b[2], !b[1], b[0]);
and(aux15, !b[3], b[2], !b[1], !b[0]);
or(segments[3], aux11, aux12, aux13, aux14, aux15);


//seg E 11
and(aux16, !b[3], b[0]);
and(aux17, b[0], !b[2], !b[1]);
and(aux18, !b[3], b[2], !b[1]);
and(aux19, b[3], b[2], b[1]);
or(segments[4], aux16, aux17, aux18, aux19);


//seg F 11
and(aux20, !b[3], !b[2], b[0]);
and(aux21, !b[3], !b[2], b[1]);
and(aux22, !b[3], b[1], b[0]);
and(aux23, b[3], b[2], b[1]);
or(segments[5], aux20, aux21, aux22, aux23);


//seg G
and(aux24, !b[3], !b[2], !b[1]);
and(aux25, b[3], b[2], !b[1]);
and(aux26, b[2], b[1], b[0]);
or(segments[6], aux24, aux25, aux26);







endmodule
