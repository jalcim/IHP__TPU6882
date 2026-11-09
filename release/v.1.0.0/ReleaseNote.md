# Release v.1.0.0

First submission for the IHP Open-Silicon MPW run of November 2026 (SG13CMOS5L).

## Files

- gds/TPU6882.gds.gz, single top cell TPU6882
  - SHA-256 of TPU6882.gds: 819aa305f8c76f744068a4e42b86727e6775f779ccf131bbbfada38854405915
  - SHA-256 of TPU6882.gds.gz: c5b13ab2bfd83c308346b6820d7aca68934abf27a43add54c14cefb3ea56214d

## Checks

- IHP minimum DRC precheck of the released GDS, main and density checks: 0 violations, see doc/drc/precheck.txt

## Seal ring text

The seal ring text on layer 63/0 reads "Calculated area: 5.7e-06 sq mm" and "PDK version: Unknown".
Both strings come from the seal ring PCell of the PDK. The area is given in square metres, which is 5.66 mm2, and the PDK revision is the one in doc/info.json.
The GDS is not modified.
