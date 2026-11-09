// srlatch.v - modele comportemental commun des verrous SR gates de nemisys 5L
// (pins du template vernier nemisys5L_srlatch : LATCH DP DN QP QN).
//   LATCH = 1 (transparent) : DP = 1 pose QP = 1, DN = 1 pose QP = 0, DP = DN = 0 tient,
//                             DP = DN = 1 est l'etat interdit : QP = QN = ILLEGAL.
//   LATCH = 0               : tient.
// ILLEGAL : 1'b0 pour la famille NOR (srlatch9, abut, v2, a, 9t : les deux sorties tombent a 0,
// la sortie de cet etat est une course), 1'bx pour la g4 (conflit paire / maintien).
// Un fichier par cellule, verilog/<cell>.v, instancie ce module : c'est lui que la datasheet
// (make datasheet) et les macros (macro/sr_col8.v) utilisent. Sans delais.
`timescale 1ns/1ps
/* verilator lint_off LATCH */   // le verrou est voulu
module srlatch #(parameter ILLEGAL = 1'bx) (input LATCH, input DP, input DN, output reg QP, output reg QN);
  always @* if (LATCH) begin
    if (DP & DN)  begin QP = ILLEGAL; QN = ILLEGAL; end
    else if (DP)  begin QP = 1'b1;    QN = 1'b0;    end
    else if (DN)  begin QP = 1'b0;    QN = 1'b1;    end
  end
endmodule
