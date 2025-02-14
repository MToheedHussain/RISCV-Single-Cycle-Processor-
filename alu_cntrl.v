`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 11:29:34 AM
// Design Name: 
// Module Name: alu_cntrl
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


module alu_cntrl(
input [1:0] alu_op,
input [2:0] funct3, input [6:0] funct7,
output reg [3:0] operation,
input [31:0] operand1, operand2, output [31:0] result,
output Z
    );
    always @(*) begin 
   case ({alu_op, funct7, funct3})
   12'b00_xxxxxxx_xxx : operation = 4'b0010; //add for lw & sw instruction
   12'b01_xxxxxxx_xxx : operation = 4'b0110; //subtract(branch on equal)
   12'b10_0000000_000 : operation = 4'b0010; //add
   12'b10_0100000_000 : operation = 4'b0110; //R-type subtract 
   12'b10_0000000_111 : operation = 4'b0000; //R-type AND 
   12'b10_0000000_110 : operation = 4'b0001; //R-type OR 
   12'b10_0000000_010 : operation = 4'b0111; //R-type subtract(set less than)
   default : operation = 4'bxxxx;
   endcase
   end
  
  alu_main dut(.operand1(operand1), .operand2(operand2), 
               .operation(operation),
               .result(result), .Z(Z));
     
endmodule


