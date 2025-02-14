`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 12:56:39 PM
// Design Name: 
// Module Name: testebench_alu
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


module testebench_alu();
reg [1:0] alu_op;
reg [2:0] funct3; reg [6:0] funct7;
wire [3:0] operation;
reg [31:0] operand1, operand2; 
wire [31:0] result;
wire Z;

alu_cntrl dut(.alu_op(alu_op), 
              .funct3(funct3),
              .funct7(funct7), 
              .operation(operation),
              .operand1(operand1),
              .operand2(operand2),
              .result(result), .Z(Z));
              
          initial begin 
             operand1 = 32'd50; operand2 = 32'd50;
             alu_op = 2'b00; funct7 = 7'bxxxxxxx; funct3 = 3'bxxx;  #10; //add for lw & sw instruction
             alu_op = 2'b01; funct7 = 7'bxxxxxxx; funct3 = 3'bxxx;  #10; //subtract(branch on equal)
             alu_op = 2'b10; funct7 = 7'b0000000; funct3 = 3'b000;  #10;//add
             alu_op = 2'b10; funct7 = 7'b0100000; funct3 = 3'b000;  #10;//R-type subtract 
             alu_op = 2'b10; funct7 = 7'b0000000; funct3 = 3'b111;  operand1 = 32'b1; operand2 = 32'b0; #10;//R-type AND 
             alu_op = 2'b10; funct7 = 7'b0000000; funct3 = 3'b110;  #10;//R-type OR 
             alu_op = 2'b10; funct7 = 7'b0000000; funct3 = 3'b010;  operand1 = 32'd100; operand2 = 32'd50; #10;
          
          end 
    
endmodule
