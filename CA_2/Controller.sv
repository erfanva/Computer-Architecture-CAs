
`timescale 1ns/1ns
module Controller (
	input clk, rst, input [5:0] opcode, output reg R, J, I, beq, bne, saveReg, saveMem, MemRead, MemToReg, addi, slti, subi
);
	always@(opcode) begin 
		{R, J, I, beq, bne, saveReg, saveMem, MemRead, MemToReg, addi, slti, subi} <= 12'b0;
		case (opcode)
			6'b000000: begin //add sub and or slt jr mfhi mflo 
				R <= 1'b1;
				saveReg <= 1'b1;
			end
			6'b000001: begin //addi
				I <= 1'b1;
				saveReg <= 1'b1;
				addi <= 1'b1;
			end
			6'b000010: begin //slti
				I <= 1'b1;
				saveReg <= 1'b1;
				slti <= 1'b1;
			end
			6'b000011: begin //lw
				I <= 1'b1;
				saveReg <= 1'b1;
				MemRead <= 1'b1;
				MemToReg <= 1'b1;
				addi <= 1'b1;
			end
			6'b000100: begin //sw
				I <= 1'b1;
				saveMem <= 1'b1;
				addi <= 1'b1;
			end
			6'b000101: begin // beq
				I <= 1'b1;
				beq <= 1'b1;
				subi <= 1'b1;
			end
			6'b000110: begin // bne
				I <= 1'b1;
				bne <= 1'b1;
				subi <= 1'b1;
			end
			6'b000111: begin // j
				J <= 1'b1;
			end
			6'b001000: begin // jal
				J <= 1'b1;
				saveReg <= 1'b1;
			end
			// default : /* default */;
		endcase
	end
endmodule

