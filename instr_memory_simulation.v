`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2025 12:24:49 PM
// Design Name: 
// Module Name: instr_memory_simulation
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


module instr_memory_simulation();

reg [31:0]inst_Addr;
reg reset;
wire [31:0]instruction;
   
   
   inst_memory dut(.inst_Addr(inst_Addr), .reset(reset), .instruction(instruction));
   
   initial 
   begin 
    #10 reset = 0;   
	#20 reset = 1;
	#20 inst_Addr = 32'd0;
	#20 inst_Addr = 32'd4;
	#20 inst_Addr = 32'd8;
    #20 inst_Addr = 32'd12;
    #20 inst_Addr = 32'd16;
    #20 inst_Addr = 32'd20;
    #20 inst_Addr = 32'd24;
    

   
   
   end
endmodule
