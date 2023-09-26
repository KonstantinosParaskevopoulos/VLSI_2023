module adder_tb2;
    parameter n = 8;
    parameter delay = 10;
    parameter fileout= "file1.txt";

    reg [n-1:0]   a,b;
    reg [n:0]     sum;
    reg check;
    wire [n:0]    out;
    integer f;
  
    rca #(.width(n)) DUT (
                        .a_i(a),
                        .b_i(b),
                        .sum_o(out)
                     );
    integer i;
    integer j;
    initial begin
        f = $fopen(fileout, "w");
        
        
        for(i=0; i<256; i=i+1)
            begin
            a = i;
            for (j=0; j<256; j=j+1)
            begin
                b = j;
                #(delay) ;
                $fwrite(f,"%d %d %d\n", a, b, out );
            end
            end
        $finish;
    end
 
endmodule
