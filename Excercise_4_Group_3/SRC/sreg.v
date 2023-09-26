module sreg #(
  parameter n = 4,
  parameter width = 1
)(
  input clk, rstn,
  input pl, en,
  input [width-1:0] si,
  input [n*width-1:0] din,
  output reg [width-1:0] so
);

  reg [width-1:0] ff [n-1:0];
  wire [width-1:0] shift [n-1:0];

  genvar i;
  generate
    for (i=0; i<n-1; i=i+1) begin:shiftval
        assign shift[i] = ff[i+1];
    end
    assign shift[n-1] = si; 
    for (i=0; i<n; i=i+1) begin: genff
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
              ff[i] <= {width{1'b0}};
            end
            else begin
                if (pl) ff[i] <= din[(i+1)*width-1:i*width];
                else
                  if (en) ff[i] <= shift[i];
            end
        end
    end
  endgenerate

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      so <= {width{1'b0}};
    end
    else begin
      if (en) so <= ff[0];
    end
  end
endmodule
