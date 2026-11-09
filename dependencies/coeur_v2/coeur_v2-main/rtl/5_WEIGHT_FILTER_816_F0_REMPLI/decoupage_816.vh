/* decoupage du groupe de poids, genere par decoupage.bc (bloc 5)
groupe : 288 bits = 1 filtres de 288 bits ; 5 mots de 64 (8 lignes de 8) ; bourrage 32 bits
un filtre touche au plus 6 mots
bourrage a la FIN du mot 4 (le mot d'entree) : bits 32 a 63 du mot, 4 lignes completes (4 a 7) et 0 element(s)

filtre | debut mot,ligne,elem | fin mot,ligne,elem | mots de l'IP | bits significatifs de l'IP | bits du groupe
0 | 0,0,0 | 4,4,0 | 5 | 0 a 287 | 0 a 287
*/

localparam NB_FILTRES = 1, FILTRE_BITS = 288, GROUPE_BITS = 288, NB_MOTS = 5, MOT_BITS = 64, MOT_X = 8, MOT_Y = 8, BOURRAGE = 32, BOURRAGE_EN_TETE = 0;
// filtre 0 : mots 0 a 4, bits significatifs 0 a 287 de l'IP
localparam F0_MOT_DEBUT = 0, F0_LIGNE_DEBUT = 0, F0_ELEM_DEBUT = 0, F0_MOT_FIN = 4, F0_LIGNE_FIN = 4, F0_ELEM_FIN = 0, F0_NB_MOTS = 5, F0_BIT_DEBUT = 0, F0_BIT_FIN = 287;
