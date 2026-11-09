* pad_in_g5i2.sp -- reference LVS (et netlist de cellules pour le .lib) de la macro en cellules g5i2
* (run/g5i2/pad_in.gds, pad_in_g5i2.py), ecrite a la main. Livree en IP/1_PAD_IN/signoff/pad_in_lvs.sp.
* Le r_f dans la prise p : in, M(CLK_N), S(CLK_P), F(CLK_N), out ; prise n : in, M(CLK_P), S(CLK_N), out. 10 decap_8 (80 um).
* La cellule out (tlatch_g5i2_out) n'a pas de transistor : pure terminaison, absente de la reference.
* Sous-circuits : sg13cmos5l_decap_8 (PDK), srlatch_g5i2_abut et srlatch_g5i2_in (nemisys_5l/sg13_extracells/cell/*/char, commit e87b139).
* Dans abut (X8) et in (X2), une source PMOS est alimentee par la cellule voisine : reliee a VDD ici.

.subckt sg13cmos5l_decap_8 VDD VSS
MN0 VSS VDD VSS VSS sg13_lv_nmos w=840.00n l=1.000u ng=2 ad=1.596e-13 as=2.856e-13 pd=1.6e-06 ps=3.04e-06 m=1
MP0 VDD VSS VDD VDD sg13_lv_pmos w=2.000u l=1.000u ng=2 ad=3.8e-13 as=6.8e-13 pd=2.76e-06 ps=5.36e-06 m=1
.ends

.subckt srlatch_g5i2_abut LATCH DP DN QP QN VDD VSS
M0 a_94_436# DP VDD VDD sg13_lv_pmos ad=0.15015p pd=1.285u as=0.64332p ps=4.52u w=1.12u l=0.13u
M1 VDD DN a_370_600# VDD sg13_lv_pmos ad=0.64332p pd=4.52u as=0.15215p ps=1.3u w=1.14u l=0.13u
M2 VSS QPI QNI VSS sg13_lv_nmos ad=57f pd=0.68u as=0.12025p ps=1.23u w=0.3u l=0.13u
M3 QPI QNI VSS VSS sg13_lv_nmos ad=0.12025p pd=1.23u as=57f ps=0.68u w=0.3u l=0.13u
M4 VDD LATCH a_94_436# VDD sg13_lv_pmos ad=0.51465p pd=3.615u as=0.15015p ps=1.285u w=0.3u l=0.13u
M5 a_370_600# QNI QPI VDD sg13_lv_pmos ad=0.15215p pd=1.3u as=0.1731p ps=1.86u w=0.59u l=0.13u
M6 QN QPI VDD VDD sg13_lv_pmos ad=0.102p pd=1.28u as=0.64332p ps=4.52u w=0.3u l=0.13u
M7 a_370_600# LATCH VDD VDD sg13_lv_pmos ad=0.15215p pd=1.3u as=0.51465p ps=3.615u w=0.3u l=0.13u
M8 VDD QNI QP VDD sg13_lv_pmos ad=68.99999f pd=1.06u as=0.102p ps=1.28u w=0.3u l=0.13u
M9 QNI DP a_94_96# VSS sg13_lv_nmos ad=0.12025p pd=1.23u as=0.14995p ps=1.23u w=0.85u l=0.13u
M10 a_94_96# DN QPI VSS sg13_lv_nmos ad=0.289p pd=2.38u as=0.12025p ps=1.23u w=0.85u l=0.13u
M11 QNI QPI a_94_436# VDD sg13_lv_pmos ad=0.1663p pd=1.82u as=0.15015p ps=1.285u w=0.57u l=0.13u
M12 a_94_96# LATCH VSS VSS sg13_lv_nmos ad=0.14995p pd=1.23u as=0.2176p ps=1.96u w=0.64u l=0.13u
M13 VSS QPI QN VSS sg13_lv_nmos ad=57f pd=0.68u as=0.102p ps=1.28u w=0.3u l=0.13u
M14 QP QNI VSS VSS sg13_lv_nmos ad=0.102p pd=1.28u as=57f ps=0.68u w=0.3u l=0.13u
.ends

.subckt srlatch_g5i2_in VSS VDD A DN DP
M0 DN A VDD VDD sg13_lv_pmos ad=0.255p pd=2.18u as=0.9525p ps=6.74u w=0.75u l=0.13u
M1 VSS A DN VSS sg13_lv_nmos ad=91.2f pd=0.86u as=0.1632p ps=1.64u w=0.48u l=0.13u
M2 VDD DN DP VDD sg13_lv_pmos ad=0.1725p pd=1.96u as=0.255p ps=2.18u w=0.75u l=0.13u
M3 DP DN VSS VSS sg13_lv_nmos ad=0.1632p pd=1.64u as=91.2f ps=0.86u w=0.48u l=0.13u
.ends

.SUBCKT sg13cmos5l_buf_4 X A VDD VSS
*.PININFO A:I X:O VDD:B VSS:B
MN0 net1 A VSS VSS sg13_lv_nmos m=1 w=740.00n l=130.00n ng=1
MN1 X net1 VSS VSS sg13_lv_nmos m=1 w=2.96u l=130.00n ng=4
MP1 X net1 VDD VDD sg13_lv_pmos m=1 w=4.48u l=130.00n ng=4
MP0 net1 A VDD VDD sg13_lv_pmos m=1 w=1.68u l=130.00n ng=2
.ENDS
.SUBCKT sg13cmos5l_decap_4 VDD VSS
*.PININFO VDD:B VSS:B
MN0 VSS VDD VSS VSS sg13_lv_nmos m=1 w=420.00n l=1.000u ng=1
MP0 VDD VSS VDD VDD sg13_lv_pmos m=1 w=1.000u l=1.000u ng=1
.ENDS
.subckt pad_in_M3_QN i_p2c i_clk_p i_clk_n o_raw_p o_raw_n VDD VSS
* prise p (miroir, vers la gauche)
XINP VSS VDD i_p2c p2cn_p p2c_p srlatch_g5i2_in
XMCP i_clk_n p2c_p p2cn_p mcp_q mcp_qn VDD VSS srlatch_g5i2_abut
XSCP i_clk_p mcp_q mcp_qn scp_q scp_qn VDD VSS srlatch_g5i2_abut
XFCP i_clk_n scp_q scp_qn o_raw_pn raw_p VDD VSS srlatch_g5i2_abut
* prise n (vers la droite)
XINN VSS VDD i_p2c p2cn_n p2c_n srlatch_g5i2_in
XMCN i_clk_p p2c_n p2cn_n mcn_q mcn_qn VDD VSS srlatch_g5i2_abut
XSCN i_clk_n mcn_q mcn_qn o_raw_nn raw_n VDD VSS srlatch_g5i2_abut
* decouplage (31/10, macro de 80 um) : 2 decap_8 a gauche de la chaine, 8 a droite ; le fill_2 et la zone des doigts n'ont pas de transistor
XDC0 VDD VSS sg13cmos5l_decap_8
XDC1 VDD VSS sg13cmos5l_decap_8
XDC2 VDD VSS sg13cmos5l_decap_8
XDC3 VDD VSS sg13cmos5l_decap_8
XDC4 VDD VSS sg13cmos5l_decap_8
XDC5 VDD VSS sg13cmos5l_decap_8
XDC6 VDD VSS sg13cmos5l_decap_8
XDC7 VDD VSS sg13cmos5l_decap_4
* tampons de sortie (brouillon_pad_in, 06/11)
XBP o_raw_p raw_p VDD VSS sg13cmos5l_buf_4
XBN o_raw_n raw_n VDD VSS sg13cmos5l_buf_4
.ends pad_in_M3_QN
