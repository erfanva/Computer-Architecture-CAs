module CoefficientCU(input clk, rst, En, output reg ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
    ldxbar, ldybar, 
    ldB1, ldB0,
    ld1cnt, inccnt);

    reg [1:0] ns, ps = 2'b00;

    always@ (ps, En) begin 
		{ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
        ldxbar, ldybar, 
        ldB1, ldB0,
        ld1cnt, inccnt} <= 14'b0;
		case (ps)
            2'b00: begin
                {ld0xy, ld0x2, ld0x, ld0y, ld1cnt} <= 5'b1111;
                ns <= En ? 2'b01 : 2'b00;
			end
            2'b01: begin
                {ldxy, ldx2, ldx, ldy, inccnt} <= 5'b11111;
                {ldB0, ldB1} <= 2'b11;
                {ldxbar, ldybar} <= 2'b11;
                ns <= En ? 2'b01 : 2'b10;
            end
            2'b10: ;
            2'b11: ;
            default: ns <= 2'b00;
        endcase  
	end
    
	always@ (posedge clk, posedge rst) begin 
		if(rst) 
			ps <= 2'b0;
		else
			ps <= ns;
	end
endmodule