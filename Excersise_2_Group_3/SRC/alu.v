//Verilog module for an ALU

module ALU
#(
    parameter n = 3
)
(
    //inputs,outputs and internal variables declared here
    input signed [n-1:0] A,
    input signed [n-1:0] B,
    input [3:0] Opcode,
    output reg signed[n-1:0] Y,
    output reg [4:0] status
    );
    
    
    

    //Always block with inputs in the sensitivity list.
    always @(Opcode or A or B)
    begin
        status=5'b00000;
        case (Opcode)
         4'd0 :
         begin
         status[2]=(A<B? 1'b1 : 1'b0);
         {status[0], Y} = A - B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         status[3]= (Y>0&&A<0&&B<0? 1'b1 : 1'b0); 
 	end
         4'd1 :
         begin 
         status[2]=1'b0;
         {status[0], Y} = A + B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
	 status[3]= (Y<0&&A>0&&B>0? 1'b1 : 1'b0);
         end
         4'd2 :
         begin 
         status[2]=(A<1? 1'b1 : 1'b0);
         {status[0], Y} = A - 1;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
	 status[3]=(Y>0&&A<1? 1'b1: 1'b0);
         end
         4'd3 :
         begin
         status[2]=1'b0;
         {status[0], Y} = A + 1;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y); 
	 status[3]=(Y<0&&A>0? 1'b1: 1'b0);
         end 
         4'd4 : 
         begin
         if (A[n-1]==1'b1)
            Y=-$signed(A);
            else Y=A;
        status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
        end
         4'd5 : 
         begin
         Y = ~A;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd6 : 
         begin
         Y = A & B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd7 : 
         begin
         Y = A | B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd8 :
         begin 
         Y = A ^ B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd9 : 
         begin
         status[0]=A[n-1];
         Y = A <<< B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd10:
         begin 
         status[0]=A[0];
         Y = A >>> B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd11: 
         begin
         status[0]=A[0];
         Y = A >> B;
         status[1]=(Y==0? 1'b1 : 1'b0);
         status[4]= !(^Y);
         end
         4'd12: 
         begin
         Y = {A[n-2:0],A[n-1]};
         end
         4'd13:
         begin 
         Y = {A[0],A[n-1:1]};
         end
         4'd14: 
         begin
         Y = 'd0;
         end
         4'd15: 
         begin
         Y = 'd1;
         end
        endcase 
    end
    
endmodule
