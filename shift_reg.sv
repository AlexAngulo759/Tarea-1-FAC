module shift_reg(
	input  logic CLK, EN, IN,
	output logic [1:9] Q
);

	flipflop FF1 (.CLK(CLK), .EN(EN), .D(IN),  .Q(Q[1]));
	flipflop FF2 (.CLK(CLK), .EN(EN), .D(Q[1]),  .Q(Q[2]));
	flipflop FF3 (.CLK(CLK), .EN(EN), .D(Q[2]),  .Q(Q[3]));
	flipflop FF4 (.CLK(CLK), .EN(EN), .D(Q[3]),  .Q(Q[4]));
	flipflop FF5 (.CLK(CLK), .EN(EN), .D(Q[4]),  .Q(Q[5]));
	flipflop FF6 (.CLK(CLK), .EN(EN), .D(Q[5]),  .Q(Q[6]));
	flipflop FF7 (.CLK(CLK), .EN(EN), .D(Q[6]),  .Q(Q[7]));
	flipflop FF8 (.CLK(CLK), .EN(EN), .D(Q[7]),  .Q(Q[8]));
	flipflop FF9 (.CLK(CLK), .EN(EN), .D(Q[8]),  .Q(Q[9]));
	
endmodule