module tb_demux;

	reg[3:0] in = 4'b0;
	reg [16:0] clock = 17'b0;
	wire out1, out2, out3, out4, out5, out6, out7, out8;
	
	demux test_mux(in[3], in[2], in[1], in[0], out1, out2, out3, out4, out5, out6, out7, out8);
	
	initial begin
		$display("clock,D0,S0,S1,S2,out1,out2,out3,out4,out5,out6,out7,out8");
		repeat(100000) begin
			#10
			$display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", clock, in[3], in[2], in[1], in[0], out1, out2, out3, out4, out5, out6, out7, out8);
			if (in == 15) begin
				in = 0;
			end else begin
				in = in + 1;
			end
			clock = clock + 1;
		end
	end
endmodule