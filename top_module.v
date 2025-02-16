`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MTOHEEDHUSSAIN
// 
// Create Date: 02/14/2025 11:29:51 AM
// Design Name: 
// Module Name: top_module
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


module top_module(
input clk, 
input reset
    );
    wire branch, zero, jump;
    wire ALUsrc;
           
      
    wire [31:0] immEXT;
    wire [31:0] src_a; 
    wire [31:0] src_b;
    
    wire [1:0] alu_op;
    // wire [2:0] funct3 = instruction[14:12];
    // wire [6:0] funct7 = instruction[31:25];
    wire [3:0] operation;
    wire [31:0] instruction;
    wire regWrite; 
    wire [31:0] inst_Addr;
    wire memRead, memWrite; //data memory read/write control 
    wire [31:0] readData; //for data memory read port
    wire [31:0] result4_1;
    wire [1:0] memtoReg, immSRC;
    wire [31:0] PCplus4, PCtarget,PCout;
    wire [31:0] result;
   // wire [31:0];
   wire [31:0] RD2;
   
mul2_1 MULTIPLEXER2_1(.a(immEXT), 
                      .b(RD2),
                      .sel(ALUsrc),
                      .out(src_b));
                       
mul_41 MULTIPLEXER4_1(.a(result), 
                       .b(readData),
                       .c(PCplus4), //enhanced path for jump instruction
                       .d(),
                       .sel(memtoReg),
                       .out(result4_1));
                       
datamem DATA_MEMORY(.write_data_M(RD2), //datawrite 32bit 
                    .mem_addr(result), //read/write address 32bits 
                    .clk(clk), 
                    .reset(reset),
                    .write_en(memWrite), .read_en(memRead), 
                    .funct3(instruction[14:12]),
                    .read_data(readData)); //32bit
                    
sign_extend SIGN_EXTENDER(.instruction(instruction[31:7]),
                           .immSRC(immSRC),
                           .imm_data(immEXT));  
                          
programcounter PROGRAMCOUNTER( 
                            .clk(clk), .reset(reset),
                            .branch(branch), .zero(zero), .jump(jump),
                            .PCtarget(PCtarget),
                            .PCNext(),
                            .PCplus4(PCplus4),
                            .PCout(PCout));
                            
adder PCtarget_OUTPUT(.i1(immEXT),
                      .i2(PCout), 
                      .sum(PCtarget));

inst_memory INSTRUCTION_MEMORY(
                                 .inst_Addr(PCout),
                                 .reset(reset),
                                 .instruction(instruction));
                                 
     
controlunit CONTROL_UNIT(.opcode(instruction[6:0]),
                         .branch(branch), 
                         .jump(jump),
                         .memRead(memRead),
                         .memtoReg(memtoReg),
                         .memWrite(memWrite),
                         .ALUsrc(ALUsrc),
                         .regWrite(regWrite),
                         .ALUop(alu_op),
                         .immSRC(immSRC));
                         
registerfil_dual REG_FILE (
                         .clk(clk),
                         .WE3(regWrite),
                         .A1(instruction[19:15]), .A2(instruction[24:20]), .A3(instruction[11:7]), //A1(addressport1), A2(addressport2), A3(writeport1)
                         .WD3(result4_1), 
                         .RD1(src_a), //ReadPORT1
                         .RD2(RD2));  //ReadPORT2    
                   
alu_cntrl    ALU_CONTROL(.alu_op(alu_op),
                         .funct3(instruction[14:12]), 
                         .funct7(instruction[31:25]),
                         .operation(operation));
                          
                       
alu_main        ALU_MAIN(.operand1(src_a), 
                         .operand2(src_b), 
                         .operation(operation),
                         .result(result), 
                         .zero(zero));                                         
    endmodule
