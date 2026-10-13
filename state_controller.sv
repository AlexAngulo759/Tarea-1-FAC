module state_controller(
    input  logic BTN, 
    input  logic COMPLETE,     
    input  logic SW_CLOSED,
    input  logic SW_OPEN,
    input  logic DONE,
    input  logic CORRECT,
    input  logic CLK,        
    output logic OPENED_out,
    output logic E1,
    output logic E0,
    output logic OPENING,
    output logic CLOSING
);

    wire and_52, or_54;
    wire nor_33, nor_32, opened_internal;
    wire COMPLETE_internal;   
    
    // SR Latch
    nor U33 (opened_internal, SW_CLOSED, nor_32);
    nor U32 (nor_32, SW_OPEN, opened_internal);
    assign OPENED_out = opened_internal;
    
    // Lógica entrada
    and U52 (and_52, BTN, COMPLETE_internal);
    wire or_36;
    or U36 (or_36, SW_CLOSED, SW_OPEN);
    or U54 (or_54, and_52, or_36);
    
    // Generador de pulso
    wire ff1_q, not_ff1_q, edge_pulse;
    
    flipflop FF_edge1 (
        .CLK(CLK), 
        .EN(1'b1), 
        .D(or_54), 
        .Q(ff1_q)
    );
    
    not U_not_ff1 (not_ff1_q, ff1_q);
    and U_edge_and (edge_pulse, or_54, not_ff1_q); 
    
    wire S0, S1;
    wire not_S0, not_S1;
    wire nReset; 

    not U_nReset (nReset, edge_pulse);

    not U_not_S0 (not_S0, S0);
    dffe FF_count0 (
        .d(not_S0),
        .clk(DONE), 
        .ena(1'b1), 
        .clrn(nReset), 
        .prn(1'b1), 
        .q(S0)
    );

    wire clk_S1;
    not U_clk_S1 (clk_S1, S0); 
    not U_not_S1 (not_S1, S1);
    
    dffe FF_count1 (
        .d(not_S1),
        .clk(clk_S1), 
        .ena(1'b1), 
        .clrn(nReset), 
        .prn(1'b1), 
        .q(S1)
    );
    
    and U45 (COMPLETE_internal, S0, S1);
 
    and U46 (E1, CORRECT, COMPLETE_internal);
    
    wire not_correct_48;
    wire or_47;
    not U48 (not_correct_48, CORRECT);
    or U47 (or_47, not_correct_48, opened_internal);
    and U49 (E0, COMPLETE_internal, or_47);
    
    // OPENING
    wire not_opened_50;
    not U50 (not_opened_50, opened_internal);
    and U51 (OPENING, E1, not_opened_50);
    
    // CLOSING
    and U53 (CLOSING, E1, opened_internal);

endmodule