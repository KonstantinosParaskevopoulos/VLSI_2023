module decoder_tb;
    parameter n = 4;
    parameter m = 2**n;
    parameter delay = 10;
    parameter fileout= "file1.txt";

    reg [n-1:0] encode;
    wire [m-1:0] decode;
    reg enable;
    reg check;
    
    integer f;
    
    decoder4_to_16 #(n, m) DUT (
                .enc(encode),
                //.en(enable),
                .dec(decode)
            );

    /*decoder3_to_8 #(n, m) DUT (
                .enc(encode),
                //.en(enable),
                .dec(decode)
            );*/

    integer i;
    initial begin
        f = $fopen(fileout, "w");
        enable = 1'b0;
        check = 1'b0;
        
        for(i=0; i<m; i=i+1)
            begin
            encode = i;
                #(delay) ;
                $fwrite(f,"%d %b %d\n", encode, decode, enable );
                if(decode[encode]==1'b1)
		            begin
			        check=1;
                    end
	            else
		            begin
			        $monitor("Error in Input %d \n", encode);	
                    end
            end
            /*
            enable = 1'b1;

            for(i=0; i<m; i=i+1)
            begin
            encode = i;
                #(delay) ;
                $fwrite(f,"%d %b %d\n", encode, decode, enable );
                if(decode==8'b0)
		            begin
			        check=1;
                    end
	            else
		            begin
			        $monitor("Error in Input %d \n", encode);	
                    end
            end*/
        $finish;
    end
 
endmodule
