`timescale 1ps/1ps
module tb_c17();

wire N22test;
wire N23test;
reg[4:0] in;
reg[17:0] clock;
c17 c17_test(.N1(in[4]), .N2(in[3]), .N3(in[2]), .N6(in[1]), .N7(in[0]), .N22(N22test), .N23(N23test));

initial begin 
	$display("clock,in1,in2,in3,in4,in5,output1,output2");
	in = 0;
	clock = 0;
	
	repeat (70000) begin
		#10
		$display("%d,%d,%d,%d,%d,%d,%d, %d", clock, in[4], in[3], in[2], in[1], in[0], N22test, N23test);	
		
		if (in == 31) 
			in = 0;
		else 
			in = in + 1;
		
		clock = clock + 1;
		
	end
end
endmodule
