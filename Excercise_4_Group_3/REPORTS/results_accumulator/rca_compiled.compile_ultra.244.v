/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 15:17:09 2023
/////////////////////////////////////////////////////////////


module accumulator ( clk, rstn, pl, din, sum, ready );
  input [31:0] din;
  output [9:0] sum;
  input clk, rstn, pl;
  output ready;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, \summands/ff[0][0] ,
         \summands/ff[0][1] , \summands/ff[0][2] , \summands/ff[0][3] ,
         \summands/ff[0][4] , \summands/ff[0][5] , \summands/ff[0][6] ,
         \summands/ff[0][7] , n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169;

  ASYNC_DFFHx1_ASAP7_75t_R ready_reg_reg ( .D(n63), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(ready) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[9]  ( .D(N22), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n62) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[8]  ( .D(N21), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n61) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[7]  ( .D(N20), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n60) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[6]  ( .D(N19), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n59) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[5]  ( .D(N18), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n58) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[4]  ( .D(N17), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n57) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[3]  ( .D(N16), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n56) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[2]  ( .D(N15), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n55) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[1]  ( .D(N14), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n54) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[0]  ( .D(N13), .CLK(clk), .RESET(n21), 
        .SET(n88), .QN(n53) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][0]  ( .D(n86), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n52) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][1]  ( .D(n85), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n51) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][2]  ( .D(n84), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n50) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][3]  ( .D(n83), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n49) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][4]  ( .D(n82), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n48) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][5]  ( .D(n81), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n47) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][6]  ( .D(n80), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n46) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[2][7]  ( .D(n79), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n45) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][0]  ( .D(n78), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n44) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][1]  ( .D(n77), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n43) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][2]  ( .D(n76), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n42) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][3]  ( .D(n75), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n41) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][4]  ( .D(n74), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n40) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][5]  ( .D(n73), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n39) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][6]  ( .D(n72), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n38) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[1][7]  ( .D(n87), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n37) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][0]  ( .D(n71), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n36) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[0]  ( .D(\summands/ff[0][0] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n35) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][1]  ( .D(n70), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n34) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[1]  ( .D(\summands/ff[0][1] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n33) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][2]  ( .D(n69), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n32) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[2]  ( .D(\summands/ff[0][2] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n31) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][3]  ( .D(n68), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n30) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[3]  ( .D(\summands/ff[0][3] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n29) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][4]  ( .D(n67), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n28) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[4]  ( .D(\summands/ff[0][4] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n27) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][5]  ( .D(n66), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n26) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[5]  ( .D(\summands/ff[0][5] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n25) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][6]  ( .D(n65), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n24) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[6]  ( .D(\summands/ff[0][6] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n23) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/ff_reg[0][7]  ( .D(n64), .CLK(clk), 
        .RESET(n21), .SET(n88), .QN(n22) );
  ASYNC_DFFHx1_ASAP7_75t_R \summands/so_reg[7]  ( .D(\summands/ff[0][7] ), 
        .CLK(clk), .RESET(n21), .SET(n88), .QN(n20) );
  NOR2xp33_ASAP7_75t_R U85 ( .A(n169), .B(n96), .Y(N22) );
  INVxp33_ASAP7_75t_R U86 ( .A(n61), .Y(sum[8]) );
  AND2x4_ASAP7_75t_R U87 ( .A(pl), .B(ready), .Y(n169) );
  NAND2xp33_ASAP7_75t_R U88 ( .A(n58), .B(n25), .Y(n150) );
  NAND2xp33_ASAP7_75t_R U89 ( .A(n54), .B(n33), .Y(n107) );
  NAND2xp33_ASAP7_75t_R U90 ( .A(n56), .B(n29), .Y(n89) );
  NAND2xp33_ASAP7_75t_R U91 ( .A(n57), .B(n27), .Y(n149) );
  NAND2xp33_ASAP7_75t_R U92 ( .A(n60), .B(n20), .Y(n92) );
  NOR2xp33_ASAP7_75t_R U93 ( .A(n53), .B(n35), .Y(n123) );
  INVxp33_ASAP7_75t_R U94 ( .A(n89), .Y(n129) );
  OAI21xp33_ASAP7_75t_R U95 ( .A1(n134), .A2(n133), .B(n132), .Y(n135) );
  INVxp33_ASAP7_75t_R U96 ( .A(n131), .Y(n132) );
  INVxp33_ASAP7_75t_R U97 ( .A(n150), .Y(n151) );
  AOI21xp33_ASAP7_75t_R U98 ( .A1(n160), .A2(n149), .B(n148), .Y(n154) );
  AOI21xp33_ASAP7_75t_R U99 ( .A1(n160), .A2(n159), .B(n158), .Y(n164) );
  INVxp33_ASAP7_75t_R U100 ( .A(n157), .Y(n159) );
  INVxp33_ASAP7_75t_R U101 ( .A(n92), .Y(n142) );
  AOI21xp33_ASAP7_75t_R U102 ( .A1(n141), .A2(n160), .B(n140), .Y(n145) );
  NAND2xp33_ASAP7_75t_R U103 ( .A(n150), .B(n149), .Y(n157) );
  INVxp33_ASAP7_75t_R U104 ( .A(n161), .Y(n139) );
  INVxp33_ASAP7_75t_R U105 ( .A(n22), .Y(\summands/ff[0][7] ) );
  OAI21xp33_ASAP7_75t_R U106 ( .A1(n169), .A2(n37), .B(n105), .Y(n64) );
  INVxp33_ASAP7_75t_R U107 ( .A(n24), .Y(\summands/ff[0][6] ) );
  OAI21xp33_ASAP7_75t_R U108 ( .A1(n169), .A2(n38), .B(n100), .Y(n65) );
  NAND2xp33_ASAP7_75t_R U109 ( .A(din[14]), .B(n169), .Y(n100) );
  INVxp33_ASAP7_75t_R U110 ( .A(n26), .Y(\summands/ff[0][5] ) );
  OAI21xp33_ASAP7_75t_R U111 ( .A1(n169), .A2(n39), .B(n103), .Y(n66) );
  NAND2xp33_ASAP7_75t_R U112 ( .A(din[13]), .B(n169), .Y(n103) );
  INVxp33_ASAP7_75t_R U113 ( .A(n28), .Y(\summands/ff[0][4] ) );
  OAI21xp33_ASAP7_75t_R U114 ( .A1(n169), .A2(n40), .B(n101), .Y(n67) );
  NAND2xp33_ASAP7_75t_R U115 ( .A(din[12]), .B(n169), .Y(n101) );
  INVxp33_ASAP7_75t_R U116 ( .A(n30), .Y(\summands/ff[0][3] ) );
  OAI21xp33_ASAP7_75t_R U117 ( .A1(n169), .A2(n41), .B(n99), .Y(n68) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(din[11]), .B(n169), .Y(n99) );
  INVxp33_ASAP7_75t_R U119 ( .A(n32), .Y(\summands/ff[0][2] ) );
  OAI21xp33_ASAP7_75t_R U120 ( .A1(n169), .A2(n42), .B(n98), .Y(n69) );
  NAND2xp33_ASAP7_75t_R U121 ( .A(din[10]), .B(n169), .Y(n98) );
  INVxp33_ASAP7_75t_R U122 ( .A(n34), .Y(\summands/ff[0][1] ) );
  OAI21xp33_ASAP7_75t_R U123 ( .A1(n169), .A2(n43), .B(n104), .Y(n70) );
  NAND2xp33_ASAP7_75t_R U124 ( .A(din[9]), .B(n169), .Y(n104) );
  INVxp33_ASAP7_75t_R U125 ( .A(n36), .Y(\summands/ff[0][0] ) );
  OAI21xp33_ASAP7_75t_R U126 ( .A1(n169), .A2(n44), .B(n102), .Y(n71) );
  NAND2xp33_ASAP7_75t_R U127 ( .A(din[8]), .B(n169), .Y(n102) );
  OAI21xp33_ASAP7_75t_R U128 ( .A1(n45), .A2(n169), .B(n117), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U129 ( .A(din[23]), .B(n169), .Y(n117) );
  OAI21xp33_ASAP7_75t_R U130 ( .A1(n46), .A2(n169), .B(n115), .Y(n72) );
  NAND2xp33_ASAP7_75t_R U131 ( .A(din[22]), .B(n169), .Y(n115) );
  OAI21xp33_ASAP7_75t_R U132 ( .A1(n47), .A2(n169), .B(n113), .Y(n73) );
  NAND2xp33_ASAP7_75t_R U133 ( .A(din[21]), .B(n169), .Y(n113) );
  OAI21xp33_ASAP7_75t_R U134 ( .A1(n48), .A2(n169), .B(n116), .Y(n74) );
  NAND2xp33_ASAP7_75t_R U135 ( .A(din[20]), .B(n169), .Y(n116) );
  OAI21xp33_ASAP7_75t_R U136 ( .A1(n49), .A2(n169), .B(n119), .Y(n75) );
  NAND2xp33_ASAP7_75t_R U137 ( .A(din[19]), .B(n169), .Y(n119) );
  OAI21xp33_ASAP7_75t_R U138 ( .A1(n50), .A2(n169), .B(n118), .Y(n76) );
  NAND2xp33_ASAP7_75t_R U139 ( .A(din[18]), .B(n169), .Y(n118) );
  OAI21xp33_ASAP7_75t_R U140 ( .A1(n51), .A2(n169), .B(n106), .Y(n77) );
  NAND2xp33_ASAP7_75t_R U141 ( .A(din[17]), .B(n169), .Y(n106) );
  OAI21xp33_ASAP7_75t_R U142 ( .A1(n52), .A2(n169), .B(n114), .Y(n78) );
  OAI21xp33_ASAP7_75t_R U143 ( .A1(n112), .A2(n169), .B(n111), .Y(N14) );
  NAND2xp33_ASAP7_75t_R U144 ( .A(din[1]), .B(n169), .Y(n111) );
  OAI21xp33_ASAP7_75t_R U145 ( .A1(n122), .A2(n169), .B(n121), .Y(N15) );
  NAND2xp33_ASAP7_75t_R U146 ( .A(din[2]), .B(n169), .Y(n121) );
  OAI21xp33_ASAP7_75t_R U147 ( .A1(n138), .A2(n169), .B(n137), .Y(N16) );
  OAI21xp33_ASAP7_75t_R U148 ( .A1(n128), .A2(n169), .B(n127), .Y(N17) );
  NAND2xp33_ASAP7_75t_R U149 ( .A(din[4]), .B(n169), .Y(n127) );
  OAI21xp33_ASAP7_75t_R U150 ( .A1(n156), .A2(n169), .B(n155), .Y(N18) );
  NAND2xp33_ASAP7_75t_R U151 ( .A(din[5]), .B(n169), .Y(n155) );
  OAI21xp33_ASAP7_75t_R U152 ( .A1(n166), .A2(n169), .B(n165), .Y(N19) );
  NAND2xp33_ASAP7_75t_R U153 ( .A(din[6]), .B(n169), .Y(n165) );
  OAI21xp33_ASAP7_75t_R U154 ( .A1(n147), .A2(n169), .B(n146), .Y(N20) );
  NAND2xp33_ASAP7_75t_R U155 ( .A(din[7]), .B(n169), .Y(n146) );
  NAND2xp33_ASAP7_75t_R U156 ( .A(n97), .B(ready), .Y(n63) );
  INVxp33_ASAP7_75t_R U157 ( .A(pl), .Y(n97) );
  INVx2_ASAP7_75t_R U158 ( .A(rstn), .Y(n88) );
  INVxp33_ASAP7_75t_R U159 ( .A(n107), .Y(n108) );
  INVxp33_ASAP7_75t_R U160 ( .A(n149), .Y(n125) );
  NAND2xp33_ASAP7_75t_R U161 ( .A(din[15]), .B(n169), .Y(n105) );
  NAND2xp33_ASAP7_75t_R U162 ( .A(din[16]), .B(n169), .Y(n114) );
  NAND2xp33_ASAP7_75t_R U163 ( .A(din[3]), .B(n169), .Y(n137) );
  INVxp33_ASAP7_75t_R U164 ( .A(n53), .Y(sum[0]) );
  TIELOx1_ASAP7_75t_R U165 ( .L(n21) );
  NOR2xp33_ASAP7_75t_R U166 ( .A(n57), .B(n27), .Y(n148) );
  NOR2xp33_ASAP7_75t_R U167 ( .A(n58), .B(n25), .Y(n152) );
  AO21x1_ASAP7_75t_R U168 ( .A1(n148), .A2(n150), .B(n152), .Y(n158) );
  AND2x2_ASAP7_75t_R U169 ( .A(n59), .B(n23), .Y(n161) );
  NOR2xp33_ASAP7_75t_R U170 ( .A(n59), .B(n23), .Y(n162) );
  AOI21xp5_ASAP7_75t_R U171 ( .A1(n158), .A2(n139), .B(n162), .Y(n94) );
  NOR2xp33_ASAP7_75t_R U172 ( .A(n54), .B(n33), .Y(n109) );
  AOI21x1_ASAP7_75t_R U173 ( .A1(n107), .A2(n123), .B(n109), .Y(n133) );
  AND2x2_ASAP7_75t_R U174 ( .A(n55), .B(n31), .Y(n134) );
  OR2x2_ASAP7_75t_R U175 ( .A(n129), .B(n134), .Y(n91) );
  NOR2xp33_ASAP7_75t_R U176 ( .A(n55), .B(n31), .Y(n131) );
  NOR2xp33_ASAP7_75t_R U177 ( .A(n56), .B(n29), .Y(n130) );
  AOI21xp33_ASAP7_75t_R U178 ( .A1(n89), .A2(n131), .B(n130), .Y(n90) );
  OAI21x1_ASAP7_75t_R U179 ( .A1(n133), .A2(n91), .B(n90), .Y(n160) );
  NOR2xp33_ASAP7_75t_R U180 ( .A(n161), .B(n157), .Y(n141) );
  NOR2xp33_ASAP7_75t_R U181 ( .A(n60), .B(n20), .Y(n143) );
  AOI31xp67_ASAP7_75t_R U182 ( .A1(n160), .A2(n141), .A3(n92), .B(n143), .Y(
        n93) );
  OAI21x1_ASAP7_75t_R U183 ( .A1(n142), .A2(n94), .B(n93), .Y(n167) );
  NAND2x1_ASAP7_75t_R U184 ( .A(sum[8]), .B(n167), .Y(n95) );
  XNOR2xp5_ASAP7_75t_R U185 ( .A(n62), .B(n95), .Y(n96) );
  INVxp33_ASAP7_75t_R U186 ( .A(n54), .Y(sum[1]) );
  INVxp33_ASAP7_75t_R U187 ( .A(n56), .Y(sum[3]) );
  INVxp33_ASAP7_75t_R U188 ( .A(n57), .Y(sum[4]) );
  INVxp33_ASAP7_75t_R U189 ( .A(n58), .Y(sum[5]) );
  INVxp33_ASAP7_75t_R U190 ( .A(n55), .Y(sum[2]) );
  INVxp33_ASAP7_75t_R U191 ( .A(n59), .Y(sum[6]) );
  INVxp33_ASAP7_75t_R U192 ( .A(n60), .Y(sum[7]) );
  INVxp33_ASAP7_75t_R U193 ( .A(n62), .Y(sum[9]) );
  NOR2xp33_ASAP7_75t_R U194 ( .A(n109), .B(n108), .Y(n110) );
  XNOR2xp5_ASAP7_75t_R U195 ( .A(n123), .B(n110), .Y(n112) );
  NOR2xp33_ASAP7_75t_R U196 ( .A(n131), .B(n134), .Y(n120) );
  XOR2xp5_ASAP7_75t_R U197 ( .A(n133), .B(n120), .Y(n122) );
  AOI211xp5_ASAP7_75t_R U198 ( .A1(n35), .A2(n53), .B(n123), .C(n169), .Y(n124) );
  AO21x1_ASAP7_75t_R U199 ( .A1(n169), .A2(din[0]), .B(n124), .Y(N13) );
  NOR2xp33_ASAP7_75t_R U200 ( .A(n148), .B(n125), .Y(n126) );
  XNOR2xp5_ASAP7_75t_R U201 ( .A(n126), .B(n160), .Y(n128) );
  NOR2xp33_ASAP7_75t_R U202 ( .A(n130), .B(n129), .Y(n136) );
  XNOR2xp5_ASAP7_75t_R U203 ( .A(n136), .B(n135), .Y(n138) );
  AO21x1_ASAP7_75t_R U204 ( .A1(n158), .A2(n139), .B(n162), .Y(n140) );
  NOR2xp33_ASAP7_75t_R U205 ( .A(n143), .B(n142), .Y(n144) );
  XOR2xp5_ASAP7_75t_R U206 ( .A(n145), .B(n144), .Y(n147) );
  NOR2xp33_ASAP7_75t_R U207 ( .A(n152), .B(n151), .Y(n153) );
  XOR2xp5_ASAP7_75t_R U208 ( .A(n154), .B(n153), .Y(n156) );
  NOR2xp33_ASAP7_75t_R U209 ( .A(n162), .B(n161), .Y(n163) );
  XOR2xp5_ASAP7_75t_R U210 ( .A(n164), .B(n163), .Y(n166) );
  XNOR2xp5_ASAP7_75t_R U211 ( .A(sum[8]), .B(n167), .Y(n168) );
  NOR2xp33_ASAP7_75t_R U212 ( .A(n169), .B(n168), .Y(N21) );
  AND2x2_ASAP7_75t_R U213 ( .A(n169), .B(din[24]), .Y(n86) );
  AND2x2_ASAP7_75t_R U214 ( .A(n169), .B(din[25]), .Y(n85) );
  AND2x2_ASAP7_75t_R U215 ( .A(n169), .B(din[26]), .Y(n84) );
  AND2x2_ASAP7_75t_R U216 ( .A(n169), .B(din[27]), .Y(n83) );
  AND2x2_ASAP7_75t_R U217 ( .A(n169), .B(din[28]), .Y(n82) );
  AND2x2_ASAP7_75t_R U218 ( .A(n169), .B(din[29]), .Y(n81) );
  AND2x2_ASAP7_75t_R U219 ( .A(n169), .B(din[30]), .Y(n80) );
  AND2x2_ASAP7_75t_R U220 ( .A(n169), .B(din[31]), .Y(n79) );
endmodule

