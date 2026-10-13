module clock_divider (
    input  logic CLK_50, // Reloj 50 MHz
    output logic CLK_OUT // Reloj 1.5 Hz
);

    logic [24:0] Q;
    logic [24:0] nQ;


    not inv0  (nQ[0],  Q[0]);
    not inv1  (nQ[1],  Q[1]);
    not inv2  (nQ[2],  Q[2]);
    not inv3  (nQ[3],  Q[3]);
    not inv4  (nQ[4],  Q[4]);
    not inv5  (nQ[5],  Q[5]);
    not inv6  (nQ[6],  Q[6]);
    not inv7  (nQ[7],  Q[7]);
    not inv8  (nQ[8],  Q[8]);
    not inv9  (nQ[9],  Q[9]);
    not inv10 (nQ[10], Q[10]);
    not inv11 (nQ[11], Q[11]);
    not inv12 (nQ[12], Q[12]);
    not inv13 (nQ[13], Q[13]);
    not inv14 (nQ[14], Q[14]);
    not inv15 (nQ[15], Q[15]);
    not inv16 (nQ[16], Q[16]);
    not inv17 (nQ[17], Q[17]);
    not inv18 (nQ[18], Q[18]);
    not inv19 (nQ[19], Q[19]);
    not inv20 (nQ[20], Q[20]);
    not inv21 (nQ[21], Q[21]);
    not inv22 (nQ[22], Q[22]);
    not inv23 (nQ[23], Q[23]);
    not inv24 (nQ[24], Q[24]);


    flipflop FF0  (.CLK(CLK_50), .EN(1'b1), .D(nQ[0]),  .Q(Q[0]));
    
    // El Ripple.
    flipflop FF1  (.CLK(nQ[0]),  .EN(1'b1), .D(nQ[1]),  .Q(Q[1]));
    flipflop FF2  (.CLK(nQ[1]),  .EN(1'b1), .D(nQ[2]),  .Q(Q[2]));
    flipflop FF3  (.CLK(nQ[2]),  .EN(1'b1), .D(nQ[3]),  .Q(Q[3]));
    flipflop FF4  (.CLK(nQ[3]),  .EN(1'b1), .D(nQ[4]),  .Q(Q[4]));
    flipflop FF5  (.CLK(nQ[4]),  .EN(1'b1), .D(nQ[5]),  .Q(Q[5]));
    flipflop FF6  (.CLK(nQ[5]),  .EN(1'b1), .D(nQ[6]),  .Q(Q[6]));
    flipflop FF7  (.CLK(nQ[6]),  .EN(1'b1), .D(nQ[7]),  .Q(Q[7]));
    flipflop FF8  (.CLK(nQ[7]),  .EN(1'b1), .D(nQ[8]),  .Q(Q[8]));
    flipflop FF9  (.CLK(nQ[8]),  .EN(1'b1), .D(nQ[9]),  .Q(Q[9]));
    flipflop FF10 (.CLK(nQ[9]),  .EN(1'b1), .D(nQ[10]), .Q(Q[10]));
    flipflop FF11 (.CLK(nQ[10]), .EN(1'b1), .D(nQ[11]), .Q(Q[11]));
    flipflop FF12 (.CLK(nQ[11]), .EN(1'b1), .D(nQ[12]), .Q(Q[12]));
    flipflop FF13 (.CLK(nQ[12]), .EN(1'b1), .D(nQ[13]), .Q(Q[13]));
    flipflop FF14 (.CLK(nQ[13]), .EN(1'b1), .D(nQ[14]), .Q(Q[14]));
    flipflop FF15 (.CLK(nQ[14]), .EN(1'b1), .D(nQ[15]), .Q(Q[15]));
    flipflop FF16 (.CLK(nQ[15]), .EN(1'b1), .D(nQ[16]), .Q(Q[16]));
    flipflop FF17 (.CLK(nQ[16]), .EN(1'b1), .D(nQ[17]), .Q(Q[17]));
    flipflop FF18 (.CLK(nQ[17]), .EN(1'b1), .D(nQ[18]), .Q(Q[18]));
    flipflop FF19 (.CLK(nQ[18]), .EN(1'b1), .D(nQ[19]), .Q(Q[19]));
    flipflop FF20 (.CLK(nQ[19]), .EN(1'b1), .D(nQ[20]), .Q(Q[20]));
    flipflop FF21 (.CLK(nQ[20]), .EN(1'b1), .D(nQ[21]), .Q(Q[21]));
    flipflop FF22 (.CLK(nQ[21]), .EN(1'b1), .D(nQ[22]), .Q(Q[22]));
    flipflop FF23 (.CLK(nQ[22]), .EN(1'b1), .D(nQ[23]), .Q(Q[23]));
    flipflop FF24 (.CLK(nQ[23]), .EN(1'b1), .D(nQ[24]), .Q(Q[24]));

    // 50,000,000 / (2^25) = 1.49 Hz
    assign CLK_OUT = Q[15];

endmodule