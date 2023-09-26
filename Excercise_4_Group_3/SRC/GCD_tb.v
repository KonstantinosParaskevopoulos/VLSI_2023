module GCD_tb;


reg [31:0] x_i;
reg [31:0] y_i;
reg calculate_new;       
reg clk;            
reg rstn;      
wire [31:0] out;
wire data_en_w;
integer out_out;

GCD_full gcd_circ(x_i, y_i, calculate_new, clk, rstn, out, data_en_w);
   

   // Generate clock time period = 20ns, freq => 50MHz
   always #10 clk = ~clk;
 
   // Initialize variables to default values at time 0
   initial begin
      clk <= 0;
      rstn <= 0;
   end

    initial begin
        #20 rstn<=1;
        x_i <= 32'd95;
        y_i <= 32'd25;
        #20 calculate_new<=1;
        #20 calculate_new<=0;
        while(!data_en_w)
        begin
            out_out = out;
            #20 $display ("Out= %d", out);
        end
        #20 $display("Out= %d", out);
        #20 $finish;
    end


endmodule