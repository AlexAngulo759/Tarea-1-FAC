module serializer(
    input  logic B0, B1, B2, 
    input  logic CLK,        
    input  logic Q0, Q1,     
    input  logic INVALID,    
    input  logic OPEN,       
    output logic CORRECT     
);

    wire edge_clk;
    wire ff1_q, ff1_nq;
    
    flipflop FF_edge (
        .CLK(CLK), 
        .EN(1'b1), 
        .D(1'b1), 
        .Q(ff1_q)
    );
    not (ff1_nq, ff1_q);
    and (edge_clk, CLK, ff1_nq);
    
    wire [1:9] sr_out;
    
    flipflop FF1 (.CLK(CLK), .EN(1'b1), .D(B0), .Q(sr_out[1]));
    flipflop FF2 (.CLK(CLK), .EN(1'b1), .D(B1), .Q(sr_out[2]));
    flipflop FF3 (.CLK(CLK), .EN(1'b1), .D(B2), .Q(sr_out[3]));
    
    flipflop FF4 (.CLK(CLK), .EN(1'b1), .D(sr_out[1]), .Q(sr_out[4]));
    flipflop FF5 (.CLK(CLK), .EN(1'b1), .D(sr_out[2]), .Q(sr_out[5]));
    flipflop FF6 (.CLK(CLK), .EN(1'b1), .D(sr_out[3]), .Q(sr_out[6]));
    
    flipflop FF7 (.CLK(CLK), .EN(1'b1), .D(sr_out[4]), .Q(sr_out[7]));
    flipflop FF8 (.CLK(CLK), .EN(1'b1), .D(sr_out[5]), .Q(sr_out[8]));
    flipflop FF9 (.CLK(CLK), .EN(1'b1), .D(sr_out[6]), .Q(sr_out[9]));

    wire R7 = sr_out[1];
    wire R8 = sr_out[2];
    wire R9 = sr_out[3];
    wire R4 = sr_out[4];
    wire R5 = sr_out[5];
    wire R6 = sr_out[6];
    wire R3 = sr_out[7];
    wire R2 = sr_out[8];
    wire R1 = sr_out[9];

    psw_checker CCT005 (
        .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), 
        .R6(R6), .R7(R7), .R8(R8), .R9(R9), 
        .OPEN(OPEN),
        .CORRECT(CORRECT)
    );

endmodule