module tb_shift_reg;
   parameter len = 16;        // New Length of Shift Register
 
        reg si;                    // Serial Input
        reg clk;                   // Clock
        reg en;                    // Enable
        reg [len-1:0] din;           // Parallel Input
        reg rstn;                  // ~Reset
        reg pl;                    // Parallel Input Enable
        wire so;                   // Serial Output
        wire [len-1:0] tempParallelOutput;
   // Instantiate design (16-bit shift register) by passing len and connect with TestBench signals
   shift_reg  #(len) shift_reg0  (  .si (si),
                                    .clk (clk),
                                    .en (en),
                                    .din (din),
                                    .rstn (rstn),
                                    .pl (pl),
                                    .so (so),
                                    .tempParallelOutput (tempParallelOutput));
 
   //clock time period = 10ns (`timescale 1ns / 1ps)
   always #5 clk = ~clk;
 
   // Initialize variables to default values at time 0
   initial begin
      clk <= 0;
      en <= 1'b0;
      din <= 0;
      si <= 1'b0;
      pl <= 1'b0;
   end
 
   initial begin
 
      rstn <= 1'b0;     //Reset Circuit for 20ns
      #20 rstn <= 1;
          en <= 1;
 
    // For 7 clocks, drive alternate values to data pin
      repeat (10) @ (posedge clk)
         si <= ~si;
 
 
      //Drive nothing for next 7 clocks, allow shift register to simply shift
        repeat (10) @ (posedge clk);
      
    //Parallel Load Mode Test
        pl <= 1'b1;
        din <= 16'hff00; //Parallel Load Value 1111111100000000 in binary
        #20 pl <= 1'b0;
    //Drive nothing for next 7 clocks, allow shift register to simply shift
        
        repeat (10) @ (posedge clk);
      //Finish the simulation
      $finish;
   end
 
   // Monitor values of these variables and print them into the logfile for debug
   initial begin
      $monitor ("rstn=%0b din=%b, en=%0b, pl=%b, out=%b, in=%b, Register Content=%b", rstn, din, en, pl, so, si, tempParallelOutput);
  	  $dumpvars;
      $dumpfile("dump.vcd");
   end
endmodule