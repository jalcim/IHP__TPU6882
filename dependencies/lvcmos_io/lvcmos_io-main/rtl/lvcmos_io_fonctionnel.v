// lvcmos_io_fonctionnel.v: functional simulation model of the lvcmos_io cells, written from the functions of the lvcmos_io Liberty files (one assign per output pin that has a function, no delay).
// une instruction assign par broche de sortie qui a une fonction dans la Liberty, sans retard.
// lvcmos_io : modeles boite noire des cellules de la bibliotheque (ports inout, sans fonction)
`timescale 1ns/10ps

`celldefine
module lvcmos_Filler200 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Filler400 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Filler1000 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Filler2000 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Filler4000 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Filler10000 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_Corner (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_CornerStop (IOVSS_A, IOVDD_A, VSS, VDD, IOVSS_B, IOVDD_B);
    inout IOVSS_A;
    inout IOVDD_A;
    inout VSS;
    inout VDD;
    inout IOVSS_B;
    inout IOVDD_B;
endmodule
`endcelldefine

`celldefine
module lvcmos_CornerBreaker (IOVSS_MIPI, IOVDD_MIPI, VSS, VDD, IOVSS, IOVDD);
    inout IOVSS_MIPI;
    inout IOVDD_MIPI;
    inout VSS;
    inout VDD;
    inout IOVSS;
    inout IOVDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIOVss (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadVss (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIOVdd12 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadVdd12 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadOut12 (IOVSS, IOVDD, VSS, VDD, PAD, C2P);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
    inout PAD;
    input C2P;
    assign PAD = C2P;   // Liberty : function "C2P", positive_unate
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIn12 (IOVSS, IOVDD, VSS, VDD, PAD, P2C);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
    inout PAD;
    output P2C;
    assign P2C = PAD;   // Liberty : function "PAD", positive_unate
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIOVdd18 (IOVSS, IOVDD, VSS, VDD);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadOut18 (IOVSS, IOVDD, VSS, VDD, PAD, C2P);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
    inout PAD;
    input C2P;
    assign PAD = C2P;   // Liberty : function "C2P", positive_unate
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIn18 (IOVSS, IOVDD, VSS, VDD, PAD, P2C);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
    inout PAD;
    output P2C;
    assign P2C = ~PAD;   // Liberty : function "!PAD", negative_unate
endmodule
`endcelldefine

`celldefine
module lvcmos_IOPadIn18NH (IOVSS, IOVDD, VSS, VDD, PAD, P2C);
    inout IOVSS;
    inout IOVDD;
    inout VSS;
    inout VDD;
    inout PAD;
    output P2C;
    assign P2C = ~PAD;   // Liberty : function "!PAD", negative_unate
endmodule
`endcelldefine
