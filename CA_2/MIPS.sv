
`timescale 1ns/1ns
module MIPS (input clk, rst);
	
	wire R, J, I, beq, bne, saveReg, saveMem, MemRead, MemToReg, addi, slti, subi;
	wire [5:0] opcode;

	DataPath DP(
		.clk     (clk),
		.rst     (rst),
		.R       (R),
		.J       (J),
		.I       (I),
		.beq     (beq),
		.bne     (bne),
		.saveReg (saveReg),
		.saveMem (saveMem),
		.MemRead (MemRead),
		.MemToReg(MemToReg),
		.addi    (addi),
		.slti    (slti),
		.subi	 (subi),
		.opcode  (opcode)
	);

	Controller CU(
		.clk     (clk),
		.rst     (rst),
		.opcode  (opcode),
		.R       (R),
		.J       (J),
		.I       (I),
		.beq     (beq),
		.bne     (bne),
		.saveReg (saveReg),
		.saveMem (saveMem),
		.MemRead (MemRead),
		.MemToReg(MemToReg),
		.addi    (addi),
		.slti    (slti),
		.subi	 (subi)
		);
endmodule
