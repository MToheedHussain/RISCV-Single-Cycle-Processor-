`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2025 03:30:31 PM
// Design Name: 
// Module Name: mul_41
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


module mul_41(
input [31:0] a, b, c, d,
input [1:0] sel,
output reg [31:0] out
    );
     always @(*) begin
     case (sel) 
     2'b00 : out = a;
     2'b01 : out = b;
     2'b10 : out = c;
     default : out = 32'bx;
     endcase
     end
endmodule

