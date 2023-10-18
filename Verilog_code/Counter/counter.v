module counter(
	input 	clock,
	output 	[4:0] outputCount
);
	reg[4:0] count = 5'b00000;

	always @(posedge clock) begin
		if (count == 5'b11111) begin
			count = 5'b00000;
		end else begin
			count = count + 1'b1;
		end
	end
	
	assign outputCount = count;

endmodule
