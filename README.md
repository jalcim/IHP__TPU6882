# IHP__TPU6882

Tensor processing chip from Nebula Microsystems, submitted to the IHP Open-Silicon MPW run of November 2026 in SG13CMOS5L.

## Chip

- Process: IHP SG13CMOS5L, PDK commit 7bbb4b5a5b64c446fedc64eacadc33fa65ade276
- Die: 2331 x 2426 um (5.66 mm2), seal ring and metal fill included
- Top cell: TPU6882
- Core: macro coeur_v2, a custom layout of the Nebula Microsystems tensor core with its control and link blocks.
- Macros: coeur_v2, input stage pad_in_M3, clock buffers clk_tampons, bond pad bondpad_70x70_5L, decoupling cell decapd55_8, Nebula logo.
  The IO cells come from the IHP sg13cmos5l IO library.
- Pads: 69 bond pads.

## Contents

- release/v.1.0.0/gds/TPU6882.gds.gz: final GDS, gzip compressed
- TPU6882-main/rtl/TPU6882.v: structural Verilog of the top level
- dependencies: GDS of each macro, taken from the final GDS, with the LEF, Liberty and Verilog views available
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
