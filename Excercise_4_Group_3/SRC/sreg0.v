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

  reg [n*width-1:0] ff;

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      ff <= {(n*width){1'b0}};
    end
    else begin
      if (pl) ff <= din;
      else if (en) ff <= {si, ff[n*width-1:width]};
    end
  end

    always @ (posedge clk or negedge rstn) begin
      if (!rstn) begin
        so <= {width{1'b0}};
      end
      else begin
        if (en) so <= ff[width-1:0];
    end
  end

endmodule
