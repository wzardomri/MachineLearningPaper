`timescale 1ps/1ps
module tb_DFF();

reg[2:0] in;
reg Q_next;
reg Q;

reg [16:0] internal_count;
			 
initial begin
	$display ("time,clk,rising_edge,D,Q,Q+");
	in = 0;
	internal_count = 0;
	Q_next = 0;
	Q = 0;
	repeat (100000) begin
		#10
		if (in[1] == 1) begin
			Q_next = in[0];
		end else begin
			Q_next = Q_next;
		end
		
		$display ("%d,%d,%d,%d,%d,%d",internal_count, in[2], in[1],in[0], Q, Q_next);
		
		Q = Q_next;
		
		if (in == 1) begin
			in = 4;
		end else begin
			in = in + 1;
		end
		internal_count = internal_count + 1; 
	end
end
	
endmodule
