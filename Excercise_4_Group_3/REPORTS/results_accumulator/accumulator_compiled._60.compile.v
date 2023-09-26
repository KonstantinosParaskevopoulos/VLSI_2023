/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 12:35:56 2023
/////////////////////////////////////////////////////////////


module accumulator_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n36, n3, n4, n6, n8, n10, n12, n14, n16, n18, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  tri   [9:0] A;

  FAx1_ASAP7_75t_R U1_7 ( .A(A[7]), .B(B[7]), .CI(n6), .CON(n20), .SN(n21) );
  FAx1_ASAP7_75t_R U1_6 ( .A(A[6]), .B(B[6]), .CI(n8), .CON(n22), .SN(n23) );
  FAx1_ASAP7_75t_R U1_5 ( .A(A[5]), .B(B[5]), .CI(n10), .CON(n24), .SN(n25) );
  FAx1_ASAP7_75t_R U1_4 ( .A(A[4]), .B(B[4]), .CI(n12), .CON(n26), .SN(n27) );
  FAx1_ASAP7_75t_R U1_3 ( .A(A[3]), .B(B[3]), .CI(n14), .CON(n28), .SN(n29) );
  FAx1_ASAP7_75t_R U1_2 ( .A(A[2]), .B(B[2]), .CI(n16), .CON(n30), .SN(n31) );
  FAx1_ASAP7_75t_R U1_1 ( .A(A[1]), .B(B[1]), .CI(n18), .CON(n32), .SN(n33) );
  FAx1_ASAP7_75t_R U1_0 ( .A(A[0]), .B(B[0]), .CI(n36), .CON(n34), .SN(n35) );
  XOR2xp5_ASAP7_75t_R U1 ( .A(n4), .B(B[8]), .Y(SUM[8]) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(B[9]), .B(n3), .Y(SUM[9]) );
  INVx1_ASAP7_75t_R U3 ( .A(n20), .Y(n4) );
  INVx1_ASAP7_75t_R U4 ( .A(n34), .Y(n18) );
  INVx1_ASAP7_75t_R U5 ( .A(n32), .Y(n16) );
  INVx1_ASAP7_75t_R U6 ( .A(n30), .Y(n14) );
  INVx1_ASAP7_75t_R U7 ( .A(n28), .Y(n12) );
  INVx1_ASAP7_75t_R U8 ( .A(n26), .Y(n10) );
  INVx1_ASAP7_75t_R U9 ( .A(n24), .Y(n8) );
  INVx1_ASAP7_75t_R U10 ( .A(n22), .Y(n6) );
  AND2x2_ASAP7_75t_R U11 ( .A(B[8]), .B(n4), .Y(n3) );
  INVx1_ASAP7_75t_R U12 ( .A(n21), .Y(SUM[7]) );
  INVx1_ASAP7_75t_R U13 ( .A(n23), .Y(SUM[6]) );
  INVx1_ASAP7_75t_R U14 ( .A(n25), .Y(SUM[5]) );
  INVx1_ASAP7_75t_R U15 ( .A(n27), .Y(SUM[4]) );
  INVx1_ASAP7_75t_R U16 ( .A(n29), .Y(SUM[3]) );
  INVx1_ASAP7_75t_R U17 ( .A(n31), .Y(SUM[2]) );
  INVx1_ASAP7_75t_R U18 ( .A(n33), .Y(SUM[1]) );
  INVx1_ASAP7_75t_R U19 ( .A(n35), .Y(SUM[0]) );
  TIELOx1_ASAP7_75t_R U20 ( .L(n36) );
endmodule


module accumulator ( clk, rstn, pl, din, sum, ready );
  input [31:0] din;
  output [9:0] sum;
  input clk, rstn, pl;
  output ready;
  wire   n24, N4, n27, n28, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40;
  wire   [9:0] newsum;
  tri   clk;
  tri   rstn;
  tri   mypl;
  tri   [7:0] addend;
  tri   n41;
  tri   n42;

  ASYNC_DFFHx1_ASAP7_75t_R ready_reg_reg ( .D(n40), .CLK(clk), .RESET(n24), 
        .SET(N4), .QN(ready) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[0]  ( .D(n37), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[1]  ( .D(n36), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[2]  ( .D(n35), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[3]  ( .D(n34), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[4]  ( .D(n33), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[5]  ( .D(n32), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[5]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[6]  ( .D(n31), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[6]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[7]  ( .D(n30), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[7]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[8]  ( .D(n39), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[8]) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[9]  ( .D(n38), .CLK(clk), .RESET(N4), 
        .SET(n24), .QN(sum[9]) );
  sreg summands ( .clk(clk), .rstn(rstn), .pl(mypl), .en(1'b1), .si({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .din(din[31:8]), .so(
        addend) );
  accumulator_DW01_add_0 add_68 ( .A({n24, n24, addend}), .B(sum), .CI(n24), 
        .SUM(newsum) );
  AND2x2_ASAP7_75t_R C105 ( .A(pl), .B(ready), .Y(mypl) );
  AOI22xp5_ASAP7_75t_R U42 ( .A1(newsum[7]), .A2(n28), .B1(mypl), .B2(din[7]), 
        .Y(n30) );
  AOI22xp5_ASAP7_75t_R U43 ( .A1(newsum[6]), .A2(n28), .B1(din[6]), .B2(mypl), 
        .Y(n31) );
  AOI22xp5_ASAP7_75t_R U44 ( .A1(newsum[5]), .A2(n28), .B1(din[5]), .B2(mypl), 
        .Y(n32) );
  AOI22xp5_ASAP7_75t_R U45 ( .A1(newsum[4]), .A2(n28), .B1(din[4]), .B2(mypl), 
        .Y(n33) );
  AOI22xp5_ASAP7_75t_R U46 ( .A1(newsum[3]), .A2(n28), .B1(din[3]), .B2(mypl), 
        .Y(n34) );
  AOI22xp5_ASAP7_75t_R U47 ( .A1(newsum[2]), .A2(n28), .B1(din[2]), .B2(mypl), 
        .Y(n35) );
  AOI22xp5_ASAP7_75t_R U48 ( .A1(newsum[1]), .A2(n28), .B1(din[1]), .B2(mypl), 
        .Y(n36) );
  AOI22xp5_ASAP7_75t_R U49 ( .A1(newsum[0]), .A2(n28), .B1(din[0]), .B2(mypl), 
        .Y(n37) );
  NAND2xp5_ASAP7_75t_R U50 ( .A(newsum[9]), .B(n28), .Y(n38) );
  NAND2xp5_ASAP7_75t_R U51 ( .A(newsum[8]), .B(n28), .Y(n39) );
  INVx1_ASAP7_75t_R U52 ( .A(mypl), .Y(n28) );
  AOI22xp5_ASAP7_75t_R U53 ( .A1(ready), .A2(n28), .B1(n24), .B2(n27), .Y(n40)
         );
  INVx1_ASAP7_75t_R U54 ( .A(rstn), .Y(N4) );
  TIELOx1_ASAP7_75t_R U55 ( .L(n24) );
  TIEHIx1_ASAP7_75t_R U56 ( .H(n27) );
endmodule

