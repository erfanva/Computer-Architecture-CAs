
module DataLoaderDP(input clk, rst, input [7:0] cnt, output [19:0] x, y);
    reg [149:0][19:0] vec_x;
    reg [149:0][19:0] vec_y;
    reg [9:0] temp0, temp1;

    reg [19:0] sum = 20'b0;
    integer outfile; //file descriptor
    integer i=0;

    assign x = vec_x[cnt];
    assign y = vec_y[cnt];
    
    initial begin
        $display("Reading x:");
        outfile=$fopen("x_value.txt","r");   //"r" means reading and "w" means writing
        //read line by line.
        i = 0;
        while (! $feof(outfile) && i < 150) begin //read until an "end of file" is reached.
            $fscanf(outfile,"%b.%b\n", temp1, temp0); //scan each line and get the value as an binary
            vec_x[i] = {temp1, temp0};
            sum = sum + vec_x[i];
            // $display("%d) %b.%b", i, vec_x[i][19:10], vec_x[i][9:0]);
            i++;
        end 
        $display("%b", sum);
        //once reading and writing is finished, close the file.
        $fclose(outfile);
        

        $display("Reading y:");
        outfile=$fopen("y_value.txt","r");   //"r" means reading and "w" means writing
        //read line by line.
        i = 0;
        while (! $feof(outfile) && i < 150) begin //read until an "end of file" is reached.
            $fscanf(outfile,"%b.%b\n", temp1, temp0); //scan each line and get the value as an binary
            vec_y[i] = {temp1, temp0};
            // $display("%d) %b.%b", i, vec_y[i][19:10], vec_y[i][9:0]);
            i++;
        end 
        //once reading and writing is finished, close the file.
        $fclose(outfile);
    end

    
endmodule
