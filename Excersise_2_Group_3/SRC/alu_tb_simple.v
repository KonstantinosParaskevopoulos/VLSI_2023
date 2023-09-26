module tb_alu_simple;
    parameter fileout= "ALU_simple.txt";
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
        A = 8'b00000011;//$random % (1<<n);
        B = 8'b00000111;//$random % (1<<n);
        for(i=0;i<=15;i=i+1)
        begin
            Opcode=i;
            #100;
            $fwrite(f,"%d %d %d %d %b\n", $signed(A), $signed(B), $signed(Y) , Opcode, status);
        end

    end
      
endmodule
