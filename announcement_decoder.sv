module announcement_decoder(
    input  logic E0, E1,      
    output logic a, b, c, d, 
    output logic e, f, g
);

    wire not_E0, not_E1;
    not U24_notE1 (not_E1, E1);
    not U24_notE0 (not_E0, E0);
    
    wire Y0, Y1, Y2, Y3;
    and U24_Y0 (Y0, not_E1, not_E0); // Estado 00: Leyendo 
    and U24_Y1 (Y1, not_E1, E0);     // Estado 01: Error 
    and U24_Y2 (Y2, E1, not_E0);     // Estado 10: Abriendo 
    and U24_Y3 (Y3, E1, E0);         // Estado 11: Cerrando 
    

    // Segmento A
    assign a = Y0; 

    // Segmentos B y C
    wire not_Y2;
    not U_notY2(not_Y2, Y2);
    assign b = not_Y2; 
    assign c = not_Y2;

    // Segmento D
    assign d = Y2; 

    // Segmentos E y F
    assign e = 1'b0;
    assign f = 1'b0;

    // Segmento G
    wire or_Y0_Y3;
    or U_orG(or_Y0_Y3, Y0, Y3);
    assign g = or_Y0_Y3; 

endmodule