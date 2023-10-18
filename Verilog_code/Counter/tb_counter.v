`timescale 1ps/1ps
module tb_counter();


reg[4:0] count_next;
reg[4:0] count;
reg[16:0] internal_count;
reg[1:0] clk_stuff;

initial begin 
	$display("time,clk,rising_edge,count[4],count[3],count[2],count[1],count[0],count,count_next");
	count = 0;
	internal_count = 0;
	clk_stuff = 0;
	repeat (100000) begin
		#10
		if (clk_stuff[0] == 1) begin
			count_next = count_next + 1;
		end else begin
			count_next = count;
		end
		
		$display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d",internal_count,clk_stuff[1],clk_stuff[0],count[4],count[3],count[2],count[1],count[0],count,count_next);
		
		if (clk_stuff == 0) begin
			clk_stuff = 2;
		end else begin
			clk_stuff = clk_stuff + 1;
		end
		count = count_next;
		internal_count = internal_count + 1; 
	end
end
endmodule
