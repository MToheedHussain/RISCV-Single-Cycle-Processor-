`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 11:51:14 AM
// Design Name: 
// Module Name: instr_memory
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


module inst_memory(
input [31:0]inst_Addr,
input reset,
output wire [31:0]instruction
);

reg [7:0] array_reg [0:31];


assign instruction = {array_reg[inst_Addr+3], array_reg[inst_Addr+2], array_reg[inst_Addr+1], array_reg[inst_Addr]};

   always @(reset)
   begin
       if(reset == 1)
       begin
              //0x00940333 
              array_reg[3] = 8'h00;
              array_reg[2] = 8'h94;
              array_reg[1] = 8'h03;
              array_reg[0] = 8'h33;
              // 0x413903b3
              array_reg[7] = 8'h41;
              array_reg[6] = 8'h39;
              array_reg[5] = 8'h03;
              array_reg[4] = 8'hb3;
              //  0x035a02b3
              array_reg[11] = 8'h03;
              array_reg[10] = 8'h5a;
              array_reg[9] =  8'h02;
              array_reg[8] =  8'hb3;
              //0x017b4e33
              array_reg[15] = 8'h01;
              array_reg[14] = 8'h7b;
              array_reg[13] = 8'h4e;
              array_reg[12] = 8'h33;
              // 
              array_reg[19] = 8'h01;
              array_reg[18] = 8'h9c;
              array_reg[17] = 8'h1e;
              array_reg[16] = 8'hb3;
              // 
              array_reg[23] = 8'h01;
              array_reg[22] = 8'hbd;
              array_reg[21] = 8'h5f;
              array_reg[20] = 8'h33;
              // 
              array_reg[27] = 8'h00;
              array_reg[26] = 8'hd6;
              array_reg[25] = 8'h7f;
              array_reg[24] = 8'hb3;
              // 
              array_reg[31] = 8'h00;
              array_reg[30] = 8'hf7;
              array_reg[29] = 8'h68;
              array_reg[28] = 8'hb3;
       end
   end
endmodule


