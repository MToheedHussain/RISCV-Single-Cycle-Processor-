`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 11:52:44 AM
// Design Name: 
// Module Name: controlunit
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


module controlunit

    (
input [6:0]opcode,
output reg branch, 
           memRead,
           memtoReg,
           memWrite,
           ALUsrc,
           regWrite,
output reg [1:0]ALUop
    );
    
    always @(*) begin 
    case (opcode)
    7'd51 : begin branch = 1'b0;  memRead = 1'b0; memtoReg = 1'b0; memWrite = 1'b0; ALUsrc = 1'b0; regWrite = 1'b1; ALUop = 2'b10; end//R type instruction
    7'd19 : begin branch = 1'b0;  memRead = 1'b0; memtoReg = 1'b0; memWrite = 1'b0; ALUsrc = 1'b1; regWrite = 1'b1; ALUop = 2'b10; end//I type ALU 
    7'd3  : begin branch = 1'b0;  memRead = 1'b1; memtoReg = 1'b1; memWrite = 1'b0; ALUsrc = 1'b1; regWrite = 1'b1; ALUop = 2'b00; end //lw
    7'd35 : begin branch = 1'b0;  memRead = 1'b0; memtoReg = 1'bx; memWrite = 1'b1; ALUsrc = 1'b1; regWrite = 1'b0; ALUop = 2'b00; end  //sw
    7'd99 : begin branch = 1'b1;  memRead = 1'b0; memtoReg = 1'bx; memWrite = 1'b0; ALUsrc = 1'b0; regWrite = 1'b0; ALUop = 2'b01; end //beq
    
    endcase
    end
endmodule
