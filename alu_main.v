`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 12:05:34 PM
// Design Name: 
// Module Name: alu_main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_main(
input [31:0] operand1, operand2, 
input [3:0] operation,
output reg [31:0] result, 
output reg Z
    );
    
    always @(*) begin 
    case (operation)
    4'b0000 : result = operand1 & operand2; 
    4'b0001 : result = operand1 | operand2;
    4'b0010 : result = operand1 + operand2;
    4'b0110 : result = operand1 - operand2; 
    4'b0111 : result = operand1 - operand2;
    default : result = 32'bx;
    endcase
	
	if (result == 0) 
	Z = 1;
	else 
	Z = 0;
    end
  
endmodule
