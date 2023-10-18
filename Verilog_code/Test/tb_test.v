`timescale 1ps/1ps 
module tb_test; 
 
	reg clk; 
  
 	initial begin   
		clk = 0;
    		repeat(32) begin
			#10
			clk = ~clk;
		end
 	end 
endmodule 