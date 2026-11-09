`ifndef __MAC_DADA__
`define __MAC_DADA__

/* mac_dada : COQUILLE (IP bidon) du bloc 6, accord W392CC et W256CC (commune), pour l'integration de la tuile avant le
 * bloc. Ports = broches du LEF, nom pour nom. Ecrit par phys/outils/coquille.py ; voir ../COQUILLE.md. */
(* blackbox *)
module mac_dada (
    input     [3:0] i_act,
    input     [3:0] i_wgt,
    output   [12:0] o_bits
);
endmodule

`endif
