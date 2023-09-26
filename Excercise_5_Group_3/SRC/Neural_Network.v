
module Neural_Network
#(
    parameter k1 = 8,
    

    parameter n = 8,
    parameter b = 8,

    parameter m1 = 11,
    parameter m2 = 2,

    parameter res_width1 =  $clog2(m1*((2**k1)-1)*((2**n)-1)+2**b-1),
    parameter k2 = res_width1,
    parameter res_width2 =  $clog2(m2*((2**k2)-1)*((2**n)-1)+2**b-1)
)
(
    // Universal Inputs
    input clk, load_params, rstn,

    // First Layer Inputs
    input signed [m1*k1-1:0] activation0a,
    input signed [m1*n-1:0] weight0a,
    input  [b-1:0] bias0a,
    input signed [m1*k1-1:0] activation1a,
    input signed [m1*n-1:0] weight1a,
    input  [b-1:0] bias1a,

    // Second Layer Inputs
    input signed [m2*k2-1:0] weight0b,
    input  [b-1:0] bias0b,

    input signed [m2*k2-1:0] weight1b,
    input  [b-1:0] bias1b,

    input signed [m2*k2-1:0] weight2b,
    input  [b-1:0] bias2b,

    input signed [m2*k2-1:0] weight3b,
    input  [b-1:0] bias3b,

    input signed [m2*k2-1:0] weight4b,
    input  [b-1:0] bias4b,

    input signed [m2*k2-1:0] weight5b,
    input  [b-1:0] bias5b,

    // Argmax Output
    output [res_width2-1:0] result
);

//Registers

//First Layer
reg [res_width1-1:0] res0a_reg;
reg [res_width1-1:0] res1a_reg;
//Second Layer
reg [res_width2-1:0] res0b_reg;
reg [res_width2-1:0] res1b_reg;
reg [res_width2-1:0] res2b_reg;
reg [res_width2-1:0] res3b_reg;
reg [res_width2-1:0] res4b_reg;
reg [res_width2-1:0] res5b_reg;

//Wires
//First Layer
wire [res_width1-1:0] res0a;
wire [res_width1-1:0] res1a;
//Second Layer
wire [res_width2-1:0] res0b;
wire [res_width2-1:0] res1b;
wire [res_width2-1:0] res2b;
wire [res_width2-1:0] res3b;
wire [res_width2-1:0] res4b;
wire [res_width2-1:0] res5b;

wire [m2*res_width2-1:0] activation_sec_layer;


// Pipeline the neurons
    always @(posedge clk, negedge rstn)
    begin
        if (!rstn) begin 
            res0a_reg <= 'b0;
            res1a_reg <= 'b0;
            res0b_reg <= 'b0;
            res1b_reg <= 'b0;
            res2b_reg <= 'b0;
            res3b_reg <= 'b0;
            res4b_reg <= 'b0;
            res5b_reg <= 'b0;
        end
        else if (rstn && load_params) begin
            res0a_reg <= res0a;
            res1a_reg <= res1a;
            res0b_reg <= res0b;
            res1b_reg <= res1b;
            res2b_reg <= res2b;
            res3b_reg <= res3b;
            res4b_reg <= res4b;
            res5b_reg <= res5b;
        end
    end


//////////////////////////////////////////////////////////////////
//                      First Layer Neurons                     //
//////////////////////////////////////////////////////////////////
//0a
Artificial_Neuron #(
        .k(k1),
        .n(n),
        .b(b),
        .m(m1),
        .res_width(res_width1)
) neuron0a (
        .activation_input(activation0a),
        .weight(weight0a),
        .bias(bias0a),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res0a)
    );

//1a
Artificial_Neuron #(
        .k(k1),
        .n(n),
        .b(b),
        .m(m1),
        .res_width(res_width1)
) neuron1a (
        .activation_input(activation1a),
        .weight(weight1a),
        .bias(bias1a),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res1a)
    );

assign activation_sec_layer = {res1a_reg, res0a_reg};   //Activation for Second Layer

//////////////////////////////////////////////////////////////////
//                     Second Layer Neurons                     //
//////////////////////////////////////////////////////////////////
//0b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron0b (
        .activation_input(activation_sec_layer),
        .weight(weight0b),
        .bias(bias0b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res0b)
    );

//1b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron1b (
        .activation_input(activation_sec_layer),
        .weight(weight1b),
        .bias(bias1b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res1b)
    );
//2b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron2b (
        .activation_input(activation_sec_layer),
        .weight(weight2b),
        .bias(bias2b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res2b)
    );
//3b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron3b (
        .activation_input(activation_sec_layer),
        .weight(weight3b),
        .bias(bias3b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res3b)
    );
//4b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron4b (
        .activation_input(activation_sec_layer),
        .weight(weight4b),
        .bias(bias4b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res4b)
    );
//5b
Artificial_Neuron #(
        .k(k2),
        .n(n),
        .b(b),
        .m(m2),
        .res_width(res_width2)
) neuron5b (
        .activation_input(activation_sec_layer),
        .weight(weight5b),
        .bias(bias5b),
        .clk(clk),
        .load_params(load_params),
        .rstn(rstn),
        .res(res5b)
    );

//////////////////////////////////////////////////////////////////
//                  ArgMax Activation Function                  //
//////////////////////////////////////////////////////////////////

Argmax #(.width(res_width2)) argmax_act_func(
    .in0b(res0b_reg),
    .in1b(res1b_reg),
    .in2b(res2b_reg),
    .in3b(res3b_reg),
    .in4b(res4b_reg),
    .in5b(res5b_reg),
    .max_in(result),
    .clk(clk),
    .rstn(rstn)
);



endmodule