# pad_in_M3_QN

Input stage placed behind each of the 37 data input pads (32 D, 4 DBI, VALID): DDR capture of the pad signal on both clock rings, QN variant for the inverting lvcmos_io receivers.
Same layout as pad_in_M3 of the previous chip version except the output polarity; renamed pad_in_M3_QN so that its views cannot be mixed up with the QP variant.
GDS taken from the final GDS. LEF, Liberty (timing model without layout parasitics), LVS reference netlist and Verilog in release/v.1.0.0 and pad_in_M3_QN-main/rtl (srlatch_abut.v and srlatch.v are the latch models it instantiates).

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries
