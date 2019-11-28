
`timescale 1ns/1ns
module DataPath (
	input clk, rst, 
	// from controller:
	input R, J, I, beq, bne, saveReg, saveMem, MemRead, MemToReg, addi, slti, subi,
	// to controller:
	output [5:0] opcode
);
	wire [31:0] pcIn, pcOut, pcIncOut, ins, mux1Out, WriteAddr, WriteData, ReadData1, ReadData2,
		extendOut, branchedPC, mux4Out, muxALUSrcOut, ALUop, ALUout, ReadDataMem, muxMemOrAluOut;
	// wire R, J, I, beq, bne, saveReg, saveMem, MemRead, MemToReg, addi, slti, subi;
	wire branch;
	wire zero;

	assign opcode = ins[31:26];


	pc #(32) PC(.clk(clk), .rst(rst), .in(pcIn), .out(pcOut));
	adder PCInc(.in0(32'd4), .in1(pcOut), .out(pcIncOut));
	IM im(.address(pcOut), .instruction(ins));

	// Controller cont(
	// 	.clk     (clk),
	// 	.rst     (rst),
	// 	.opcode  (ins[31:26]),
	// 	.R       (R),
	// 	.J       (J),
	// 	.I       (I),
	// 	.beq     (beq),
	// 	.bne     (bne),
	// 	.saveReg (saveReg),
	// 	.saveMem (saveMem),
	// 	.MemRead (MemRead),
	// 	.MemToReg(MemToReg),
	// 	.addi    (addi),
	// 	.slti    (slti),
	// 	.subi	 (subi)
	// 	);

	MUX #(32) mux1(.in0(ins[20:16]), .in1(ins[15:11]), .sel(R), .out(mux1Out));
	MUX #(32) mux2(.in0(mux1Out), .in1(5'd31), .sel(J), .out(WriteAddr));

	MUX #(32) mux3(.in0(muxMemOrAluOut), .in1(pcIncOut), .sel(J), .out(WriteData));

	RegisterFile RF(
		.clk      (clk),
	 	.rst      (rst),
	 	.WriteEn  (saveReg),
	 	.ReadAddr1(ins[25:21]),
	 	.ReadAddr2(ins[20:16]),
	 	.WriteAddr(WriteAddr),
	 	.WriteData(WriteData),
	 	.ReadData1(ReadData1),
	 	.ReadData2(ReadData2));

	extend signExtend(.in (ins[15:0]), .out (extendOut));

	adder branchedPCAdder(.in0(pcIncOut), .in1({extendOut[31:2], 2'b0}), .out(branchedPC));

	assign branch = (beq & zero) | (bne & ~zero);

	MUX #(32) mux4(.in0(pcIncOut), .in1(branchedPC), .sel(branch), .out(mux4Out));
	MUX #(32) mux5(.in0(mux4Out), .in1({pcOut[31:29], ins[25:0], 2'b0}), .sel(J), .out(pcIn));

	MUX #(32) muxALUSrc(.in0(ReadData2), .in1(extendOut), .sel(I), .out(muxALUSrcOut));

	ALU #(32) alu(
		.in0  (ReadData1),
		.in1  (muxALUSrcOut),
		.ALUop(ALUop),
		.out  (ALUout),
		.zero (zero));

	ALUController ALUCont(
		.func (ins[5:0]),
		.addi (addi),
		.subi (subi),
		.slti (slti),
		.ALUop(ALUop));

	DM DataMemory(
		.clk      (clk),
		.rst      (rst),
		.MemRead  (MemRead),
		.MemWrite (saveMem),
		.address  (ALUout),
		.WriteData(ReadData2),
		.ReadData (ReadDataMem));

	MUX #(32) muxMemOrAlu(.in0(ALUout), .in1(ReadDataMem), .sel(MemToReg), .out(muxMemOrAluOut));

endmodule
