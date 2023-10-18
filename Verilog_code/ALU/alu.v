/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 if A>B else 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 if A=B else 0;
----------------------------------------------------------------------*/

module alu(
           input [4:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [4:0] ALU_Out, // ALU 8-bit Output
           output CarryOut 	// Carry Out Flag
    );
	
    reg [4:0] ALU_Result;
	
	reg tmp;
	
    always @(*) begin
			tmp = 1'b0;
			if (ALU_Sel == 4'b0000) begin// Addition
				if (A[4] == 1'b1 && B[4] == 1'b1)  begin
					tmp = 1'b1;
				end
			   ALU_Result = A + B ; 
			end else if (ALU_Sel == 4'b0001) begin// Subtraction
			   ALU_Result = A - B ;
			end else if (ALU_Sel == 4'b0010) begin// Multiplication
				if (A * B > 31)  begin
					 tmp = 1'b1;
				end
			   ALU_Result = A * B;
			end else if (ALU_Sel == 4'b0011) begin // Division
			   ALU_Result = A/B;
			end else if (ALU_Sel == 4'b0100) begin //Logical shift left
				if(A[4] ==  1) begin
					tmp = 1'b1;	
				end
				ALU_Result = A<<1;
			end else if (ALU_Sel == 4'b0101) begin // Logical shift right
			   ALU_Result = A>>1;
			end else if (ALU_Sel == 4'b0110) begin // Rotate left
			   ALU_Result = {A[3:0],A[4]};
			end else if (ALU_Sel == 4'b0111) begin // Rotate right
			   ALU_Result = {A[0],A[4:1]};
			end else if (ALU_Sel == 4'b1000) begin //  Logical and 
			   ALU_Result = A & B;
			end else if (ALU_Sel == 4'b1001) begin //  Logical or
			   ALU_Result = A | B;
			end else if (ALU_Sel == 4'b1010) begin //  Logical xor 
			   ALU_Result = A ^ B;
			end else if (ALU_Sel == 4'b1011) begin //  Logical nor
			   ALU_Result = ~(A | B);
			end else if (ALU_Sel == 4'b1100) begin // Logical nand 
			   ALU_Result = ~(A & B);
			end else if (ALU_Sel == 4'b1101) begin // Logical xnor
			   ALU_Result = ~(A ^ B);
			end else if (ALU_Sel == 4'b1110) begin // Greater comparison
			   ALU_Result = (A>B)?5'd1:5'd0;
			end else if (ALU_Sel == 4'b1111) begin // Equal comparison   
				ALU_Result = (A== B)?5'd1:5'd0 ;
			end else begin
				ALU_Result = A + B ; 
			end
    end
	
	assign ALU_Out = ALU_Result; // ALU out
	assign CarryOut = tmp;
	
endmodule