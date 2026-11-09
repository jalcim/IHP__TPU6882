// srlatch_abut - GDS tlatch_abut (6afd63), memes transistors que srlatch9, aboutable. Comportement : verilog/srlatch.v.
`timescale 1ns/1ps
module srlatch_abut (input LATCH, input DP, input DN, output QP, output QN);
  srlatch #(.ILLEGAL(1'b0)) l (.LATCH(LATCH), .DP(DP), .DN(DN), .QP(QP), .QN(QN));
endmodule
