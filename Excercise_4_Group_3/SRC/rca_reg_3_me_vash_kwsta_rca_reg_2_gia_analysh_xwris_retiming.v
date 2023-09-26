// δικη μου προσπαθεια για καυασκευη rca_reg_3 με βαση το rca_reg_2 του κωστα

module fulladder (
  input a, b, cin,
  output s, cout
);
  assign s = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule



module rca_reg_2
#(
  parameter width = 4
)(
  input clk, rstn,
  input  [width-1:0] a_i,
  input  [width-1:0] b_i,
  output [width:0] sum_o
);

   
  wire [width-1:0] temp_sum;
  wire [width:0] temp_c;

  reg [width-1:0] sum_reg;
  wire [width-1:0] sum_w;
  
  reg [width-1:0] reg_a;
  reg [width-1:0] reg_b;
  reg reg_cin;
  
  wire [width-1:0] temp_a;
  wire [width-1:0] temp_b;
  wire temp_cin;  
  
  assign temp_c[0] = 1'b0;
  
  
  
 // genvar gi1; 
  //generate
   // for (gi=0; gi<width-2; gi1=gi1+1) begin: fas
	 //  fulladder fa (
       //             .a(reg_a[gi1]),
      //              .b(reg_b[gi1]),
      //              .cin(temp_c[gi1]),
     //               .s(temp_sum[gi1]),
     //               .cout(temp_c[gi1+1])
     //             );
	//end
  //endgenerate
  
  fulladder fa0 ( .a(reg_a[0]), .b(reg_b[0]), .cin(temp_c[0]), .s(temp_sum[0]), .cout(temp_c[1]) );
  fulladder fa1 ( .a(reg_a[1]), .b(reg_b[1]), .cin(temp_c[1]), .s(temp_sum[1]), .cout(temp_c[2]) );
  
  reg [width-1:0] middle_register;
   
  
  // assign middle_register[0] = temp_sum[0];
  // assign middle_register[1] = temp_sum[1];
  // assign middle_register[2] = temp_c[2];
  // assign middle_register[3] = temp_a[2];
  // assign middle_register[4] = temp_b[2];
  // assign middle_register[5] = temp_a[3];
  // assign middle_register[6] = temp_b[3];
  
  
  
  wire [width-1:0] temp_middle_register;
  
   assign temp_middle_register[0] = middle_register[0];
   assign temp_middle_register[1] = middle_register[1];
   assign temp_middle_register[2] = middle_register[2];
   assign temp_middle_register[3] = middle_register[3];
   assign temp_middle_register[4] = middle_register[4];
   assign temp_middle_register[5] = middle_register[5];
   assign temp_middle_register[6] = middle_register[6];
  
  
  fulladder fa2 ( .a(temp_middle_register[3]) , .b(temp_middle_register[4]) , .cin(temp_middle_register[2]), .s(temp_sum[2]), .cout(temp_c[3]));
  fulladder fa3 ( .a(temp_middle_register[5]) , .b(temp_middle_register[6]) , .cin(temp_c[3]), .s(temp_sum[3]), .cout(temp_c[4]) );
  
  
 
  
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
		middle_register <= {width{1'b0}};
	end	
    else
		begin
			middle_register[0] <= temp_sum[0]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[1] <= temp_sum[1]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[2] <= temp_c[2]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[3] <= temp_a[2]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[4] <= temp_b[2]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[5] <= temp_a[3]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
			middle_register[6] <= temp_b[3]; //πριν ειχα = και εβγαζε σφαλμα στη συνθεση
		end
	
   end
 
 
  
  
  
  //genvar gi2;
  //generate
   // for (gi2=2; gi2<width; gi2=gi2+1) begin: fass
	//   fulladder fa (
     //               .a(a_i[gi2]),
    //                .b(b_i[gi2]),
     //               .cin(temp_c[gi2]),
     //               .s(temp_sum[gi2]),
      //              .cout(temp_c[gi2+1])
      //            );
	//end
  //endgenerate




  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
		reg_a <= {width-1{1'b0}};
		reg_b <= {width-1{1'b0}};
		reg_cin <= 1'b0;
	end	
    else 
		begin
				reg_a <= a_i;
				reg_b <= b_i;
				reg_cin <= 1'b0;
		end
 end
  
  
  
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) sum_reg <= {width{1'b0}};
    else sum_reg <= sum_w;
  end




  assign temp_a = reg_a;
  assign temp_b = reg_b;
  assign temp_cin = reg_cin;

  assign sum_w= {temp_c[width],temp_sum};
  assign sum_o = sum_reg;

  
endmodule