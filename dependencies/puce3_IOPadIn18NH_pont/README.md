# puce3_IOPadIn18NH_pont

Pad wrapper of the TPU6882 ring: lvcmos_IOPadIn18NH, used on 38 pads (32 D, 4 DBI, VALID, READY_OUT), plus a Metal2 bridge that brings the lvcmos pin to the pin location of the former IHP pad cell.
GDS taken from the final GDS with its sub-cells. Verilog model in puce3_IOPadIn18NH_pont-main/rtl/puce3_enveloppes.v (the four wrappers). No LEF or Liberty yet: the frame is the one of the lvcmos cell (80 x 180 um) and the timing is the one of the lvcmos cell.

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries
