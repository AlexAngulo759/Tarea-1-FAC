module flipflop (
    input  logic CLK,
    input  logic EN,
    input  logic D,
    output logic Q
);

    dffe FF (
        .d(D),
        .clk(CLK),
        .ena(EN),
        .clrn(1'b1),
        .prn(1'b1),
        .q(Q)
    );
	 
endmodule