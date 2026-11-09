`ifndef __WEIGHT_RING_DATA_PHYS_816__
`define __WEIGHT_RING_DATA_PHYS_816__
`ifdef BOURRAGE_FIL
`include "weight_filter_816_0_fil.v"
`else
`include "weight_filter_816_0.v"
`endif
/* weight_ring_data_phys_816 : weight_ring_data.v (rtl/5_weights) en IP de filtre, en phases ; ecrit par pile_5.py.
 * IP K - 1 a l'est (le mot d'entree, le bourrage), IP 0 a l'ouest (r_loader[0]). Ordre direct : voir verilog_anneau(). */
module weight_ring_data_phys_816 (i_phi1, i_phi2, i_wgt_cache_data, i_wgt_cache_valid, i_chain_shift, i_wgt_xfer, i_wgt_rot, o_wgt_head, o_loader);
`include "decoupage_816.vh"
    input i_phi1, i_phi2, i_wgt_cache_valid, i_chain_shift, i_wgt_xfer, i_wgt_rot;
    input  [MOT_BITS-1:0] i_wgt_cache_data;
    output [GROUPE_BITS-1:0] o_wgt_head;
    output [MOT_BITS-1:0] o_loader;          // r_loader[0] du RTL
    wire [MOT_BITS-1:0] w_pistes [0:NB_FILTRES];   // w_pistes[k + 1] entre dans l'IP k, w_pistes[k] en sort
    assign w_pistes[NB_FILTRES] = i_wgt_cache_data;
    assign o_loader = w_pistes[0];
`ifdef BOURRAGE_FIL
    weight_filter_816_0_fil u_f0 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_pistes[1]), .o_loader(w_pistes[0]), .o_wgt_head(o_wgt_head[0*FILTRE_BITS +: FILTRE_BITS]));
`else
    weight_filter_816_0 u_f0 (.i_phi1(i_phi1), .i_phi2(i_phi2), .i_wgt_cache_valid(i_wgt_cache_valid), .i_chain_shift(i_chain_shift), .i_wgt_rot(i_wgt_rot), .i_wgt_xfer(i_wgt_xfer), .i_wgt_cache_data(w_pistes[1]), .o_loader(w_pistes[0]), .o_wgt_head(o_wgt_head[0*FILTRE_BITS +: FILTRE_BITS]));
`endif
endmodule
`endif
