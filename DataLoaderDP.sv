
module DataLoaderDP(input clk, rst, output reg [19:0] x, y);
    reg [149:0][19:0] vec_x;
    reg [255:0][19:0] vec_y;
    reg [9:0] temp0, temp1;
    reg [7:0] count;

    integer outfile; //file descriptor
    integer i=0;

    always@(posedge clk, posedge rst) begin
        if(rst)

    end

    initial begin
        $display("Reading x:");
        outfile=$fopen("x_value.txt","r");   //"r" means reading and "w" means writing
        //read line by line.
        while (! $feof(outfile) && i < 150) begin //read until an "end of file" is reached.
            $fscanf(outfile,"%b.%b\n", temp1, temp0); //scan each line and get the value as an binary
            vec_x[i] = {temp1, temp0};
            $display("%d) %b.%b", i, vec_x[i][19:10], vec_x[i][9:0]);
            i++;
            #10; //wait some time as needed.
        end 
        //once reading and writing is finished, close the file.
        $fclose(outfile);
    end
    initial begin
        $display("Reading y:");
        outfile=$fopen("y_value.txt","r");   //"r" means reading and "w" means writing
        //read line by line.
        while (! $feof(outfile) && i < 150) begin //read until an "end of file" is reached.
            $fscanf(outfile,"%b.%b\n", temp1, temp0); //scan each line and get the value as an binary
            vec_y[i] = {temp1, temp0};
            $display("%d) %b.%b", i, vec_y[i][19:10], vec_y[i][9:0]);
            i++;
            #10; //wait some time as needed.
        end 
        //once reading and writing is finished, close the file.
        $fclose(outfile);
    end

    
endmodule