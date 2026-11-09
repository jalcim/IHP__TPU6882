# TPU6882-main

Source files of the TPU6882 chip.

- rtl/TPU6882.v : structural top level.
- rtl/puce3_enveloppes.v : models of the four pad wrappers of the lvcmos ring.
- The other subfolders come from the template and are empty for now.

Release views are in release/v.1.0.0/ :
- gds/TPU6882.gds.gz : layout.
- doc/drc/ : precheck report.

The datasheet and specification are in doc/.
Macro dependencies, including the coeur_v2 core and its nested macros, are in dependencies/.
