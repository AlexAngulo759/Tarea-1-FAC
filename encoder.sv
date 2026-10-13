module encoder(
    input  logic S1, S2, S3, S4,
    output logic B0, B1, B2
);

    assign B0 = S1 | S3;
    assign B1 = S2 | S3;
    assign B2 = S4;

endmodule