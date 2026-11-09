# clk_tampons_mix

Clock buffer macro, variant of clk_tampons: i_a -> o_a0, o_a1 non inverted (buf_16), i_b -> o_b0, o_b1 inverted (inv_4 then buf_16). Same frame, pins and rails as clk_tampons. Used for u_cks (CLK_OUT and READY_OUT).
GDS taken from the final GDS; LEF, Liberty, gate netlist, SPICE and Verilog in release/v.1.0.0 and clk_tampons_mix-main/rtl.

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries
