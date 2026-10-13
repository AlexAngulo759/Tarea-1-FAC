`default_nettype none

module top(
    input  wire CLOCK_50,    
    input  wire [3:0] KEY,   
    input  wire [9:0] SW,    
    output wire [9:0] LEDR,  
    output wire [6:0] HEX0   
);

    wire slow_clk;
    clock_divider U_CLOCK (
        .CLK_50(CLOCK_50),
        .CLK_OUT(slow_clk)
    );

    wire S1 = SW[0];
    wire S2 = SW[1];
    wire S3 = SW[2];
    wire S4 = SW[3];
    wire BTN = ~KEY[0]; 
    wire SW_CLOSED = SW[8]; 
    wire SW_OPEN   = SW[9]; 

    wire B0_out, B1_out, B2_out;
    wire INVALID_out, CORRECT_out;
    wire OPENED_out, E1_out, E0_out, OPENING_out, CLOSING_out;

    assign LEDR[0] = OPENING_out;
    assign LEDR[1] = CLOSING_out;
    assign LEDR[9] = INVALID_out; 

    encoder U_ENCODER (
        .S1(S1), .S2(S2), .S3(S3), .S4(S4),
        .B0(B0_out), .B1(B1_out), .B2(B2_out)
    );

    verifier U_VERIFIER (
        .S1(S1), .S2(S2), .S3(S3), .S4(S4),
        .invalid(INVALID_out)
    );

    serializer U_SERIALIZER (
        .B0(B0_out), .B1(B1_out), .B2(B2_out),
        .CLK(BTN),
        .Q0(E0_out), 
        .Q1(E1_out), 
        .INVALID(INVALID_out),
        .OPEN(OPENED_out), 
        .CORRECT(CORRECT_out)
    );

    state_controller U_STATE_CTRL (
        .BTN(BTN), 
        .COMPLETE(1'b0), 
        .SW_CLOSED(SW_CLOSED),
        .SW_OPEN(SW_OPEN),
        .DONE(BTN), 
        .CORRECT(CORRECT_out),
        .CLK(CLOCK_50),  
        .OPENED_out(OPENED_out),
        .E1(E1_out),
        .E0(E0_out),
        .OPENING(OPENING_out),
        .CLOSING(CLOSING_out)
    );

    wire a_out, b_out, c_out, d_out, e_out, f_out, g_out;

    announcement_decoder U_ANN_DEC (
        .E0(E0_out), .E1(E1_out),
        .a(HEX0[0]), .b(HEX0[1]), .c(HEX0[2]), .d(HEX0[3]), 
        .e(HEX0[4]), .f(HEX0[5]), .g(HEX0[6])
    );

endmodule