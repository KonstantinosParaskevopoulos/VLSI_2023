module Artificial_Neuron 
#(
    parameter k = 4,
    parameter n = 4,
    parameter b = 4,
    parameter m = 4,
    parameter res_width =  $clog2(m*((2**k)-1)*((2**n)-1)+2**b-1)
)

(
    input signed [m*k-1:0] activation_input,
    input signed [m*n-1:0] weight,
    input signed [b-1:0] bias,
    input clk, load_params, rstn,
    output signed [res_width-1:0] res
);

    reg signed [m*k-1:0] activation_input_reg;
    reg signed [m*n-1:0] weight_reg;
    reg signed [b-1:0] bias_reg;

wire signed [m*res_width-1:0] temp_sum;

always @(posedge clk, negedge rstn)
begin

    if (!rstn)begin 
        weight_reg = 'b0;
        bias_reg = 'b0;
    end
    else if (rstn && load_params)begin
        weight_reg = weight;
        bias_reg = bias;
    end

end

always @(posedge clk, negedge rstn)
begin

    if (!rstn)begin 
        activation_input_reg = 'b0;
    end
    else if (rstn)begin
        activation_input_reg = activation_input;
    end

end



MAC_unit #(.k(k), .n(n), .b(b), .res_width(res_width)) mac0 (activation_input_reg[k-1:0], weight_reg[n-1:0], bias_reg, temp_sum[res_width-1:0]);


genvar i;
generate
    for (i=1; i<m; i=i+1) begin: mac
	   MAC_unit #(.k(k), .n(n), .b(b), .res_width(res_width)) mac_units (activation_input_reg[(i+1)*k-1:i*k], weight_reg[(i+1)*n-1:i*n], temp_sum[i*res_width-1:(i-1)*res_width], temp_sum[(i+1)*res_width-1:(i)*res_width]);
	end
  endgenerate

assign res = (temp_sum[m*res_width-1]==0)? temp_sum [m*res_width-1:(m-1)*res_width] : 'b0;

endmodule
