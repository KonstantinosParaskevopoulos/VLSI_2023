module rca_reg_2
#(
  parameter width = 4
)(
  input clk, rstn,
  input  [width-1:0] a_i, // είσοδος a του κύκλωματος
  input  [width-1:0] b_i, // είσοδος b του κύκλωματος
  output [width:0] sum_o // έξοδος του 3ου καταχωρητή στο τέλος του συνολικού κυκλώματος (στο τέλος του 2ου σταδίου)
);

   
  wire [1:0] temp_sum_0_1; // αρτηρια καλωδίου για τα temp_sum[0] και temp_sum[1] του 1ου rca και 2ου rca
  wire [1:0] temp_c_0_1; // αρτηρια καλωδίου για τα temp_c[0] και temp_c[1] του 1ου και 2ου rca 

  reg [width-1:0] sum_reg; // είσοδος του 3ου καταχωρητή στο τέλος του συνολικού κυκλώματος (στο τέλος του 2ου σταδίου)
  // wire [width-1:0] sum_w; // αρτηρία καλωδίου που συνδέει το concatenated {temp_c[width],temp_sum} στην είσοδο του 3ου 
						  // καταχωρητή στο τέλος του συνολικού κυκλώματος (στο τέλος του 2ου σταδίου) 
  
  reg [width-1:0] reg_a; // ο 1ος καταχωρητής (στην αρχή του 1ου σταδίου) στον οποιον μπαινει η είσοδος a του συνολικού κυκλώματος
  reg [width-1:0] reg_b; // ο 1ος καταχωρητής (στην αρχή του 1ου σταδίου) στον οποιον μπαινει η είσοδος b του συνολικού κυκλώματος
  reg reg_cin; // το κρατόυμενο εισόδου cin του συνολικού κυκλώματος που μπαίνει στον 1ο καταχωρητή (στην αρχή του 1ου σταδίου)
  
  wire [width-1:0] temp_a; // αρτηρία καλωδίου που συνδέει την έξοδο του καταχωρητή reg_a (στην αρχή του 1ου σταδίου) με την είσοδο a του rca 
  wire [width-1:0] temp_b; // αρτηρία καλωδίου που συνδέει την έξοδο του καταχωρητή reg_b (στην αρχή του 1ου σταδίου) με την είσοδο b του rca 
  wire temp_cin;  // καλωδιο (1 bit) που παίρνει το κρατούμενο εισόδου του συνολικού κυκλώματος από την καταχωρητή reg_cin και το οδηγεί στην είσοδο cin του 1ου rca 
  
  
  reg [1:0] reg_2_temp_sum_0_1; // ο 2ος καταχωρητής (στο τέλος του 1ου σταδίου και στην αρχή του 2ου σταδίου) στον οποιον μπαινουν τα temp_sum[0] και temp_sum[1] τα οποία έχουν το concatenated αποτέλεσμα {temp_sum[1],temp_sum[0]} των εξόδων s του 1ου και 2ου rca
  reg [1:0] reg_2_temp_c_0_1; // ο 2ος καταχωρητής (στο τέλος του 1ου σταδίου και στην αρχή του 2ου σταδίου) στον οποιον μπαινουν τα temp_c[0] και temp_c[1] τα οποία έχουν το concatenated αποτέλεσμα {temp_c[1],temp_c[0]} των εξόδων c του 1ου και 2ου rca
  // reg reg_cin2; --- δε χρειαζεται cin ο 2ος καταχωρητής
  reg [1:0] reg_2_a_2_3; // ο 2ος καταχωρητής (στο τέλος του 1ου σταδίου και στην αρχή του 2ου σταδίου) στον οποιον μπαινουν τα a_i[2] και a_i[3] της εισόδου a του συνολικού κυκλώματος 
  reg [1:0] reg_2_b_2_3; // ο 2ος καταχωρητής (στο τέλος του 1ου σταδίου και στην αρχή του 2ου σταδίου) στον οποιον μπαινουν τα b_i[2] και b_i[3] της εισόδου b του συνολικού κυκλώματος 
  
  
  wire [1:0] temp_a_2_3; // αρτηρία καλωδίου που συνδέει την έξοδο reg_2_a_2_3 του 2ου καταχωρητή (στην αρχή του 2ου σταδίου) με την είσοδο a του 3ου και 4ου rca
  wire [1:0] temp_b_2_3; // αρτηρία καλωδίου που συνδέει την έξοδο reg_2_b_2_3 του 2ου καταχωρητή (στην αρχή του 2ου σταδίου) με την είσοδο b του 3ου και 4ου rca
  
  wire [1:0] rca_3_4_sum_2_3;

  wire [1:0] temp_reg_2_temp_sum_0_1; // αρτηρία καλωδίου που συνδέει την έξοδο reg_2_temp_sum_0_1 του 2ου καταχωρητή (στην αρχή του 2ου σταδίου) απευθείας με τα 2 πρώτα bit ( sum_reg[0] και sum_reg[1] ) της εισόδου sum_reg του 3ου (τελευταίου) καταχωρητή (στο τέλος του 2ου σταδίου)
  wire temp_reg_2_temp_c_1; // καλωδio που συνδέει την έξοδο reg_2_temp_c_1 του 2ου καταχωρητή (στην αρχή του 2ου σταδίου) με την είσοδο cin του 3ου rca
  
  wire temp_c_3; // καλωδιο που συνδέει το αποτελέσματα c του 4ου rca προς την εισόδο sum_reg[3] του 3ου καταχωρητή (στο τέλος του 2ου σταδίου) 
  wire [1:0] temp_sum_2_3; // αρτηρία καλωδίου που συνδέει τα αποτελέσματα sum του 3ου και 4ου rca προς τις εισόδους sum_reg[1] και sum_reg[2] του 3ου καταχωρητή (στο τέλος του 2ου σταδίου) 
  
