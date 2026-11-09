// macc_unit_v2 : boite noire tiree du LEF du bloc (phys/assemblage)
(* blackbox *)
module macc_unit_v2 (
    input i_acc_step,
    input [287:0] i_act,
    input i_bar_lm,
    input i_bar_ls,
    input i_bar_sel,
    input i_clk,
    input i_clk_csa,
    input i_entry_load,
    input i_first,
    input i_head_lm,
    input i_head_ls,
    input i_head_sel,
    input i_phi1,
    input i_phi2,
    input [287:0] i_wgt,
    output [18:0] o_tail);
endmodule
