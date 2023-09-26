module Argmax #(
    parameter width = 25 //Dummy Parameter
) (
    input clk, rstn,
    input [width-1:0] in0b,
    input [width-1:0] in1b,
    input [width-1:0] in2b,
    input [width-1:0] in3b,
    input [width-1:0] in4b,
    input [width-1:0] in5b,
    output [width-1:0] max_in
);
    //1st Stage
    reg [width-1:0] comp_0b_1b;
    reg [width-1:0] comp_2b_3b;
    reg [width-1:0] comp_4b_5b;
    //2nd Stage
    reg [width-1:0] comp_0b_1b_2b_3b;
    reg [width-1:0] comp_4b_5b_temp;
    //3rd Stage
    reg [width-1:0] comp_final;

    ////////////////////////////////////////////////////////////////
    //                            Wires                           //
    ////////////////////////////////////////////////////////////////

    //1st Stage Wires
    wire [width-1:0] comp_0b_1b_wire;
    wire [width-1:0] comp_2b_3b_wire;
    wire [width-1:0] comp_4b_5b_wire;
    //2nd Stage Wires
    wire [width-1:0] comp_0b_1b_2b_3b_wire;
    wire [width-1:0] comp_4b_5b_temp_wire;
    //3rd Stage Wires
    wire [width-1:0] comp_final_wire;
    
    ////////////////////////////////////////////////////////////////
    //                      Comparisons                           //
    ////////////////////////////////////////////////////////////////
    
    //1st Stage Comparisons
    assign comp_0b_1b_wire = (in0b>in1b) ? in0b : in1b;
    assign comp_2b_3b_wire = (in2b>in3b) ? in2b : in3b;
    assign comp_4b_5b_wire = (in4b>in5b) ? in4b : in5b;
    //2nd Stage Comparisons
    assign comp_0b_1b_2b_3b_wire = (comp_0b_1b > comp_2b_3b) ? comp_0b_1b : comp_2b_3b;
    assign comp_4b_5b_temp_wire = comp_4b_5b_temp;
    //3rd Stage Comparisons
    assign comp_final_wire = (comp_0b_1b_2b_3b > comp_4b_5b) ? comp_0b_1b_2b_3b : comp_4b_5b;


    ////////////////////////////////////////////////////////////////
    //                      Pipeline Registers                    //
    ////////////////////////////////////////////////////////////////
    //1st Stage Registers 
    always @(posedge clk, negedge rstn)
    begin: first_comparison_stage
        if (!rstn) begin 
            comp_0b_1b <= 'b0;
            comp_2b_3b <= 'b0;
            comp_4b_5b_temp <= 'b0;
        end
        else begin
            comp_0b_1b <= comp_0b_1b_wire;
            comp_2b_3b <= comp_2b_3b_wire;
            comp_4b_5b_temp <= comp_4b_5b_wire;
        end
    end

    //2nd Stage Registers 
    always @(posedge clk, negedge rstn)
    begin: second_comparison_stage
        if (!rstn) begin 
            comp_0b_1b_2b_3b <= 'b0;
            comp_4b_5b <= 'b0;
        end
        else begin
            comp_0b_1b_2b_3b <= comp_0b_1b_2b_3b_wire;
            comp_4b_5b <= comp_4b_5b_temp_wire;
        end
    end

    //3rd Stage Registers 
    always @(posedge clk, negedge rstn)
    begin: third_comparison_stage
        if (!rstn) begin 
            comp_final <= 'b0;
        end
        else begin
            comp_final <= comp_final_wire;
        end
    end

    assign max_in = comp_final;

endmodule

