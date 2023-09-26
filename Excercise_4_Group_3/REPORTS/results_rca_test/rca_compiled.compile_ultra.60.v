/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Thu May 11 17:51:08 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \fas[0].fa/N0 , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30;
  assign sum_o[0] = \fas[0].fa/N0 ;

  INVx1_ASAP7_75t_R U17 ( .A(a_i[2]), .Y(n16) );
  NAND2xp5_ASAP7_75t_R U18 ( .A(a_i[0]), .B(b_i[0]), .Y(n12) );
  INVxp67_ASAP7_75t_R U19 ( .A(a_i[3]), .Y(n26) );
  INVxp67_ASAP7_75t_R U20 ( .A(b_i[3]), .Y(n27) );
  HB1xp67_ASAP7_75t_R U21 ( .A(n29), .Y(n11) );
  NAND2x1p5_ASAP7_75t_R U22 ( .A(a_i[0]), .B(b_i[0]), .Y(n30) );
  NOR2x1p5_ASAP7_75t_R U23 ( .A(n13), .B(n30), .Y(n20) );
  NOR2x1p5_ASAP7_75t_R U24 ( .A(b_i[1]), .B(a_i[1]), .Y(n13) );
  NOR2xp33_ASAP7_75t_R U25 ( .A(b_i[2]), .B(a_i[2]), .Y(n24) );
  INVxp33_ASAP7_75t_R U26 ( .A(n24), .Y(n25) );
  INVx1_ASAP7_75t_R U27 ( .A(b_i[2]), .Y(n15) );
  OAI21xp33_ASAP7_75t_R U28 ( .A1(a_i[3]), .A2(b_i[3]), .B(n25), .Y(n28) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(a_i[3]), .B(b_i[3]), .Y(n19) );
  NAND2x1p5_ASAP7_75t_R U30 ( .A(a_i[1]), .B(b_i[1]), .Y(n14) );
  OAI21x1_ASAP7_75t_R U31 ( .A1(n16), .A2(n15), .B(n14), .Y(n17) );
  NOR2x1p5_ASAP7_75t_R U32 ( .A(n20), .B(n17), .Y(n29) );
  NOR2x1_ASAP7_75t_R U33 ( .A(n24), .B(n29), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U34 ( .A(n18), .B(n19), .Y(sum_o[3]) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(b_i[2]), .B(a_i[2]), .Y(n23) );
  AND2x2_ASAP7_75t_R U36 ( .A(a_i[1]), .B(b_i[1]), .Y(n21) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(n20), .B(n21), .Y(n22) );
  XNOR2xp5_ASAP7_75t_R U38 ( .A(n23), .B(n22), .Y(sum_o[2]) );
  OAI22xp33_ASAP7_75t_R U39 ( .A1(n11), .A2(n28), .B1(n27), .B2(n26), .Y(
        sum_o[4]) );
  OA21x2_ASAP7_75t_R U40 ( .A1(a_i[0]), .A2(b_i[0]), .B(n12), .Y(
        \fas[0].fa/N0 ) );
  FAx1_ASAP7_75t_R U41 ( .A(b_i[1]), .B(a_i[1]), .CI(n12), .SN(sum_o[1]) );
endmodule

