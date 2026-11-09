# TPU6882 datasheet

## Summary

| Item | Value |
| --- | --- |
| Process | IHP SG13CMOS5L |
| Die size | 2331 x 2426 um (5.66 mm2), seal ring included |
| Bond pads | 69, 70 x 70 um |
| Signal pads | 41 inputs (38 lvcmos_IOPadIn18NH, 3 lvcmos_IOPadIn18), 12 outputs (lvcmos_IOPadOut18) |
| Supply pads | 3 VDD (lvcmos_IOPadVdd12), 3 VSS (lvcmos_IOPadVss), 5 IOVDD (lvcmos_IOPadIOVdd18), 5 IOVSS (lvcmos_IOPadIOVss) |
| Core supply VDD | 1.2 V nominal, timing libraries at 1.08 V, 1.20 V and 1.32 V |
| IO supply IOVDD | 1.8 V nominal, IO libraries at 1.65 V, 1.8 V and 1.95 V |

## Pins

| Pin | Direction | IO cell | Function |
| --- | --- | --- | --- |
| D_PAD[31:0] | input | lvcmos_IOPadIn18NH | Data bus, two bits per pad and per clock period |
| DBI_PAD[3:0] | input | lvcmos_IOPadIn18NH | Data bus inversion flags, one per group of 8 data pads |
| CLK_P_PAD | input | lvcmos_IOPadIn18 | Input clock for the first half of each period |
| CLK_N_PAD | input | lvcmos_IOPadIn18 | Input clock for the second half of each period |
| VALID_PAD | input | lvcmos_IOPadIn18NH | Input data valid |
| READY_OUT_PAD | input | lvcmos_IOPadIn18NH | The downstream device is ready to take output data |
| RST_N_PAD | input | lvcmos_IOPadIn18 and sg13cmos5l_inv_2 | Reset, active low |
| Q_PAD[7:0] | output | lvcmos_IOPadOut18 | Output data bus |
| DBI_OUT_PAD[0] | output | lvcmos_IOPadOut18 | Data bus inversion flag of Q_PAD |
| CLK_OUT_PAD | output | lvcmos_IOPadOut18 | Output clock sent with Q_PAD |
| VALID_OUT_PAD | output | lvcmos_IOPadOut18 | Output data valid |
| READY_IN_PAD | output | lvcmos_IOPadOut18 | The chip is ready to take input data |

## Supplies

| Pin | Function |
| --- | --- |
| VDD, VSS | Core supply and ground |
| IOVDD, IOVSS | Supply and ground of the IO ring |

No measured silicon data is available yet.
