module clk_tampons (i_a,
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


 sg13cmos5l_decap_8 FILLER_0_0 ();
 sg13cmos5l_decap_8 FILLER_0_14 ();
 sg13cmos5l_decap_8 FILLER_0_21 ();
 sg13cmos5l_decap_8 FILLER_0_28 ();
 sg13cmos5l_decap_8 FILLER_0_35 ();
 sg13cmos5l_decap_8 FILLER_0_42 ();
 sg13cmos5l_decap_8 FILLER_0_49 ();
 sg13cmos5l_decap_8 FILLER_0_56 ();
 sg13cmos5l_decap_8 FILLER_0_63 ();
 sg13cmos5l_decap_8 FILLER_0_7 ();
 sg13cmos5l_decap_8 FILLER_0_70 ();
 sg13cmos5l_decap_8 FILLER_0_77 ();
 sg13cmos5l_decap_8 FILLER_1_0 ();
 sg13cmos5l_decap_8 FILLER_1_35 ();
 sg13cmos5l_decap_8 FILLER_1_42 ();
 sg13cmos5l_fill_2 FILLER_1_7 ();
 sg13cmos5l_decap_8 FILLER_1_74 ();
 sg13cmos5l_fill_2 FILLER_1_81 ();
 sg13cmos5l_fill_1 FILLER_1_83 ();
 sg13cmos5l_fill_1 FILLER_1_9 ();
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
    .A(i_a));
 sg13cmos5l_buf_16 u_a1 (.X(o_a1),
    .A(i_a));
 sg13cmos5l_buf_16 u_b0 (.X(o_b0),
    .A(i_b));
 sg13cmos5l_buf_16 u_b1 (.X(o_b1),
    .A(i_b));
endmodule
