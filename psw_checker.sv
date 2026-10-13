module psw_checker(
    input  logic R1, R2, R3, R4, R5, R6, R7, R8, R9, 
    input  logic OPEN,
    output logic CORRECT 
);

    wire not_R1, not_R3, not_R4, not_R5, not_R9;
    
    not U_inv_R1 (not_R1, R1);
    not U_inv_R3 (not_R3, R3);
    not U_inv_R4 (not_R4, R4);
    not U_inv_R5 (not_R5, R5);
    not U_inv_R9 (not_R9, R9);
    
    wire digito1, digito2, digito3;
    wire and_d1_temp, and_d2_temp, and_d3_temp;
    wire xnor_R8_OPEN;

    and U_d1_1 (and_d1_temp, not_R1, R2);
    and U_d1_final (digito1, and_d1_temp, not_R3);

    and U_d2_1 (and_d2_temp, not_R4, not_R5);
    and U_d2_final (digito2, and_d2_temp, R6);

    xnor U_R8_OPEN (xnor_R8_OPEN, R8, OPEN);
    
    and U_d3_1 (and_d3_temp, R7, not_R9);
    and U_d3_final (digito3, and_d3_temp, xnor_R8_OPEN);

    wire check_d1_d2;
    and U_check_12 (check_d1_d2, digito1, digito2);
    and U_final (CORRECT, check_d1_d2, digito3);

endmodule