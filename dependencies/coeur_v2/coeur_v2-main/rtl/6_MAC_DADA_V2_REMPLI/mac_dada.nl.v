module mac_dada (i_act,
    i_wgt,
    o_bits);
 input [3:0] i_act;
 input [3:0] i_wgt;
 output [12:0] o_bits;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire c0_0;
 wire c1_0;
 wire c1_1;
 wire c2_2;
 wire c6_0;
 wire r_3;
 wire r_4;
 wire r_5;
 wire r_6;
 wire u_2;
 wire u_3;
 wire u_4;
 wire u_5;

 sg13cmos5l_fill_1 FILLER_0_0 ();
 sg13cmos5l_fill_2 FILLER_0_17 ();
 sg13cmos5l_fill_2 FILLER_10_17 ();
 sg13cmos5l_fill_2 FILLER_11_0 ();
 sg13cmos5l_decap_8 FILLER_11_11 ();
 sg13cmos5l_fill_1 FILLER_11_18 ();
 sg13cmos5l_decap_8 FILLER_12_0 ();
 sg13cmos5l_decap_4 FILLER_12_14 ();
 sg13cmos5l_fill_1 FILLER_12_18 ();
 sg13cmos5l_decap_8 FILLER_12_7 ();
 sg13cmos5l_decap_4 FILLER_13_0 ();
 sg13cmos5l_fill_2 FILLER_13_17 ();
 sg13cmos5l_fill_1 FILLER_13_4 ();
 sg13cmos5l_fill_1 FILLER_14_18 ();
 sg13cmos5l_fill_1 FILLER_14_5 ();
 sg13cmos5l_fill_2 FILLER_15_0 ();
 sg13cmos5l_decap_8 FILLER_15_10 ();
 sg13cmos5l_fill_2 FILLER_15_17 ();
 sg13cmos5l_fill_1 FILLER_1_0 ();
 sg13cmos5l_fill_1 FILLER_1_18 ();
 sg13cmos5l_fill_1 FILLER_1_9 ();
 sg13cmos5l_fill_1 FILLER_2_18 ();
 sg13cmos5l_fill_2 FILLER_3_16 ();
 sg13cmos5l_fill_1 FILLER_3_18 ();
 sg13cmos5l_fill_1 FILLER_4_0 ();
 sg13cmos5l_decap_4 FILLER_5_0 ();
 sg13cmos5l_decap_8 FILLER_5_11 ();
 sg13cmos5l_fill_1 FILLER_5_18 ();
 sg13cmos5l_fill_1 FILLER_5_4 ();
 sg13cmos5l_fill_2 FILLER_6_17 ();
 sg13cmos5l_fill_1 FILLER_6_5 ();
 sg13cmos5l_decap_4 FILLER_7_13 ();
 sg13cmos5l_fill_2 FILLER_7_17 ();
 sg13cmos5l_fill_1 FILLER_9_6 ();
 sg13cmos5l_and2_1 _18_ (.A(i_act[0]),
    .B(i_wgt[0]),
    .X(c0_0));
 sg13cmos5l_and2_1 _19_ (.A(i_act[0]),
    .B(i_wgt[1]),
    .X(c1_1));
 sg13cmos5l_nand4_1 _20_ (.B(i_wgt[1]),
    .C(i_act[2]),
    .A(i_wgt[0]),
    .Y(_04_),
    .D(i_act[3]));
 sg13cmos5l_nor2b_1 _21_ (.A(_03_),
    .B_N(_04_),
    .Y(_05_));
 sg13cmos5l_nand2b_1 _22_ (.Y(_06_),
    .B(_05_),
    .A_N(_02_));
 sg13cmos5l_xor2_1 _23_ (.B(_05_),
    .A(_02_),
    .X(_07_));
 sg13cmos5l_xor2_1 _24_ (.B(_07_),
    .A(_01_),
    .X(u_3));
 sg13cmos5l_o21ai_1 _25_ (.B1(_06_),
    .Y(r_4),
    .A1(_01_),
    .A2(_07_));
 sg13cmos5l_nand2_1 _26_ (.Y(_08_),
    .A(i_act[1]),
    .B(i_wgt[3]));
 sg13cmos5l_nand2_1 _27_ (.Y(_09_),
    .A(i_wgt[1]),
    .B(i_act[3]));
 sg13cmos5l_nand2_1 _28_ (.Y(_10_),
    .A(i_wgt[2]),
    .B(i_act[2]));
 sg13cmos5l_xor2_1 _29_ (.B(_10_),
    .A(_09_),
    .X(_11_));
 sg13cmos5l_and2_1 _30_ (.A(i_act[0]),
    .B(i_wgt[2]),
    .X(c2_2));
 sg13cmos5l_nand2_1 _31_ (.Y(_12_),
    .A(_08_),
    .B(_11_));
 sg13cmos5l_xnor2_1 _32_ (.Y(_13_),
    .A(_08_),
    .B(_11_));
 sg13cmos5l_xor2_1 _33_ (.B(_13_),
    .A(_04_),
    .X(u_4));
 sg13cmos5l_o21ai_1 _34_ (.B1(_12_),
    .Y(r_5),
    .A1(_04_),
    .A2(_13_));
 sg13cmos5l_nand2_1 _35_ (.Y(_14_),
    .A(i_wgt[3]),
    .B(i_act[2]));
 sg13cmos5l_nand2_1 _36_ (.Y(_15_),
    .A(i_wgt[2]),
    .B(i_act[3]));
 sg13cmos5l_a21oi_1 _37_ (.A1(i_wgt[1]),
    .A2(i_act[2]),
    .Y(_16_),
    .B1(_15_));
 sg13cmos5l_xor2_1 _38_ (.B(_16_),
    .A(_14_),
    .X(u_5));
 sg13cmos5l_nor2_1 _39_ (.A(i_wgt[1]),
    .B(_14_),
    .Y(_17_));
 sg13cmos5l_nor2_1 _40_ (.A(_15_),
    .B(_17_),
    .Y(r_6));
 sg13cmos5l_and2_1 _41_ (.A(i_wgt[0]),
    .B(i_act[1]),
    .X(c1_0));
 sg13cmos5l_nand2_1 _42_ (.Y(c6_0),
    .A(i_wgt[3]),
    .B(i_act[3]));
 sg13cmos5l_and3_1 _43_ (.X(r_3),
    .A(i_wgt[1]),
    .B(i_act[2]),
    .C(c1_0));
 sg13cmos5l_a22oi_1 _44_ (.Y(_00_),
    .B1(i_act[2]),
    .B2(i_wgt[0]),
    .A2(i_act[1]),
    .A1(i_wgt[1]));
 sg13cmos5l_nor2_1 _45_ (.A(r_3),
    .B(_00_),
    .Y(u_2));
 sg13cmos5l_and2_1 _46_ (.A(i_act[0]),
    .B(i_wgt[3]),
    .X(_01_));
 sg13cmos5l_nand2_1 _47_ (.Y(_02_),
    .A(i_wgt[2]),
    .B(i_act[1]));
 sg13cmos5l_a22oi_1 _48_ (.Y(_03_),
    .B1(i_act[3]),
    .B2(i_wgt[0]),
    .A2(i_act[2]),
    .A1(i_wgt[1]));
 sg13cmos5l_buf_1 _49_ (.A(c0_0),
    .X(o_bits[0]));
 sg13cmos5l_buf_1 _50_ (.A(c1_0),
    .X(o_bits[1]));
 sg13cmos5l_buf_1 _51_ (.A(c1_1),
    .X(o_bits[2]));
 sg13cmos5l_buf_1 _52_ (.A(u_2),
    .X(o_bits[3]));
 sg13cmos5l_buf_1 _53_ (.A(c2_2),
    .X(o_bits[4]));
 sg13cmos5l_buf_1 _54_ (.A(u_3),
    .X(o_bits[5]));
 sg13cmos5l_buf_1 _55_ (.A(r_3),
    .X(o_bits[6]));
 sg13cmos5l_buf_1 _56_ (.A(u_4),
    .X(o_bits[7]));
 sg13cmos5l_buf_1 _57_ (.A(r_4),
    .X(o_bits[8]));
 sg13cmos5l_buf_1 _58_ (.A(u_5),
    .X(o_bits[9]));
 sg13cmos5l_buf_1 _59_ (.A(r_5),
    .X(o_bits[10]));
 sg13cmos5l_buf_1 _60_ (.A(c6_0),
    .X(o_bits[11]));
 sg13cmos5l_buf_1 _61_ (.A(r_6),
    .X(o_bits[12]));
endmodule
