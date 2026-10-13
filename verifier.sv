module verifier(
	input  logic S1, S2, S3, S4,
	output logic invalid
);

	logic nS2, nS3, nS4, t1, t2, t3, t4, t5;

	not U7 (nS2, S2);
	or U10 (t1, S1, nS2);
	
	not U8 (nS3, S3);
	or U11 (t2, S2, nS3);
	
	not U9 (nS4, S4);
	or U12 (t3, S3, nS4);
	
	and U13 (t4, t1, t2);
	and U14 (t5, t4, t3);
	
	not U17 (invalid, t5);

endmodule