`ifndef __PAD_IN_M3__
`define __PAD_IN_M3__

// la cellule de latch (nemisys_5l, SRLATCH/char/verilog, trouvee par -y), au choix par make LATCH=...
`ifndef PHYS_LATCH
 `define PHYS_LATCH srlatch_abut
`endif

/* pad_in_M3 : variante de pad_in (canal de routage, broches du bas toutes en Metal3) ; la macro derriere chaque plot d'entree.
 *
 * Le recepteur est dans le plot (lvcmos_IOPadIn18 de la lib lvcmos_io), pose dans chip.v par phys/ring/ring.tcl, hors RTL.
 * La macro recoit P2C = !PAD et capture en DDR sur les deux rings :
 *   cap_p : maitre sur CLK_N, esclave sur CLK_P, puis un troisieme latch sur CLK_N (le r_f de rtl/1_link_in.v, porte par
 *           l'anneau) : RAW_P change a CLK_P descendant et tient une periode, comme RAW_N ;
 *   cap_n : maitre sur CLK_P, esclave sur CLK_N.
 * Un inverseur par prise (le latch prend DP et DN). RAW est le QN du dernier latch, si bien que RAW = PAD.
 * Memes instances que pad_in.sp (XINVP XINVN MCP SCP FCP MCN SCN). */
// macro Caelum : yosys garde l'instance sans synthetiser le corps, les simulateurs lisent le corps
(* blackbox *)
module pad_in_M3 (input  i_p2c,      // du plot, = !PAD
               input  i_clk_p,    // ring d'horloge CLK_P
               input  i_clk_n,    // ring d'horloge CLK_N
               output o_raw_p,    // le bit du premier demi-cycle, sur CLK_P
               output o_raw_n);   // le bit du second demi-cycle, sur CLK_N

    // le corps ne sert qu'a la simulation : en synthese la macro est une boite noire vide (read_slang elabore
    // les corps malgre (* blackbox *))
`ifndef SYNTHESIS

    wire w_p2cn, w_p2cnn;                     // P2C inverse, un par prise
    wire w_mp_q, w_mp_qn, w_mn_q, w_mn_qn;    // sorties des maitres
    wire w_sp_q, w_sp_qn;                     // sorties de l'esclave p, vers le r_f
    wire w_fp_q, w_sn_q;                      // QP du r_f et de l'esclave n, non utilises (RAW est QN)

    // les deux inverseurs
    assign w_p2cn  = ~i_p2c;     // XINVP
    assign w_p2cnn = ~i_p2c;     // XINVN

    // prise p : maitre sur CLK_N, esclave sur CLK_P, puis le r_f sur CLK_N
    `PHYS_LATCH u_cap_p_m (.LATCH(i_clk_n), .DP(i_p2c),  .DN(w_p2cn),  .QP(w_mp_q), .QN(w_mp_qn));
    `PHYS_LATCH u_cap_p_s (.LATCH(i_clk_p), .DP(w_mp_q), .DN(w_mp_qn), .QP(w_sp_q), .QN(w_sp_qn));
    `PHYS_LATCH u_cap_p_f (.LATCH(i_clk_n), .DP(w_sp_q), .DN(w_sp_qn), .QP(w_fp_q), .QN(o_raw_p));

    // prise n : maitre sur CLK_P, esclave sur CLK_N
    `PHYS_LATCH u_cap_n_m (.LATCH(i_clk_p), .DP(i_p2c),  .DN(w_p2cnn), .QP(w_mn_q), .QN(w_mn_qn));
    `PHYS_LATCH u_cap_n_s (.LATCH(i_clk_n), .DP(w_mn_q), .DN(w_mn_qn), .QP(w_sn_q), .QN(o_raw_n));


`endif

endmodule


`endif
