module nine_bit_adder
(
    input logic[8:0] A, B,
	 input logic C_in,
    output logic[7:0] Sum,
    output logic X
);

    logic c1;
    logic c2;
    logic c3;
    logic c4;
    logic c5;
    logic c6;
    logic c7;
    logic c8;
	 logic c9;

	full_adder FullAdder0(.a(A[0]), .b(B[0]), .c_in(C_in), .sum(Sum[0]), .c_out(c1));
	full_adder FullAdder1(.a(A[1]), .b(B[1]), .c_in(c1), .sum(Sum[1]), .c_out(c2));
	full_adder FullAdder2(.a(A[2]), .b(B[2]), .c_in(c2), .sum(Sum[2]), .c_out(c3));
	full_adder FullAdder3(.a(A[3]), .b(B[3]), .c_in(c3), .sum(Sum[3]), .c_out(c4));
   full_adder FullAdder4(.a(A[4]), .b(B[4]), .c_in(c4), .sum(Sum[4]), .c_out(c5));
	full_adder FullAdder5(.a(A[5]), .b(B[5]), .c_in(c5), .sum(Sum[5]), .c_out(c6));
	full_adder FullAdder6(.a(A[6]), .b(B[6]), .c_in(c6), .sum(Sum[6]), .c_out(c7));
	full_adder FullAdder7(.a(A[7]), .b(B[7]), .c_in(c7), .sum(Sum[7]), .c_out(c8));
   full_adder FullAdder8(.a(A[8]), .b(B[8]), .c_in(c8), .sum(X), .c_out(c9));


endmodule


module full_adder(input logic a, b, c_in, 
				    output logic  sum, c_out);

	always_comb
	begin
		sum = a ^ b ^ c_in;
		c_out = (a & b) | (b & c_in) | (a & c_in);
	end
endmodule
