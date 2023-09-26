module MAC_unit #(
    parameter n = 8,    //Weights bits
    parameter b = 8,    //Bias Bits or prev_res Bits
    parameter k = 8,    //Input Activation Bits
    parameter res_width = $clog2(((2**k)-1)*((2**n)-1)+2**b) //Result Bits  //Να φτιάξω το μέγεθος
)(
    input signed [k-1:0] activation_input,
    input signed [n-1:0] weight,
    input signed [res_width-1:0] prev_res,  //Bias or Previous Result
    output signed [res_width-1:0] res
);
   wire signed [k+n-1:0] multiplication;
 
   assign multiplication = activation_input*weight;
   assign res = multiplication + prev_res;

endmodule
