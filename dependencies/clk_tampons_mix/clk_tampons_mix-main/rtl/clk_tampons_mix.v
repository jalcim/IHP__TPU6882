// clk_tampons_mix (phys/blocs/clk_tampons_var/gen.py, 09/11) : variante de clk_tampons pour la puce 2e (plots LVCMOS
// 1,8 V, lvcmos_IOPadIn18NH inverseur) : i_a -> o_a0, o_a1 NON inverses (buf_16, comme clk_tampons) ; i_b -> o_b0, o_b1 INVERSES (inv_4 puis buf_16).
// Meme cadre, memes broches, memes rails que clk_tampons (config LibreLane recopiee de phys/blocs/clk_padin).
`default_nettype none
module clk_tampons_mix (
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
    wire w_bn;
    (* keep *) sg13cmos5l_inv_4 u_bn (.A(i_b), .Y(w_bn));
    (* keep *) sg13cmos5l_buf_16 u_b0 (.A(w_bn), .X(o_b0));
    (* keep *) sg13cmos5l_buf_16 u_b1 (.A(w_bn), .X(o_b1));
endmodule
`default_nettype wire
