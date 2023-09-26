module double_counter (
    input clk,
    input rst,
    output reg [2:0] c0,
    output reg [15:0] c1
    );



initial begin
    c0 = 0;
    c1 = 2;
end

always @ (posedge clk or negedge rst) begin
    if (!rst) begin 
        c0 <= 0;
        c1 <= 2;
    end
    else begin
        if (c0 == 7) begin
        c0 <= 1;
        if (c1 == 65535) begin
            c1 <= 2;
            c0 <= 0;
        end
        else begin
            c1 <= c1 + 1;
        end
    end
    else begin
        c0 <= c0 + 1;
    end
    end
end
endmodule

