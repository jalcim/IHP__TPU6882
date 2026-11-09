// puce3_enveloppes.v: the four pad wrappers of the 2e-1a ring. Each wrapper is an lvcmos_io cell plus a Metal2 bridge that brings the lvcmos pin to the location of the former IHP pad pin; puce3_IOPadIn18_noninv adds an sg13cmos5l_inv_2 after the receiver. Pin names follow the IHP pad cells (pad, p2c, c2p, vdd, vss, iovdd, iovss). The bridge is a wire with no function.
`timescale 1ns/10ps
module puce3_IOPadIn18NH_pont (pad, p2c, vdd, vss, iovdd, iovss);
    inout pad;
    output p2c;
    inout vdd, vss, iovdd, iovss;
    lvcmos_IOPadIn18NH u_plot (.IOVSS(iovss), .IOVDD(iovdd), .VSS(vss), .VDD(vdd), .PAD(pad), .P2C(p2c));
endmodule

module puce3_IOPadIn18_pont (pad, p2c, vdd, vss, iovdd, iovss);
    inout pad;
    output p2c;
    inout vdd, vss, iovdd, iovss;
    lvcmos_IOPadIn18 u_plot (.IOVSS(iovss), .IOVDD(iovdd), .VSS(vss), .VDD(vdd), .PAD(pad), .P2C(p2c));
endmodule

module puce3_IOPadIn18_noninv (pad, p2c, vdd, vss, iovdd, iovss);
    inout pad;
    output p2c;
    inout vdd, vss, iovdd, iovss;
    wire w_p2c;                                   // P2C de la cellule lvcmos, = !PAD
    lvcmos_IOPadIn18 u_plot (.IOVSS(iovss), .IOVDD(iovdd), .VSS(vss), .VDD(vdd), .PAD(pad), .P2C(w_p2c));
    sg13cmos5l_inv_2 u_inv (.A(w_p2c), .Y(p2c)
`ifdef USE_POWER_PINS
        , .VDD(vdd), .VSS(vss)
`endif
        );
endmodule

module puce3_IOPadOut18_pont (pad, c2p, vdd, vss, iovdd, iovss);
    inout pad;
    input c2p;
    inout vdd, vss, iovdd, iovss;
    lvcmos_IOPadOut18 u_plot (.IOVSS(iovss), .IOVDD(iovdd), .VSS(vss), .VDD(vdd), .PAD(pad), .C2P(c2p));
endmodule
