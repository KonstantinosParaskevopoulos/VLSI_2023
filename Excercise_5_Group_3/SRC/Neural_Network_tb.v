module Neural_Network_tb;

    parameter k1 = 8;
    parameter n = 8;
    parameter b = 8;
    parameter m1 = 11;
    parameter m2 = 2;
    parameter res_width1 =  $clog2(m1*((2**k1)-1)*((2**n)-1)+2**b-1);
    parameter k2 = res_width1;
    parameter res_width2 =  $clog2(m2*((2**k2)-1)*((2**n)-1)+2**b-1);


//Input Registers
reg clk, load_params, rstn;
reg signed [m1*k1-1:0] activation0a;
reg signed [m1*n-1:0] weight0a;
reg signed [b-1:0] bias0a;
reg signed [m1*k1-1:0] activation1a;
reg signed [m1*n-1:0] weight1a;
reg signed [b-1:0] bias1a;
reg signed [m2*k2-1:0] weight0b;
reg signed [b-1:0] bias0b;
reg signed [m2*k2-1:0] weight1b;
reg signed [b-1:0] bias1b;
reg signed [m2*k2-1:0] weight2b;
reg signed [b-1:0] bias2b;
reg signed [m2*k2-1:0] weight3b;
reg signed [b-1:0] bias3b;
reg signed [m2*k2-1:0] weight4b;
reg signed [b-1:0] bias4b;
reg signed [m2*k2-1:0] weight5b;
reg signed [b-1:0] bias5b;

//Output Registers
wire [res_width2-1:0] result;


reg [3:0] activations [5279:0];



always #50 clk = ~clk;

integer i;
initial begin
    clk <= 1'b0;

    $readmemh("src/X_h.train", activations);
       
    load_params <= 1'b0;
    rstn <= 1'b0;
    #10 rstn <= 1'b1;
    #10 load_params <= 1'b1;
    //Parameter_Load
    {
        weight0a, weight1a, weight0b, weight1b, weight2b, weight3b, weight4b, weight5b
    } <= 
    {
        8'b10001101, 8'b10010111, 8'b11000100, 8'b00000000, 8'b10011010, 8'b10000011, 8'b10010111, 8'b10010011, 8'b10010001, 8'b00000110, 8'b00001111, 8'b10000011, 8'b10001000, 8'b00011100, 8'b00011110, 8'b00011010, 8'b10011000, 8'b10001101, 8'b00001111, 8'b10010111, 8'b00101110, 8'b10010001, 8'b11001011, 8'b10010011, 8'b00000010, 8'b00010010, 8'b00011110, 8'b00011001, 8'b00000001, 8'b00001010, 8'b00110011, 8'b00010001, 8'b10011000, 8'b10110111
    };

    {
       bias0a, bias1a, bias0b, bias1b, bias2b, bias3b, bias4b, bias5b
    } <= 
    {
        8'b00011101,8'b00010101,8'b00010101,8'b00010001,8'b00000101,8'b00010000,8'b00000001,8'b10010110
    };

    #20 load_params <= 1'b0;


end

integer j=0;

Neural_Network #(
.k1(k1), .n(n), .b(b), .m1(m1), .m2(m2), .res_width1(res_width1), .k2(k2), .res_width2(res_width2) 
) nn (
.clk(clk), .load_params(load_params), .rstn(rstn), 
.activation0a(activation0a), .weight0a(weight0a), .bias0a(bias0a), 
.activation1a(activation1a), .weight1a(weight1a), .bias1a(bias1a), 
.weight0b(weight0b), .bias0b(bias0b), 
.weight1b(weight1b), .bias1b(bias1b), 
.weight2b(weight2b), .bias2b(bias2b), 
.weight3b(weight3b), .bias3b(bias3b), 
.weight4b(weight4b), .bias4b(bias4b), 
.weight5b(weight5b), .bias5b(bias5b),
.result(result)
);

integer t = 0;

always @(posedge clk)begin
activation0a <= {{4'b0000, activations[t]}, {4'b0000, activations[t+1]},{4'b0000, activations[t+2]},{4'b0000, activations[t+3]},{4'b0000, activations[t+4]},{4'b0000, activations[t+5]},{4'b0000, activations[t+6]},{4'b0000, activations[t+7]},{4'b0000, activations[t+8]},{4'b0000, activations[t+9]},{4'b0000, activations[t+10]}};
//$display("%h\n", activation0a);
t=t+11;
activation1a <= {{4'b0000, activations[t]}, {4'b0000, activations[t+1]},{4'b0000, activations[t+2]},{4'b0000, activations[t+3]},{4'b0000, activations[t+4]},{4'b0000, activations[t+5]},{4'b0000, activations[t+6]},{4'b0000, activations[t+7]},{4'b0000, activations[t+8]},{4'b0000, activations[t+9]},{4'b0000, activations[t+10]}};
//$display("%h\n", activation1a);
t=t+11;

$display("%h\n", result);

if(t>5282) $finish;

end




endmodule