

module decoder3_to_8
#(
    parameter n = 3,
    parameter m = 2**n
)
(
input [n-1:0]  enc,
input en,
output reg [m-1:0] dec
);

  //reg [m-1:0] dec;

 always @ (enc or en)
	begin

      if (!en) 
        begin
          dec=8'd0;
          case (enc)
              3'b000: dec[0]=1'b1;
              3'b001: dec[1]=1'b1;
              3'b010: dec[2]=1'b1;
              3'b011: dec[3]=1'b1;
              3'b100: dec[4]=1'b1;
              3'b101: dec[5]=1'b1;
              3'b110: dec[6]=1'b1;
              3'b111: dec[7]=1'b1;
              default: dec=8'd0; //Maybe not needed
          endcase
      end
else 
dec=8'd0;
end
endmodule