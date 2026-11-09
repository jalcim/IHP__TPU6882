`ifndef __MAC_DADA__
`define __MAC_DADA__

/* mac_dada : un terme de ⑤, activation a (4 bits non signes) x poids w (4 bits signes), en 2 rangees non propagees.
 * Combinatoire : 16 produits partiels, puis une reduction de Dadda (cibles 3 puis 2 bits par colonne, le moins
 * d'additionneurs possible a chaque etage) : 3 FA, 3 HA, 2 niveaux (chemin HA puis FA).
 *
 * Memes produits partiels que mac_wallace (and2 a_j & w_i pour i de 0 a 2, nand2 ~(a_j & w3) en rangee de signe), sans
 * la constante de Baugh-Wooley, ajoutee une fois par acc_wallace : o_bits vaut a x w + 120, de 0 a 225.
 *
 * o_bits, colonne par colonne, poids faibles d'abord : hauteurs 1 2 2 2 2 2 2 0 (colonnes 0 a 7), 13 bits.
 *   [0] c0   [2:1] c1   [4:3] c2   [6:5] c3   [8:7] c4   [10:9] c5   [12:11] c6 */
`define MAC_DADA_H      32'h0222_2221   // hauteur de la colonne c en [4c +: 4]
`define MAC_DADA_BITS   13
`define MAC_DADA_LEVELS 2

module mac_dada (input  [3:0]  i_act,    // a, non signe
                 input  [3:0]  i_wgt,    // w, signe
                 output [12:0] o_bits);  // les 2 rangees, colonne par colonne

    wire [3:0] a = i_act;
    wire [3:0] w = i_wgt;

    // produits partiels, colonne par colonne : hauteurs 1 2 3 4 3 2 1
    wire c0_0 = a[0] & w[0];
    wire c1_0 = a[1] & w[0], c1_1 = a[0] & w[1];
    wire c2_0 = a[2] & w[0], c2_1 = a[1] & w[1], c2_2 = a[0] & w[2];
    wire c3_0 = a[3] & w[0], c3_1 = a[2] & w[1], c3_2 = a[1] & w[2], c3_3 = ~(a[0] & w[3]);
    wire c4_0 = a[3] & w[1], c4_1 = a[2] & w[2], c4_2 = ~(a[1] & w[3]);
    wire c5_0 = a[3] & w[2], c5_1 = ~(a[2] & w[3]);
    wire c6_0 = ~(a[3] & w[3]);

    // etage 1, cible 3 : HA c3, HA c4 ; hauteurs 1 2 3 3 3 3 1
    wire t1_3 = c3_0 ^ c3_1,  q1_4 = c3_0 & c3_1;    // c3 {t1_3, c3_2, c3_3}
    wire t1_4 = c4_0 ^ c4_1,  q1_5 = c4_0 & c4_1;    // c4 {t1_4, c4_2, q1_4}, c5 {c5_0, c5_1, q1_5}

    // etage 2, cible 2 : HA c2, FA c3, FA c4, FA c5 ; hauteurs 1 2 2 2 2 2 2
    wire u_2 = c2_0 ^ c2_1,          r_3 = c2_0 & c2_1;
    wire u_3 = t1_3 ^ c3_2 ^ c3_3,   r_4 = (t1_3 & c3_2) | (c3_3 & (t1_3 ^ c3_2));
    wire u_4 = t1_4 ^ c4_2 ^ q1_4,   r_5 = (t1_4 & c4_2) | (q1_4 & (t1_4 ^ c4_2));
    wire u_5 = c5_0 ^ c5_1 ^ q1_5,   r_6 = (c5_0 & c5_1) | (q1_5 & (c5_0 ^ c5_1));

    assign o_bits = {r_6, c6_0, r_5, u_5, r_4, u_4, r_3, u_3, c2_2, u_2, c1_1, c1_0, c0_0};

endmodule

`endif