//  assign temp_c[0] = 1'b0;
  
  
  genvar gi;
  generate
    for (gi=0; gi<2; gi=gi+1) begin: fas
	   fulladder fa (
                    .a(reg_a[gi]),
                    .b(reg_b[gi]),
                    .cin(temp_c[gi]),
                    .s(temp_sum[gi]),
                    .cout(temp_c[gi])
                  );
	end
  endgenerate



  genvar gii;
  generate
    for (gii=2; gii<4; gii=gii+1) begin: fass
	   fulladder fa (
                    .a(reg_2_a_2_3[gii]),
                    .b(reg_2_b_2_3[gii]),
                    .cin(reg_2_temp_c_0_1[gii]),
                    .s(temp_sum[gii]),
                    .cout(temp_c[gii])
                  );
	end
  endgenerate
  
  


  always @ (posedge clk or negedge rstn) begin // always για τον 1ο register (στην αρχή του 1ου στάδιου)
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
 
 
 
 
  always @ (posedge clk or negedge rstn) begin // always για τον 2ο register (στο τέλος του 1ου στάδιου και στην αρχή του 2ου στάδιου)
	if (!rstn) begin
		reg_2_temp_sum_0_1 <= {width-3{1'b0}};
		reg_2_temp_c_0_1 <= {width-3{1'b0}};
		reg_2_a_2_3 <= {width-3{1'b0}};
		reg_2_b_2_3 <= {width-3{1'b0}};
	end
	else
		begin
				reg_2_temp_sum_0_1 <= temp_sum_0_1;
				reg_2_temp_c_0_1[1] <= temp_c_0_1[1];
				reg_2_a_2_3 <= {a_i[3], a_i[2]};
				reg_2_b_2_3 <= {b_i[3], b_i[2]};
		end				
 
	end  
  always @ (posedge clk or negedge rstn) begin // always για τον 3ο register (στο τέλος του 2ου στάδιου)
    if (!rstn) sum_reg <= {width{1'b0}};
    else #(0.01) sum_reg <= sum_w;
  end


 // καθολικά assigns για το συνολικό κύκλωμα
  assign temp_a = reg_a;
  assign temp_b = reg_b;
  assign temp_cin = reg_cin;
  

  assign fa[2].s = temp_sum_2_3[0]; // assign fa3.s = temp_sum_2_3[0];
  assign fa[3].s = temp_sum_2_3[1]; // assign fa4.s = temp_sum_2_3[1];
  assign fa[2].cout = temp_c_3; // assign fa3.cout = temp_c_3;



  assign sum_w = {temp_c_3, temp_sum_2_3 ,temp_reg_2_temp_sum_0_1};
  assign sum_o = sum_reg;

  
endmodule
