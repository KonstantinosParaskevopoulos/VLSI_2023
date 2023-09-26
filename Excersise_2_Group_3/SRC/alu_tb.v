module tb_alu;
    parameter fileout= "ALU.txt";
    parameter n=8;
    // Inputs
    reg [n-1:0] A;
    reg [n-1:0] B;
    reg [3:0] Opcode;
    wire [4:0] status;

    // Outputs
    wire [n-1:0] Y;

    // Instantiate the Unit Under Test (UUT)
    ALU  #(n) uut( 
        .A(A), 
        .B(B), 
        .Opcode(Opcode), 
        .Y(Y),
        .status(status)
    );
            integer f;
        integer i;

    initial begin
        f = $fopen(fileout, "w");
        // Apply inputs.
        A = $random % (1<<n);
        B = $random % (1<<n);
        for(i=0;i<=15;i=i+1)
        begin
            Opcode=i;
            #100;
            $fwrite(f,"A:%d B:%d Y:%d Opcode:%d Status:%b\n", $signed(A), $signed(B), $signed(Y) , Opcode, status);
        end

    end
      
endmodule
