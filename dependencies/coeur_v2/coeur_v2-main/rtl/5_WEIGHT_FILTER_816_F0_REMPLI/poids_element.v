`ifndef __POIDS_ELEMENT__
`define __POIDS_ELEMENT__
/* poids_element : l'element POIDS_1_5_6 du dessin en latches (modele de simulation des IP de 5, ecrit par
 * blocs/weight_bank) : chargeur 1, chaine G - 1, anneau G, mux d'entree de l'anneau. Lignes : _lm = maitre, _ls = esclave. */
module poids_element #(parameter G = 6)
                      (input  i_wgt_cache_data,
                       output r_loader,
                       output o_wgt_head,
                       input  i_chain_shift_lm, input i_chain_shift_ls,
                       input  i_wgt_cache_valid_lm, input i_wgt_cache_valid_ls,
                       input  i_wgt_rot_lm, input i_wgt_rot_ls,
                       input  i_wgt_xfer);
    /* verilator lint_off COMBDLY */
    reg ld_m, ld_s;
    reg [G-2:0] c_m, c_s;
    reg [G-1:0] r_m, r_s;
    wire ring_in = i_wgt_xfer ? c_s[0] : r_s[0];
    always_latch if (i_wgt_cache_valid_lm) ld_m <= i_wgt_cache_data;
    always_latch if (i_wgt_cache_valid_ls) ld_s <= ld_m;
    always_latch if (i_chain_shift_lm) c_m <= {ld_s, c_s[G-2:1]};
    always_latch if (i_chain_shift_ls) c_s <= c_m;
    always_latch if (i_wgt_rot_lm) r_m <= {ring_in, r_s[G-1:1]};
    always_latch if (i_wgt_rot_ls) r_s <= r_m;
    /* verilator lint_on COMBDLY */
    assign r_loader = ld_s;
    assign o_wgt_head = r_s[0];
endmodule
`endif
