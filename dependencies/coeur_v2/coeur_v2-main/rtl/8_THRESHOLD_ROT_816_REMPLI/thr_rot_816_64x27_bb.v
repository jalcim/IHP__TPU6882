`ifndef __THR_ROT_816_64X27__
`define __THR_ROT_816_64X27__

/* thr_rot_816_64x27 : COQUILLE (IP bidon) du bloc 8, accord W816CC, pour l'integration de la tuile avant le
 * bloc. Ports = broches du LEF, nom pour nom. Ecrit par phys/outils/coquille.py ; voir ../COQUILLE.md. */
(* blackbox *)
module thr_rot_816_64x27 (
    input           i_phi1,
    input           i_phi2,
    input           i_thr_cache_valid,
    input           i_thr_we,
    input           i_thr_rot,
    input    [63:0] i_thr_cache_data,
    output  [284:0] o_theta
);
endmodule

`endif
