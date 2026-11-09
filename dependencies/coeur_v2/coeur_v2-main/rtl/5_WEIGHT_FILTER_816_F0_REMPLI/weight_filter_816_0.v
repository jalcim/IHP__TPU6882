`ifndef __WEIGHT_FILTER_816_0__
`define __WEIGHT_FILTER_816_0__
`include "weight_filter_816_0_b0.v"
`include "weight_filter_816_0_b1.v"
`include "weight_filter_816_0_b2.v"
`include "weight_filter_816_0_b3.v"
`include "weight_filter_816_0_b4.v"
/* weight_filter_816_0 : IP REPLIEE du filtre 0 de l'accord 816 (pile_5.py -replie) : 5 bandes d'un mot, bande 0 (le mot
 * d'entree) au sud ; bandes paires zag (chargeur vers l'ouest), impaires zig (vers l'est) ; o_loader de la bande s ->
 * i_wgt_cache_data de la bande s + 1 (saut au bout de la bande). Pistes et bits : ceux de l'IP a plat. */
(* blackbox *)
module weight_filter_816_0 (input i_phi1, input i_phi2, input i_wgt_cache_valid, input i_chain_shift, input i_wgt_rot, input i_wgt_xfer, input [63:0] i_wgt_cache_data, output [63:0] o_loader, output [287:0] o_wgt_head);
`ifndef SYNTHESIS
    wire [63:0] w_saut [0:5];
    assign w_saut[0] = i_wgt_cache_data;
    assign o_loader = w_saut[5];
    wire [287:0] h_0;
    weight_filter_816_0_b0 u_b0 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_saut[0]), .o_loader(w_saut[1]), .o_wgt_head(h_0));
    assign o_wgt_head[287:256] = h_0[287:256];
    wire [287:0] h_1;
    weight_filter_816_0_b1 u_b1 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_saut[1]), .o_loader(w_saut[2]), .o_wgt_head(h_1));
    assign o_wgt_head[255:192] = h_1[255:192];
    wire [287:0] h_2;
    weight_filter_816_0_b2 u_b2 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_saut[2]), .o_loader(w_saut[3]), .o_wgt_head(h_2));
    assign o_wgt_head[191:128] = h_2[191:128];
    wire [287:0] h_3;
    weight_filter_816_0_b3 u_b3 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_saut[3]), .o_loader(w_saut[4]), .o_wgt_head(h_3));
    assign o_wgt_head[127:64] = h_3[127:64];
    wire [287:0] h_4;
    weight_filter_816_0_b4 u_b4 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_saut[4]), .o_loader(w_saut[5]), .o_wgt_head(h_4));
    assign o_wgt_head[63:0] = h_4[63:0];
`endif
endmodule
`endif
