/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 15:20:53 2023
/////////////////////////////////////////////////////////////


module vmcoffee ( C5, C10, NFC, WATER, BEANS, clk, rst, COFFEE, ERROR );
  input [4:0] WATER;
  input C5, C10, NFC, BEANS, clk, rst;
  output COFFEE, ERROR;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29;
  wire   [1:0] state;

  DFFHQNx1_ASAP7_75t_R \state_reg[0]  ( .D(n16), .CLK(clk), .QN(state[0]) );
  DFFHQNx1_ASAP7_75t_R \state_reg[1]  ( .D(n15), .CLK(clk), .QN(state[1]) );
  AOI21xp33_ASAP7_75t_R U21 ( .A1(NFC), .A2(C10), .B(C5), .Y(n22) );
  AOI21xp33_ASAP7_75t_R U22 ( .A1(state[0]), .A2(n27), .B(n19), .Y(n21) );
  OR3x1_ASAP7_75t_R U23 ( .A(WATER[3]), .B(WATER[1]), .C(WATER[0]), .Y(n17) );
  OAI31xp33_ASAP7_75t_R U24 ( .A1(WATER[4]), .A2(WATER[2]), .A3(n17), .B(BEANS), .Y(n23) );
  INVxp33_ASAP7_75t_R U25 ( .A(C5), .Y(n18) );
  NOR4xp25_ASAP7_75t_R U26 ( .A(C10), .B(NFC), .C(n23), .D(n18), .Y(n27) );
  INVxp33_ASAP7_75t_R U27 ( .A(state[1]), .Y(n28) );
  O2A1O1Ixp33_ASAP7_75t_R U28 ( .A1(state[0]), .A2(n27), .B(n28), .C(n23), .Y(
        n19) );
  INVxp33_ASAP7_75t_R U29 ( .A(rst), .Y(n20) );
  NAND2xp33_ASAP7_75t_R U30 ( .A(n21), .B(n20), .Y(n16) );
  INVxp33_ASAP7_75t_R U31 ( .A(state[0]), .Y(n29) );
  O2A1O1Ixp33_ASAP7_75t_R U32 ( .A1(NFC), .A2(C10), .B(n22), .C(state[0]), .Y(
        n25) );
  INVxp33_ASAP7_75t_R U33 ( .A(n23), .Y(n24) );
  O2A1O1Ixp33_ASAP7_75t_R U34 ( .A1(state[1]), .A2(n25), .B(n24), .C(rst), .Y(
        n26) );
  OAI31xp33_ASAP7_75t_R U35 ( .A1(n27), .A2(state[1]), .A3(n29), .B(n26), .Y(
        n15) );
  NOR2xp33_ASAP7_75t_R U36 ( .A(state[0]), .B(n28), .Y(COFFEE) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(n29), .B(n28), .Y(ERROR) );
endmodule

