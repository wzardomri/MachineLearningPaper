`timescale 1ps/1ps
module tb_j24();

wire Xtest;
wire Ytest;
wire Ztest;
reg [15:0] in;
reg [17:0] clock;
j24 j24_test(.A(in[15]), .B(in[14]), .C(in[13]), .D(in[12]), .E(in[11]), .F(in[10]), .G(in[9]), .H(in[8]), 
			 .I(in[7]), .J(in[6]), .K(in[5]), .L(in[4]), .M(in[3]), .N(in[2]), .O(in[1]), .P(in[0]), .Z(Ztest)); 
			 
initial begin
	$display ("clock,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Z");
	in = 0;
	clock = 0;
	
	repeat (131072) begin
		#10
		$display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", clock, in[15], in[14], in[13], in[12], in[11], in[10], in[9],
				in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0], Ztest);
			
		if (in == 65535) begin
			in = 0;
		end else begin
			in = in + 1;
		end
		
		clock = clock + 1;
	end
end

endmodule


