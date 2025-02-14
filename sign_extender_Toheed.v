module sign_extend
input [31:0]Instruction,
output reg [31:0]imm_data

);

wire [6:0] opcode = Instruction[6:0];  // Opcode extract from instruction

always@(*)
begin
case (opcode)
    7'b0000011: imm_data = {{20{Instruction[31]}}, Instruction[30:25], Instruction[24:20]};  // I-type instruction addi
	
    7'b0100011: imm_data = {{20{Instruction[31]}}, Instruction[30:25], Instruction[11:7]};  // s-type instruction  sw
	
    7'b1100011: imm_data = {{20{Instruction[31]}}, Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};  // sb-type instruction --branch
   
	7'b1101111: imm_data = {{11{Instruction[31]}}, Instruction[19:12], Instruction[20], Instruction[30:25], Instruction[24:20],1'b0};  // uj-type instruction jal
 
	7'b0110111: imm_data = {Instruction[31], Instruction[30:12], 12'b0};  // u-type instruction
endcase    
end

endmodule