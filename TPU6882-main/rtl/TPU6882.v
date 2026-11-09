// TPU6882: structural top level (pad ring, pad_in_M3 input stages, clk_tampons clock buffers, coeur_v2 core).
`define TILE_W 64
`define TILE_BPP 2
`define TILE_OUT_W 8
`define CHIP_CORE_PAIRS 3
`define CHIP_OUT_PAD sg13cmos5l_IOPadOut30mA
`default_nettype none
module TPU6882 #(parameter PINS     = `TILE_W / `TILE_BPP,
                  parameter DBI_PINS = (PINS + 7) / 8,
                  parameter OUT_W    = `TILE_OUT_W,
                  parameter DBI_N    = (OUT_W + 7) / 8)
                 (
`ifdef USE_POWER_PINS
                  inout wire                VDD,
                  inout wire                VSS,
                  inout wire                IOVDD,
                  inout wire                IOVSS,
`endif
                  inout wire [PINS-1:0]     D_PAD,
                  inout wire [DBI_PINS-1:0] DBI_PAD,
                  inout wire                CLK_P_PAD,
                  inout wire                CLK_N_PAD,
                  inout wire                VALID_PAD,
                  inout wire                READY_IN_PAD,
                  inout wire [OUT_W-1:0]    Q_PAD,
                  inout wire [DBI_N-1:0]    DBI_OUT_PAD,
                  inout wire                CLK_OUT_PAD,
                  inout wire                VALID_OUT_PAD,
                  inout wire                READY_OUT_PAD,
                  inout wire                RST_N_PAD);

    /* Signaux du ring : les bus de données et de DBI, puis CLK_P, VALID, CLK_N, RST_N, READY_OUT, READY_IN, CLK_OUT et
     * VALID_OUT (ring.signals). */
    localparam SIGNALS  = PINS + DBI_PINS + OUT_W + DBI_N + 8;
    localparam IO_PAIRS = (SIGNALS + 11) / 12;

    wire [PINS-1:0]     w_d_in;
    wire [DBI_PINS-1:0] w_dbi_in;
    wire                w_clk_in;
    wire                w_clk_in_n;
    wire                w_valid_in;
    wire                w_ready_in;
    wire [OUT_W-1:0]    w_q_out;
    wire [DBI_N-1:0]    w_dbi_out;
    wire                w_clk_out;
    wire                w_valid_out;
    wire                w_ready_out;
    wire                w_rst_n;

    // v2 (chip_v2.py) : les 37 pad_in accoles aux plots d'entree (couronne), puis le coeur v2 (bruts des pad_in)
    wire [36:0] w_raw_p;
    wire [36:0] w_raw_n;
    wire w_ckp_fe;
    wire w_ckp_fw;
    wire w_ckp_eh;
    wire w_ckp_eb;
    wire w_ckp_wh;
    wire w_ckp_wb;
    wire w_ckn_fe;
    wire w_ckn_fw;
    wire w_ckn_eh;
    wire w_ckn_eb;
    wire w_ckn_wh;
    wire w_ckn_wb;
    clk_tampons u_ckd (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_a(w_clk_in), .i_b(w_clk_in_n), .o_a0(w_ckp_fe), .o_a1(w_ckp_fw), .o_b0(w_ckn_fe), .o_b1(w_ckn_fw));
    clk_tampons u_cke (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_a(w_ckp_fe), .i_b(w_ckn_fe), .o_a0(w_ckp_eh), .o_a1(w_ckp_eb), .o_b0(w_ckn_eh), .o_b1(w_ckn_eb));
    clk_tampons u_ckw (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_a(w_ckp_fw), .i_b(w_ckn_fw), .o_a0(w_ckp_wh), .o_a1(w_ckp_wb), .o_b0(w_ckn_wh), .o_b1(w_ckn_wb));
    wire w_clk_coeur;
    wire w_ckc_nc1;
    wire w_ckc_nc2;
    wire w_ckc_nc3;
    clk_tampons u_ckc (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_a(w_clk_in), .i_b(w_clk_in), .o_a0(w_clk_coeur), .o_a1(w_ckc_nc1), .o_b0(w_ckc_nc2), .o_b1(w_ckc_nc3));
    wire w_clk_out_b;
    wire w_ready_out_b;
    wire w_cks_nc1;
    wire w_cks_nc2;
    clk_tampons u_cks (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_a(w_clk_out), .i_b(w_ready_out), .o_a0(w_clk_out_b), .o_a1(w_cks_nc1), .o_b0(w_ready_out_b), .o_b1(w_cks_nc2));
    pad_in_M3 u_pin_0 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[0]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[0]), .o_raw_n(w_raw_n[0]));
    pad_in_M3 u_pin_1 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[1]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[1]), .o_raw_n(w_raw_n[1]));
    pad_in_M3 u_pin_2 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[2]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[2]), .o_raw_n(w_raw_n[2]));
    pad_in_M3 u_pin_3 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[3]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[3]), .o_raw_n(w_raw_n[3]));
    pad_in_M3 u_pin_4 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[4]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[4]), .o_raw_n(w_raw_n[4]));
    pad_in_M3 u_pin_5 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[5]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[5]), .o_raw_n(w_raw_n[5]));
    pad_in_M3 u_pin_6 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[6]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[6]), .o_raw_n(w_raw_n[6]));
    pad_in_M3 u_pin_7 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[7]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[7]), .o_raw_n(w_raw_n[7]));
    pad_in_M3 u_pin_8 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[8]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[8]), .o_raw_n(w_raw_n[8]));
    pad_in_M3 u_pin_9 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[9]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[9]), .o_raw_n(w_raw_n[9]));
    pad_in_M3 u_pin_10 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[10]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[10]), .o_raw_n(w_raw_n[10]));
    pad_in_M3 u_pin_11 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[11]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[11]), .o_raw_n(w_raw_n[11]));
    pad_in_M3 u_pin_12 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[12]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[12]), .o_raw_n(w_raw_n[12]));
    pad_in_M3 u_pin_13 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[13]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[13]), .o_raw_n(w_raw_n[13]));
    pad_in_M3 u_pin_14 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[14]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[14]), .o_raw_n(w_raw_n[14]));
    pad_in_M3 u_pin_15 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[15]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[15]), .o_raw_n(w_raw_n[15]));
    pad_in_M3 u_pin_16 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[16]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[16]), .o_raw_n(w_raw_n[16]));
    pad_in_M3 u_pin_17 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[17]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[17]), .o_raw_n(w_raw_n[17]));
    pad_in_M3 u_pin_18 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[18]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[18]), .o_raw_n(w_raw_n[18]));
    pad_in_M3 u_pin_19 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[19]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[19]), .o_raw_n(w_raw_n[19]));
    pad_in_M3 u_pin_20 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[20]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[20]), .o_raw_n(w_raw_n[20]));
    pad_in_M3 u_pin_21 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[21]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[21]), .o_raw_n(w_raw_n[21]));
    pad_in_M3 u_pin_22 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[22]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[22]), .o_raw_n(w_raw_n[22]));
    pad_in_M3 u_pin_23 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[23]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[23]), .o_raw_n(w_raw_n[23]));
    pad_in_M3 u_pin_24 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[24]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[24]), .o_raw_n(w_raw_n[24]));
    pad_in_M3 u_pin_25 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[25]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[25]), .o_raw_n(w_raw_n[25]));
    pad_in_M3 u_pin_26 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[26]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[26]), .o_raw_n(w_raw_n[26]));
    pad_in_M3 u_pin_27 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[27]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[27]), .o_raw_n(w_raw_n[27]));
    pad_in_M3 u_pin_28 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[28]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[28]), .o_raw_n(w_raw_n[28]));
    pad_in_M3 u_pin_29 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[29]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[29]), .o_raw_n(w_raw_n[29]));
    pad_in_M3 u_pin_30 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[30]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[30]), .o_raw_n(w_raw_n[30]));
    pad_in_M3 u_pin_31 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_d_in[31]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[31]), .o_raw_n(w_raw_n[31]));
    pad_in_M3 u_pin_32 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_dbi_in[0]), .i_clk_p(w_ckp_wh), .i_clk_n(w_ckn_wh), .o_raw_p(w_raw_p[32]), .o_raw_n(w_raw_n[32]));
    pad_in_M3 u_pin_33 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_dbi_in[1]), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[33]), .o_raw_n(w_raw_n[33]));
    pad_in_M3 u_pin_34 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_dbi_in[2]), .i_clk_p(w_ckp_eb), .i_clk_n(w_ckn_eb), .o_raw_p(w_raw_p[34]), .o_raw_n(w_raw_n[34]));
    pad_in_M3 u_pin_35 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_dbi_in[3]), .i_clk_p(w_ckp_wb), .i_clk_n(w_ckn_wb), .o_raw_p(w_raw_p[35]), .o_raw_n(w_raw_n[35]));
    pad_in_M3 u_pin_36 (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_p2c(w_valid_in), .i_clk_p(w_ckp_eh), .i_clk_n(w_ckn_eh), .o_raw_p(w_raw_p[36]), .o_raw_n(w_raw_n[36]));
    coeur_v2 u_tile (
`ifdef USE_POWER_PINS
        .VDD(VDD), .VSS(VSS),
