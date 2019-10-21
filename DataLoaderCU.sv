
module DataLoaderCU(input clk, rst, output reg EnCC, EnErr, output reg [7:0] cnt);
    reg [1:0] ns, ps = 2'b00;
    reg ld0cnt, inccnt;

    always@(posedge clk, posedge rst) begin
        $display("cnt: %d | ns:%d | ps:%d", cnt, ns, ps);
        if(rst)
            cnt <= 8'b0;
        else begin
            if(ld0cnt) 
				cnt <= 8'b0;
			else 
				cnt <= inccnt ? cnt + 1 : cnt;
        end
    end

    always@ (ps, cnt) begin 
		{inccnt, ld0cnt, EnCC, EnErr} <= 4'b0;
		case (ps)
            2'b00: begin
                ld0cnt <= 1'b1;
                ns <= 2'b01;
			end
            2'b01: begin
                inccnt <= 1'b1;
                ns <= (cnt == 149) ? 2'b10 : 2'b01;
                ld0cnt <= (cnt == 149) ? 1'b1 : 1'b0;
            end
            2'b10: begin
                inccnt <= 1'b1;
                ns <= (cnt == 149) ? 2'b11 : 2'b10;
                ld0cnt <= (cnt == 149) ? 1'b1 : 1'b0;
            end
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
