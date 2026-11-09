# TPU6882 specification

## Function

TPU6882 is a tensor processing test chip from Nebula Microsystems.
Its core is the custom macro coeur_v2, which holds the tensor core, its control and the input link of the Nebula Microsystems architecture.
The chip takes a stream of input words, computes on them in the core and sends the results on an 8 bit output bus.

## Input interface

The input link carries 64 bit words on 32 data pads, two bits per pad and per clock period.
The first half of each period is captured on CLK_P_PAD and the second half on CLK_N_PAD.
DBI_PAD carries one data bus inversion flag for each group of 8 data pads.
VALID_PAD marks valid input data, and READY_IN_PAD tells the sender that the chip can take data.

## Output interface

Q_PAD is an 8 bit output bus with one data bus inversion flag on DBI_OUT_PAD.
CLK_OUT_PAD is sent with the data, and VALID_OUT_PAD marks valid output data.
READY_OUT_PAD tells the chip that the receiver can take data.

## Reset

RST_N_PAD is an active low reset.

## Implementation

- Process IHP SG13CMOS5L, IO cells from the Nebula Microsystems lvcmos_io library, IO supply 1.8 V.
- Macros: coeur_v2, pad_in_M3_QN, clk_tampons, clk_tampons_inv, clk_tampons_mix, the pad wrappers puce3_IOPadIn18NH_pont, puce3_IOPadIn18_pont, puce3_IOPadIn18_noninv and puce3_IOPadOut18_pont, bondpad_70x70_5L, decapd55_8 and logo_nebula.
- Die 2331 x 2426 um (5.66 mm2), with seal ring and metal fill.