`endif
        .i_raw_p(w_raw_p), .i_raw_n(w_raw_n), .i_clk_in(w_clk_coeur), .i_rst_n(w_rst_n), .i_ready_out(w_ready_out_b), .o_ready_in(w_ready_in), .o_q_out(w_q_out), .o_dbi_out(w_dbi_out), .o_clk_out(w_clk_out), .o_valid_out(w_valid_out));

    sg13cmos5l_IOPadIn u_CLK_P (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .pad(CLK_P_PAD), .p2c(w_clk_in));

    sg13cmos5l_IOPadIn u_CLK_N (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .pad(CLK_N_PAD), .p2c(w_clk_in_n));

    sg13cmos5l_IOPadIn u_VALID (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .pad(VALID_PAD), .p2c(w_valid_in));

    sg13cmos5l_IOPadIn u_RST_N (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .pad(RST_N_PAD), .p2c(w_rst_n));

    sg13cmos5l_IOPadIn u_READY_OUT (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .pad(READY_OUT_PAD), .p2c(w_ready_out));

    `CHIP_OUT_PAD u_READY_IN (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .c2p(w_ready_in), .pad(READY_IN_PAD));

    `CHIP_OUT_PAD u_CLK_OUT (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .c2p(w_clk_out_b), .pad(CLK_OUT_PAD));

    `CHIP_OUT_PAD u_VALID_OUT (
`ifdef USE_POWER_PINS
        .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
        .c2p(w_valid_out), .pad(VALID_OUT_PAD));

    genvar pin_idx;
    generate
        for (pin_idx = 0; pin_idx < PINS; pin_idx = pin_idx + 1)
            begin : g_D
                sg13cmos5l_IOPadIn u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
                    .pad(D_PAD[pin_idx]), .p2c(w_d_in[pin_idx]));
            end
    endgenerate

    genvar group_idx;
    generate
        for (group_idx = 0; group_idx < DBI_PINS; group_idx = group_idx + 1)
            begin : g_DBI
                sg13cmos5l_IOPadIn u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
                    .pad(DBI_PAD[group_idx]), .p2c(w_dbi_in[group_idx]));
            end
    endgenerate

    genvar out_idx;
    generate
        for (out_idx = 0; out_idx < OUT_W; out_idx = out_idx + 1)
            begin : g_Q
                `CHIP_OUT_PAD u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
                    .c2p(w_q_out[out_idx]), .pad(Q_PAD[out_idx]));
            end
    endgenerate

    genvar out_group_idx;
    generate
        for (out_group_idx = 0; out_group_idx < DBI_N; out_group_idx = out_group_idx + 1)
            begin : g_DBI_OUT
                `CHIP_OUT_PAD u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS),
`endif
                    .c2p(w_dbi_out[out_group_idx]), .pad(DBI_OUT_PAD[out_group_idx]));
            end
    endgenerate

    genvar io_pair;
    generate
        for (io_pair = 0; io_pair < IO_PAIRS; io_pair = io_pair + 1)
            begin : g_IOVDD
                (* keep *) sg13cmos5l_IOPadIOVdd u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS)
`endif
                    );
            end
        for (io_pair = 0; io_pair < IO_PAIRS; io_pair = io_pair + 1)
            begin : g_IOVSS
                (* keep *) sg13cmos5l_IOPadIOVss u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS)
`endif
                    );
            end
    endgenerate

    genvar core_pair;
    generate
        for (core_pair = 0; core_pair < `CHIP_CORE_PAIRS; core_pair = core_pair + 1)
            begin : g_VDD
                (* keep *) sg13cmos5l_IOPadVdd u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS)
`endif
                    );
            end
        for (core_pair = 0; core_pair < `CHIP_CORE_PAIRS; core_pair = core_pair + 1)
            begin : g_VSS
                (* keep *) sg13cmos5l_IOPadVss u_pad (
`ifdef USE_POWER_PINS
                    .vdd(VDD), .vss(VSS), .iovdd(IOVDD), .iovss(IOVSS)
`endif
                    );
            end
    endgenerate

    (* keep *) logo_nebula u_logo ();

endmodule
`default_nettype wire
