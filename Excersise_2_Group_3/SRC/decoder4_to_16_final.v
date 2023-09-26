module decoder4_to_16
#(
    parameter n = 4,
    parameter m = 2**n
)
(
input [n-1:0]  enc,
output [m-1:0] dec
);

decoder3_to_8 d0 (enc[n-2:0], enc[n-1],dec[(m/2)-1:0]);
decoder3_to_8 d1 (enc[n-2:0], !enc[n-1],dec[m-1:(m/2)]); //Ta enable einai anapoda giati to shma einai arnhtikhs logikhs 



endmodule
