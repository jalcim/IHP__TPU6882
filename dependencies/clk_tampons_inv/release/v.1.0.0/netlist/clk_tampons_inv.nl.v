module clk_tampons_inv (i_a,
    i_b,
    o_a0,
    o_a1,
    o_b0,
    o_b1);
 input i_a;
 input i_b;
 output o_a0;
 output o_a1;
 output o_b0;
 output o_b1;

 wire w_an;
 wire w_bn;

 sg13cmos5l_decap_8 FILLER_0_0 ();
 sg13cmos5l_decap_8 FILLER_0_34 ();
 sg13cmos5l_decap_8 FILLER_0_41 ();
 sg13cmos5l_fill_2 FILLER_0_48 ();
 sg13cmos5l_fill_2 FILLER_0_7 ();
 sg13cmos5l_decap_8 FILLER_0_75 ();
 sg13cmos5l_fill_2 FILLER_0_82 ();
 sg13cmos5l_decap_8 FILLER_1_0 ();
 sg13cmos5l_decap_4 FILLER_1_14 ();
 sg13cmos5l_fill_2 FILLER_1_18 ();
 sg13cmos5l_decap_8 FILLER_1_26 ();
 sg13cmos5l_decap_8 FILLER_1_33 ();
 sg13cmos5l_decap_8 FILLER_1_40 ();
 sg13cmos5l_decap_8 FILLER_1_47 ();
 sg13cmos5l_decap_4 FILLER_1_54 ();
 sg13cmos5l_fill_1 FILLER_1_58 ();
 sg13cmos5l_decap_8 FILLER_1_65 ();
 sg13cmos5l_decap_8 FILLER_1_7 ();
 sg13cmos5l_decap_8 FILLER_1_72 ();
 sg13cmos5l_decap_4 FILLER_1_79 ();
 sg13cmos5l_fill_1 FILLER_1_83 ();
 sg13cmos5l_fill_2 FILLER_2_0 ();
 sg13cmos5l_decap_8 FILLER_2_27 ();
 sg13cmos5l_decap_4 FILLER_2_34 ();
 sg13cmos5l_fill_2 FILLER_2_38 ();
 sg13cmos5l_decap_8 FILLER_2_65 ();
 sg13cmos5l_decap_8 FILLER_2_72 ();
 sg13cmos5l_decap_4 FILLER_2_79 ();
 sg13cmos5l_fill_1 FILLER_2_83 ();
 sg13cmos5l_decap_8 FILLER_3_0 ();
 sg13cmos5l_decap_8 FILLER_3_14 ();
 sg13cmos5l_decap_8 FILLER_3_21 ();
 sg13cmos5l_decap_8 FILLER_3_28 ();
 sg13cmos5l_decap_8 FILLER_3_35 ();
 sg13cmos5l_decap_8 FILLER_3_42 ();
 sg13cmos5l_decap_8 FILLER_3_49 ();
 sg13cmos5l_decap_8 FILLER_3_56 ();
 sg13cmos5l_decap_8 FILLER_3_63 ();
 sg13cmos5l_decap_8 FILLER_3_7 ();
 sg13cmos5l_decap_8 FILLER_3_70 ();
 sg13cmos5l_decap_8 FILLER_3_77 ();
 sg13cmos5l_buf_16 u_a0 (.X(o_a0),
    .A(w_an));
 sg13cmos5l_buf_16 u_a1 (.X(o_a1),
    .A(w_an));
 sg13cmos5l_inv_4 u_an (.A(i_a),
    .Y(w_an));
 sg13cmos5l_buf_16 u_b0 (.X(o_b0),
    .A(w_bn));
 sg13cmos5l_buf_16 u_b1 (.X(o_b1),
    .A(w_bn));
 sg13cmos5l_inv_4 u_bn (.A(i_b),
    .Y(w_bn));
endmodule
