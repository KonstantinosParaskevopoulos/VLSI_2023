module decoder4_to_16
#(
    parameter n = 4,
    parameter m = 2**n
)
(
input [n-1:0]  enc,
input en,
output [m-1:0] dec
);

assign dec[0] = (!enc[3]&&!enc[2]&&!enc[1]&&!enc[0])&&!en;
assign dec[1] = (!enc[3]&&!enc[2]&&!enc[1]&& enc[0])&&!en;
assign dec[2] = (!enc[3]&&!enc[2]&& enc[1]&&!enc[0])&&!en;
assign dec[3] = (!enc[3]&&!enc[2]&& enc[1]&& enc[0])&&!en;
assign dec[4] = (!enc[3]&& enc[2]&&!enc[1]&&!enc[0])&&!en;
assign dec[5] = (!enc[3]&& enc[2]&&!enc[1]&& enc[0])&&!en;
assign dec[6] = (!enc[3]&& enc[2]&& enc[1]&&!enc[0])&&!en;
assign dec[7] = (!enc[3]&& enc[2]&& enc[1]&& enc[0])&&!en;
assign dec[8] = ( enc[3]&&!enc[2]&&!enc[1]&&!enc[0])&&!en;
assign dec[9] = ( enc[3]&&!enc[2]&&!enc[1]&& enc[0])&&!en;
assign dec[10] =( enc[3]&&!enc[2]&& enc[1]&&!enc[0])&&!en;
assign dec[11] =( enc[3]&&!enc[2]&& enc[1]&& enc[0])&&!en;
assign dec[12] =( enc[3]&& enc[2]&&!enc[1]&&!enc[0])&&!en;
assign dec[13] =( enc[3]&& enc[2]&&!enc[1]&& enc[0])&&!en;
assign dec[14] =( enc[3]&& enc[2]&& enc[1]&&!enc[0])&&!en;
assign dec[15] =( enc[3]&& enc[2]&& enc[1]&& enc[0])&&!en;

endmodule
