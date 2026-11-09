// clk_tampons : 4 buf_16 (deux entrees, deux sorties chacune) pour la distribution d'horloge des 37 pad_in de la
// 8-1-6 W64 v2 (option C du coordinateur, 08/11 soir) : i_a -> o_a0, o_a1 (CLK_P) ; i_b -> o_b0, o_b1 (CLK_N).
// Une instance au depart (couronne nord, derriere g_IOVDD[1] / g_IOVSS[1]) et une a chaque point d'alimentation (est, ouest).
`default_nettype none
module clk_tampons (
`ifdef USE_POWER_PINS
    inout wire VDD,
    inout wire VSS,
`endif
    input  wire i_a,
    input  wire i_b,
    output wire o_a0,
    output wire o_a1,
    output wire o_b0,
    output wire o_b1);
    (* keep *) sg13cmos5l_buf_16 u_a0 (.A(i_a), .X(o_a0));
    (* keep *) sg13cmos5l_buf_16 u_a1 (.A(i_a), .X(o_a1));
    (* keep *) sg13cmos5l_buf_16 u_b0 (.A(i_b), .X(o_b0));
    (* keep *) sg13cmos5l_buf_16 u_b1 (.A(i_b), .X(o_b1));
endmodule
`default_nettype wire
