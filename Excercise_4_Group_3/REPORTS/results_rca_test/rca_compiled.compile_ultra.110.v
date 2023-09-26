/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Thu May 11 17:47:33 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \fas[0].fa/N0 , n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign sum_o[0] = \fas[0].fa/N0 ;

  INVxp33_ASAP7_75t_R U17 ( .A(a_i[1]), .Y(n12) );
  INVxp33_ASAP7_75t_R U18 ( .A(b_i[2]), .Y(n16) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(a_i[3]), .B(b_i[3]), .Y(n13) );
  INVxp33_ASAP7_75t_R U20 ( .A(b_i[3]), .Y(n17) );
  INVxp33_ASAP7_75t_R U21 ( .A(a_i[3]), .Y(n18) );
  INVxp33_ASAP7_75t_R U22 ( .A(b_i[1]), .Y(n11) );
  NAND2xp5_ASAP7_75t_R U23 ( .A(a_i[0]), .B(b_i[0]), .Y(n14) );
  XNOR2xp5_ASAP7_75t_R U24 ( .A(n13), .B(n19), .Y(sum_o[3]) );
  MAJIxp5_ASAP7_75t_R U25 ( .A(n14), .B(n12), .C(n11), .Y(n15) );
  MAJIxp5_ASAP7_75t_R U26 ( .A(n15), .B(b_i[2]), .C(a_i[2]), .Y(n19) );
  OA21x2_ASAP7_75t_R U27 ( .A1(a_i[0]), .A2(b_i[0]), .B(n14), .Y(
        \fas[0].fa/N0 ) );
  FAx1_ASAP7_75t_R U28 ( .A(a_i[1]), .B(b_i[1]), .CI(n14), .SN(sum_o[1]) );
  FAx1_ASAP7_75t_R U29 ( .A(a_i[2]), .B(n16), .CI(n15), .SN(sum_o[2]) );
  MAJIxp5_ASAP7_75t_R U30 ( .A(n19), .B(n18), .C(n17), .Y(sum_o[4]) );
endmodule

