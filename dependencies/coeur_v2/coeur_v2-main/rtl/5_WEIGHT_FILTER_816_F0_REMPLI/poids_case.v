`ifndef __POIDS_CASE__
`define __POIDS_CASE__
/* poids_case : la case de chargeur seule (CASE_POIDS, bourrage -bourrage case de pile_5.py) : le FF_RI_POIDS de l'element,
 * maitre transparent sur _lm, esclave sur _ls ; ni chaine ni anneau. */
module poids_case (input i_wgt_cache_data, output r_loader, input i_wgt_cache_valid_lm, input i_wgt_cache_valid_ls);
    reg ld_m, ld_s;
    always_latch if (i_wgt_cache_valid_lm) ld_m <= i_wgt_cache_data;
    always_latch if (i_wgt_cache_valid_ls) ld_s <= ld_m;
    assign r_loader = ld_s;
endmodule
`endif
