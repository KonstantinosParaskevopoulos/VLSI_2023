module GCD_FSM(
   input x_eq_y, x_gt_y, x_lt_y, calculate_new,
   input clk,rstn, 
   output reg x_sel, y_sel, x_ld, y_ld, data_en
   );


   reg [2:0]   state;   //4 Καταστάσεις στο FSM άρα 2 Bit για την αναπαράσταση
   reg [2:0]   nextstate;

   parameter [2:0] X_Y_LOAD=3'b000; //Αρχική κατάσταση-Κατάσταση Φόρτωσης Αριθμών
   parameter [2:0] COMPARE=3'b001; //Ενδιάμεση κατάσταση υπολογισμού
   parameter [2:0] Y_MINUS_X=3'b010; //Υ=Υ-Χ
   parameter [2:0] X_MINUS_Y=3'b011; //Χ=Χ-Υ
   parameter [2:0] DATA_READY=3'b100; //Κατάσταση έτοιμων Δεδομένων


   always @(posedge clk or negedge rstn)
     begin
       if (!rstn) //Ασυγχρονο σήμα Reset
         state=X_Y_LOAD;
       else
         state=nextstate;
     end


   always @(state,x_eq_y, x_gt_y, x_lt_y, calculate_new)
     begin
    case (state)        
            X_Y_LOAD:   begin
                            if (calculate_new==1'b1)			                                                nextstate = COMPARE;                                                                       
                            else							                                                    nextstate = X_Y_LOAD;
            end

			COMPARE: 	begin
                            if (x_gt_y==1'b1&&calculate_new==1'b0)                                              nextstate = X_MINUS_Y;
                            else if (x_lt_y==1'b1&&calculate_new==1'b0)                                         nextstate = Y_MINUS_X;
                            else if (x_eq_y==1'b1&&calculate_new==1'b0)                                         nextstate = DATA_READY;
					        else							                                                    nextstate = COMPARE;
            end
			Y_MINUS_X:	begin
                            nextstate = COMPARE;
            end
			X_MINUS_Y:    begin
                            nextstate = COMPARE;
            end
            DATA_READY:    begin
                            nextstate = X_Y_LOAD;
            end
			default:								                                                            nextstate = X_Y_LOAD;

   
    endcase // case (state)
     end // always @ (state,next_state)


   always @(state)
 begin
   case (state)
      X_Y_LOAD: 
      begin 
        x_sel <= 1'b1;
        y_sel <= 1'b1;
        x_ld <= 1'b1;
        y_ld <= 1'b1;
        data_en <= 1'b0;
      end
      COMPARE: 
      begin 
        x_sel <= 1'b0;
        y_sel <= 1'b0;
        x_ld <= 1'b0;
        y_ld <= 1'b0;
        data_en <= 1'b0;
      end
      X_MINUS_Y   : 
      begin 
        x_sel <= 1'b0;
        y_sel <= 1'b0;
        x_ld <= 1'b1;
        y_ld <= 1'b0;
        data_en <= 1'b0;
      end
      Y_MINUS_X   : 
      begin 
        x_sel <= 1'b0;
        y_sel <= 1'b0;
        x_ld <= 1'b0;
        y_ld <= 1'b1;
        data_en <= 1'b0;
      end
      DATA_READY   : 
      begin 
        x_sel <= 1'b0;
        y_sel <= 1'b0;
        x_ld <= 1'b0;
        y_ld <= 1'b0;
        data_en <= 1'b1;
      end
    default: begin 
        x_sel <= 1'b1;
        y_sel <= 1'b1;
        x_ld <= 1'b1;
        y_ld <= 1'b1;
        data_en <= 1'b0;
      end
   endcase // case (state)
 end
 
endmodule

module Comparator(
    input [31:0] x_i,
    input [31:0] y_i,
    output x_eq_y, x_gt_y, x_lt_y,
    output [31:0] x_o
);
    assign x_eq_y = (x_i==y_i) ? 1 : 0;
    assign x_gt_y = (x_i>y_i) ? 1 : 0;
    assign x_lt_y = (x_i<y_i) ? 1 : 0;
    assign x_o = x_i;
endmodule

module GCD_Datapath(
input [31:0] x_i,
input [31:0] y_i,
input x_sel, y_sel, x_ld, y_ld, data_en,
input clk,rstn,
output x_eq_y, x_gt_y, x_lt_y,
output [31:0] data_o
);


reg [31:0] output_reg;
wire [31:0] x_o;
wire [31:0] mux_for_x;
wire [31:0] mux_for_y;
wire [31:0] x_sub;
wire [31:0] y_sub;
reg [31:0] x_reg;
reg [31:0] y_reg;
wire [31:0] x_mid;
wire [31:0] y_mid;


assign x_sub = x_reg - y_reg;
assign y_sub = y_reg - x_reg;


assign mux_for_x = (x_sel) ? x_i : x_sub;
assign mux_for_y = (y_sel) ? y_i : y_sub;






always @ (posedge clk or negedge rstn) begin
    if (!rstn) x_reg <= 32'h0000;
    else if (x_ld) x_reg <= mux_for_x;
end

always @ (posedge clk or negedge rstn) begin
    if (!rstn) y_reg <= 32'h0000;
    else if (y_ld) y_reg <= mux_for_y;
end



assign x_mid = x_reg;
assign y_mid = y_reg;

Comparator c1(x_mid, y_mid, x_eq_y, x_gt_y, x_lt_y, x_o);


always @ (posedge clk or negedge rstn) begin
    if (!rstn) output_reg <= 32'h0000;
    else if(data_en) output_reg <= x_o;
end

assign data_o = output_reg;

endmodule

module GCD_full
(
input [31:0] x_i,
input [31:0] y_i,
input calculate_new,     
input clk,         
input rstn,     
output [31:0] data_o,
output data_ready_reg
);

wire x_sel_w, y_sel_w, x_ld_w, y_ld_w, data_en_w, x_eq_y_w, x_gt_y_w, x_lt_y_w;

GCD_FSM fsm(x_eq_y_w, x_gt_y_w, x_lt_y_w, calculate_new, clk, rstn, x_sel_w, y_sel_w, x_ld_w, y_ld_w, data_en_w);
 
GCD_Datapath dp(x_i, y_i, x_sel_w, y_sel_w, x_ld_w, y_ld_w, data_en_w, clk, rstn, x_eq_y_w, x_gt_y_w, x_lt_y_w, data_o);

assign data_ready_reg = data_en_w;

endmodule