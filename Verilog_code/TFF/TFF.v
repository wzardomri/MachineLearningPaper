module TFF (input T, clk, rising_edge, output reg Q);

	reg tmp;
	always @(*) begin
		if(rising_edge == 1) begin
			if (T == 1) begin	
				Q <= ~Q;
			end else begin
				Q <= Q;
			end
		end
	end
endmodule