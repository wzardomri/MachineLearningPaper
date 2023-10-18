module tb_alu;
	//Inputs
	reg[4:0] A,B;
	reg[3:0] sel;

	//Outputs
	wire[4:0] out;
	wire carry;
	
	// Verilog code for ALU
	alu test_unit(A, B, sel, out, carry);
	
	reg[17:0] clock;

	initial begin
	$display("clock,A[4],A[3],A[2],A[1],A[0],B[4],B[3],B[2],B[1],B[0],sel[3],sel[2],sel[1],sel[0],out[4],out[3],out[2],out[1],out[0],carry");
		clock = 0;
		repeat(10) begin
			sel = 0;
			repeat (16) begin //change sel
				A = 0;
				repeat (32) begin //change A 
					B = 0;
					repeat (32) begin // change B
						#10
						$display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", clock,A[4],A[3],A[2],A[1],A[0],B[4],B[3],B[2],B[1],B[0],sel[3],sel[2],sel[1],sel[0],out[4],out[3],out[2],out[1],out[0],carry);
						B = B + 1;
						clock = clock + 1;
					end
					A = A + 1;
				end
				sel = sel + 1;
			end
		end
    end
endmodule