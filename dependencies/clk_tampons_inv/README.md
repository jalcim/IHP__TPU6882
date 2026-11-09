# clk_tampons_inv

Clock buffer macro, variant of clk_tampons with inverting paths: i_a -> o_a0, o_a1 and i_b -> o_b0, o_b1 inverted (inv_4 then buf_16). Same frame, pins and rails as clk_tampons. Used for u_ckd and u_ckc on CLK_P / CLK_N.
GDS taken from the final GDS; LEF, Liberty, gate netlist, SPICE and Verilog in release/v.1.0.0 and clk_tampons_inv-main/rtl.

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries
