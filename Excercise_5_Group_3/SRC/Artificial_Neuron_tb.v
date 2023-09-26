`timescale 100ns/1ps

module Artificial_Neuron_tb;
    parameter k = 4;
    parameter n = 4;
    parameter b = 4;
    parameter m = 4;
    parameter res_width =  $clog2(m*((2**k)-1)*((2**n)-1)+2**b-1);
    parameter delay = 1000;
    parameter fileout= "Artificial_Neuron.txt";
    reg clk=0, rstn=0, load_params=0;
    reg signed [m*k-1:0] activation_input;
    reg signed [m*n-1:0] weight;
    reg signed [b-1:0] bias;
    wire signed [res_width-1:0] res;
    integer f;

    Artificial_Neuron #(.k(k), .n(n), .b(b), .m(m), .res_width(res_width)) DUT (
                                      .clk(clk),
                                      .rstn(rstn),
                                      .activation_input(activation_input),
                                      .weight(weight),
                                      .bias(bias),
				      .load_params(load_params),
                                      .res(res)
                                      );
  initial begin
    clk = 1'b0;
    rstn = 1'b0;
    load_params = 1'b0;
    #(delay) rstn=1'b1;
    $display("Initial 1 Done\n");
  end
  always #(0.5*delay) clk = ~clk;
  initial begin
      f = $fopen(fileout, "w");
      #(delay);
      repeat(100) begin
          activation_input = $random;// % (1<<m*k);
          $display("Initial 2 Done\n");
          weight = $random;// % (1<<m*n);
          $display("Initial 3 Done\n");
          bias = $random % (1<<b);
        load_params = 1'b1;
        #(delay) load_params = 1'b0;
        
//          $fwrite(f, "%d %d %d %d %d %d %d %d %d %d\n", $signed(activation_input[k-1:0]), $signed(activation_input[2*k-1:k]), $signed(activation_input[3*k-1:2*k]), $signed(activation_input[4*k-1:3*k]), $signed(weight[k-1:0]), $signed(weight[2*k-1:k]), $signed(weight[[3*k-1:2*k]), $signed(weight[4*k-1:3*k]), $signed(bias), $signed(res));

           $fwrite(f, "%d %d %d %d %d %d %d %d %d %d\n", $signed(activation_input[k-1:0]), $signed(activation_input[2*k-1:k]), $signed(activation_input[3*k-1:2*k]), $signed(activation_input[4*k-1:3*k]), $signed(weight[n-1:0]), $signed(weight[2*n-1:n]), $signed(weight[3*n-1:2*n]), $signed(weight[4*n-1:3*n]), $signed(bias), $signed(res));
      end
      $finish;
  end
endmodule
