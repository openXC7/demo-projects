The per-design vc707_* dirs follow this convention:

  Source:        .v, .xdc, .tcl, .c, .s, .lds, .h, .json   ← committed
  Reports:       utilization.rpt, timing.rpt, clocks.rpt   ← committed (small)
  Final bits:    <name>.bit (Vivado), <name>_openflow.bit  ← committed
  Round-tripped: <name>.fasm                                ← committed (small)

Excluded by repo-root .gitignore:
  Vivado scratch (.cache/, .runs/, .hw/, .ip_user_files/, .Xil/, *.log, *.jou)
  FASM-pipeline scratch (*.frm — they're 50+ MB and regenerable)
  fasm2bels scratch (4 GB connection-database SQLite under fasm2bels_work/)
