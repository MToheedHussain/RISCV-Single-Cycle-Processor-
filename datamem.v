`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 12:15:31 PM
// Design Name: 
// Module Name: datamem
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


module datamem
(
input [31:0] write_data_M, 
input [31:0] mem_addr, 
input clk, reset, write_en, read_en,
input [2:0] funct3,
output reg [31:0] read_data
);

reg [31:0] mem [0:1023];

always @(posedge clk) begin 
    if(reset) begin 
    mem[mem_addr] = 0;
    read_data = 0;
    end
    else if (write_en) begin
case (funct3)
3'b000 :  mem[mem_addr][7:0] <= write_data_M[7:0];
3'b001 : mem[mem_addr][15:0]  <= write_data_M[15:0];
3'b010 : mem[mem_addr] <=  write_data_M;
default : ;
endcase
  end
  
else if (read_en) begin
case (funct3) 
3'b000 : read_data <= {{24{mem[mem_addr][7]}},  mem[mem_addr][7:0]};
3'b001 : read_data <= {{16{mem[mem_addr][15]}}, mem[mem_addr][15:0]};  
3'b010 : read_data <=  mem[mem_addr]; 
3'b011 : read_data <= {24'b0, mem[mem_addr][7:0]};
3'b100 : read_data <= {16'b0, mem[mem_addr][15:0]};
default: read_data <=  32'b0;
endcase
end
end
endmodule
