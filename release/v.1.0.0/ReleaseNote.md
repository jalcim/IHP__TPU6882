# Release v.1.0.0

Submission for the IHP Open-Silicon MPW run of November 2026 (SG13CMOS5L), chip version 2e-1a: LVCMOS 1.8 V pad ring (lvcmos_io library), same core as the previous version (tag 2d-R-backup-2026-11-09).

## Files

- gds/TPU6882.gds.gz, single top cell TPU6882
  - cell names specific to this version: pad_in_M3_QN (input stage, QN variant), sealring_TPU6882 (seal ring) and lvcmosIO_SecondaryProtection
    (secondary protection of the lvcmos_io input pads, which differs from sg13cmos5l_SecondaryProtection of the IHP IO library).
    These cells were renamed in the GDS records only; the geometry is unchanged.
  - SHA-256 of TPU6882.gds: 6f2e6ec16ad4588549ae439cb19d617e4e515fa3ac0ac9238fc4e5c2ecfe3264
  - SHA-256 of TPU6882.gds.gz: 755fc8b2503785b75ce7bb0af0e09fa7b64f0d235700bf23a7672491019649d1

## Checks

- IHP minimum DRC precheck of the released GDS, main and density checks: 0 violations, see doc/drc/precheck.txt.
  The run summary and the density log are in doc/drc/ as well.
- The full DRC deck (run_drc.py without --minimum_drc) has not been run on the released GDS yet.
  On the same layout before the cell renaming, the full deck reports markers inside the lvcmos_io cells and at their abutment only; none of them belongs to the minimum rule set.

## Seal ring text

The seal ring text on layer 63/0 reads "Calculated area: 5.7e-06 sq mm" and "PDK version: Unknown".
Both strings come from the seal ring PCell of the PDK. The area is given in square metres, which is 5.66 mm2, and the PDK revision is the one in doc/info.json.
The GDS is not modified.
