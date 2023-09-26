`timescale 1ns / 1ps
module shift_reg  #(parameter n=8) (input si,                    // Serial Input
                                    input clk,                   // Clock
                                    input en,                    // Enable
                                    input [n-1:0] din,           // Parallel Input
                                    input rstn,                  // ~Reset
                                    input pl,                    // Parallel Input Enable
                                    output reg so,              // Serial Output
                                    output reg [n-1:0] tempParallelOutput); // Content of Register
    

   always @ (posedge clk, negedge rstn)
    if (!rstn) begin
        tempParallelOutput <= 0;
        so <= 0;
    end
    else begin
        if (!pl) begin                                                  //If Parallel Load is 0 Serial Mode is enabled
            if (en) begin
                so <= tempParallelOutput[0];                            //LSB of Shift Register content goes to Serial Output
                tempParallelOutput <= {si, tempParallelOutput[n-1:1]};  //Shift Register Content is shifted right and Serial Input Becomes the new MSB
            end
            else begin
                tempParallelOutput <= tempParallelOutput;               //If enable is 0 Content of Shift Register remains the same 
            end
        end
        else begin          
            tempParallelOutput <= din;                                  //In Parallel Mode new content of Shift Register is din
        end    
    end
endmodule