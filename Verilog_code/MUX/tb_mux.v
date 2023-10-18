module tb_mux;

	reg[10:0] in = 11'b0;
	reg [16:0] clock = 17'b0;
	wire out;
	
	mux test_mux(in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0], out);
	
	initial begin
		$display("clock,D0,D1,D2,D3,D4,D5,D6,D7,S0,S1,S2,out");
		repeat(100000) begin
			#10
			$display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", clock, in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0], out);
			if (in == 2047) begin
				in = 0;
			end else begin
				in = in + 1;
			end
			clock = clock + 1;
		end
	end
endmodule

