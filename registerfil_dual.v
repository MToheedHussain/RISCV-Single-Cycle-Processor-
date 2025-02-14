`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 09:26:30 PM
// Design Name: 
// Module Name: registerfil_dual
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


module registerfil_dual

    (
        input wire clk,
        input wire WE3,
        input wire [4:0] A1, A2, A3, //A1(addressport1), A2(addressport2), A3(writeport1)
        input wire [31:0] WD1, 
        output wire[31:0] RD1, RD2
    );
    
    reg [31:0] array_reg [2**5-1:0];    //32 columns, 32 rows
    
    always @(posedge clk)
    begin 
    
        if (WE3) 
            begin
            
            array_reg[A3] <= WD1;
            
                    
            end
    end
            
   assign RD1 = array_reg[A1];
   assign RD2 = array_reg[A2];
endmodule

