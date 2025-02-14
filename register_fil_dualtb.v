`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 09:29:18 PM
// Design Name: 
// Module Name: register_fil_dualtb
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


module register_fil_dualtb();
          reg clk;
          reg WE3;
          reg [4:0] A3, A1, A2;
          reg [31:0] WD1;
          wire [31:0] RD1, RD2;    
   
    registerfil_dual dut
    (
    .clk(clk), .WE3(WE3),
     .A3(A3),  //write address port 1 & 2
     .A1(A1), .A2(A2), //read address port 1 & 2
     .WD1(WD1), //data write port 1
     .RD1(RD1), .RD2(RD2)
    );
   integer i;
    initial clk = 0;
    always  #5 begin clk = ~clk; end
    
    initial 
    begin 
     WE3 = 1'b0; #5 WE3 = 1'b1;
   //port1
    #10  A3 = 3'b000; WD1 = 8'b1010_1100;
    #10  A3 = 3'b001; WD1 = 8'b1111_0000;
    #10  A3 = 3'b010; WD1 = 8'b0000_1111;
    #10  A3 = 3'b011; WD1 = 8'b1100_0011;

  
  // Note that ++ operator does not exist in Verilog !
            for ( i = 0; i < 8; i = i + 1) begin
                #10 A1 = i;
            end
            
            for ( i = 0; i < 8; i = i + 1) begin
                           #10 A2 = i;
            end
                        
//     #10  r_addr = 2'b00;  
//     #10  r_addr = 2'b01;  
//     #10  r_addr = 2'b10;  
//     #10  r_addr = 2'b11;      
    end   
endmodule
