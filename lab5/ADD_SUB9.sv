module ADD_SUB9 
( 
	input  [7:0] A, B,
	input  fn,
	output [8:0] SS 
);
	logic c0,c1,c2,c3,c4,c5,c6,c7; //internal carries in the 8-bit adder
	logic [7:0] BB; //internal B or NOT(B)
	logic A9, BB9; //internal sign extension bits
	assign BB = (B ^ {8{fn}}); // when fn=1, complement B
	assign A9 = A[7]; 
	assign BB9 = BB[7]; // Sign extension bits
// copied from sign-bits
	full_adder FA0(.x(A[0]), .y(BB[0]), .z(fn), .s(SS[0]), .c(c0));
	full_adder FA1(.x(A[1]), .y(BB[1]), .z(c0), .s(SS[1]), .c(c1));
	full_adder FA2(.x(A[2]), .y(BB[2]), .z(c1), .s(SS[2]), .c(c2));
	full_adder FA3(.x(A[3]), .y(BB[3]), .z(c2), .s(SS[3]), .c(c3));
	full_adder FA4(.x(A[4]), .y(BB[4]), .z(c3), .s(SS[4]), .c(c4));
	full_adder FA5(.x(A[5]), .y(BB[5]), .z(c4), .s(SS[5]), .c(c5));
	full_adder FA6(.x(A[6]), .y(BB[6]), .z(c5), .s(SS[6]), .c(c6));
	full_adder FA7(.x(A[7]), .y(BB[7]), .z(c6), .s(SS[7]), .c(c7));
	full_adder FA8(.x(A9), .y(BB9), .z(c7), .s (SS[8]), .c());
endmodule

module full_adder//This is a full-adder of one bit.
(
	  input x, y, z,
	  output logic s, c
);
	
	  assign s = x^y^z;
	  assign c = (x&y)|(y&z)|(x&z);
	
endmodule
