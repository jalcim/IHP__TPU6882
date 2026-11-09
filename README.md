# IHP__TPU6882

Tensor processing chip from Nebula Microsystems, submitted to the IHP Open-Silicon MPW run of November 2026 in SG13CMOS5L.

This version of the chip (2e-1a) has an LVCMOS 1.8 V pad ring built from the Nebula Microsystems lvcmos_io library.
It replaces the previous version, which used the IHP sg13cmos5l IO cells; that version is kept under the tag 2d-R-backup-2026-11-09.
The core and its macros are the same in both versions.

## Chip

- Process: IHP SG13CMOS5L
- Die: 2331 x 2426 um (5.66 mm2), seal ring and metal fill included
- Top cell: TPU6882
- Core: macro coeur_v2, a custom layout of the Nebula Microsystems tensor core with its control and link blocks.
- Supplies: core VDD 1.2 V, IO ring IOVDD 1.8 V.
- IO: cells of the lvcmos_io library (1.8 V), no IHP IO cell. The lvcmos input cells invert (P2C = !PAD); the polarity is restored by pad_in_M3_QN on the 37 data inputs, by clk_tampons_inv on CLK_P / CLK_N, by clk_tampons_mix on READY_OUT and by an inverter in the RST_N pad wrapper.
- Macros: coeur_v2, input stage pad_in_M3_QN, clock buffers clk_tampons, clk_tampons_inv and clk_tampons_mix, pad wrappers puce3_IOPadIn18NH_pont, puce3_IOPadIn18_pont, puce3_IOPadIn18_noninv and puce3_IOPadOut18_pont, bond pad bondpad_70x70_5L, decoupling cell decapd55_8, Nebula logo.

## Pads

69 bond pads (bondpad_70x70_5L), 249 lvcmos fillers and 4 lvcmos corners.

| lvcmos_io cell | pads | placed as | signals |
| --- | --- | --- | --- |
| lvcmos_IOPadIn18NH (no hysteresis) | 38 | puce3_IOPadIn18NH_pont | D_PAD[31:0], DBI_PAD[3:0], VALID_PAD, READY_OUT_PAD |
| lvcmos_IOPadIn18 (Schmitt trigger) | 2 | puce3_IOPadIn18_pont | CLK_P_PAD, CLK_N_PAD |
| lvcmos_IOPadIn18 + sg13cmos5l_inv_2 | 1 | puce3_IOPadIn18_noninv | RST_N_PAD |
| lvcmos_IOPadOut18 | 12 | puce3_IOPadOut18_pont | Q_PAD[7:0], DBI_OUT_PAD[0], CLK_OUT_PAD, VALID_OUT_PAD, READY_IN_PAD |
| lvcmos_IOPadVdd12 | 3 | direct | VDD |
| lvcmos_IOPadVss | 3 | direct | VSS |
| lvcmos_IOPadIOVdd18 | 5 | direct | IOVDD |
| lvcmos_IOPadIOVss | 5 | direct | IOVSS |

A pad wrapper is the lvcmos cell plus a Metal2 bridge that brings the lvcmos pin to the pin location of the former IHP pad cell.

Cell names: the input stage is named pad_in_M3_QN, the seal ring sealring and the secondary protection of the lvcmos input pads
lvcmosIO_SecondaryProtection, so that none of them shares a name with a different cell of the previous version or of the IHP IO library.

## Contents

- release/v.1.0.0/gds/TPU6882.gds.gz: final GDS, gzip compressed
- TPU6882-main/rtl/TPU6882.v: structural Verilog of the top level; TPU6882-main/rtl/puce3_enveloppes.v: models of the four pad wrappers
- dependencies: GDS of each macro, taken from the final GDS, with the LEF, Liberty and Verilog views available
- dependencies/lvcmos_io: the lvcmos cells used by the chip (GDS taken from the final GDS), with the LEF, Liberty, SPICE and Verilog of the library
- dependencies/coeur_v2/dependencies: the macros inside coeur_v2, nested as in the layout.
  tensocore_v2 holds macc_unit_v2 (mac_dada, acc_wallace_72, acc_csa, ACC_BARREL_6x19, HEAD_6x19_EST, acc_ring_zig_19x6x10), weight_filter_816_0, thr_rot_816_64x27, tile_ctrl_a and phase_gen_ip.
  link_v2 holds pix_asm_wind_16_v2 and phase_gen_ip. controle_v2 holds tile_ctrl_b_buf, dbi_group, pad_core_valid and phase_gen_ip.
  Each macro has its GDS, taken from the final GDS with the macro name as top cell. Its other views will be added later.
- dependencies/coeur_v2/coeur_v2-main/rtl: Verilog of the MAC unit, weight filter, MAC and threshold blocks of coeur_v2.
  The control block, the link block and the top of coeur_v2 will be added later.
- release/v.1.0.0/doc/drc: IHP minimum DRC precheck of the released GDS (precheck.txt and lyrdb report)

The netlist used for LVS and the flow configuration will be added later.

## License

Apache License 2.0, see LICENSE.
