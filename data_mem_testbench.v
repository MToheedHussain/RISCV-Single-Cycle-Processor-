`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2025 02:39:25 PM
// Design Name: 
// Module Name: data_mem_testbench
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


module data_mem_testbench();
reg [31:0] write_data_M;
reg [31:0] mem_addr;
reg clk, reset, write_en, read_en;
reg [2:0] funct3;
wire [31:0] read_data;

    
    
    datamem dut(.write_data_M(write_data_M),
                .mem_addr(mem_addr),
                .funct3(funct3),
                .read_data(read_data),
                .clk(clk), .reset(reset),
                .write_en(write_en),
                .read_en(read_en));
                
    initial clk = 1'b0;
    always #5 clk = ~clk; 
    integer i;
    initial begin 
    funct3 = 3'b000;
    reset = 1;  read_en = 0; write_en = 0; #10;
    reset = 0;  #10;
    
    for (i = 0; i<=128; i = i+1) begin 
    write_en <= 1'b1; 
    mem_addr <= i; write_data_M = i; #10;
    end
    
    write_en = 0; #20
    
    for (i = 0; i<=128; i = i+1) begin 
    
        read_en <= 1'b1;
        mem_addr <= i; #10;
    end
    read_en <= 1'b0;
    end
endmodule
