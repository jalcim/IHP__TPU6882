# lvcmos_io

LVCMOS 1.8 V IO cell library of Nebula Microsystems for SG13CMOS5L: inputs lvcmos_IOPadIn18 (Schmitt trigger) and lvcmos_IOPadIn18NH (no hysteresis), output lvcmos_IOPadOut18, supplies lvcmos_IOPadVdd12, lvcmos_IOPadVss, lvcmos_IOPadIOVdd18, lvcmos_IOPadIOVss, fillers and corner. The input cells invert (P2C = !PAD).
release/v.1.0.0/gds/lvcmos_io.gds holds the 13 lvcmos cells used by TPU6882, taken from the final GDS with their sub-cells. LEF, Liberty (tt / ss / ff), SPICE and black-box Verilog of the library are in release/v.1.0.0 and lvcmos_io-main/rtl; lvcmos_io_fonctionnel.v is a functional model for simulation.
The secondary protection cell of the input pads is named lvcmosIO_SecondaryProtection in the GDS and in the SPICE netlist; it differs from
sg13cmos5l_SecondaryProtection of the IHP IO library.

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries
