# OpenXC7 FPGA toolchain demo projects

This repository contains demo projects for various Xilinx Series 7
development boards. They are intended to give you a quick
and easy template to use as a basis for your own projects,
and also to demonstrate the current capabilites of the toolchain.

[![NLnet Foundation](https://img.shields.io/badge/funded%20by-NLnet%20Foundation-74AA00)](https://nlnet.nl/)
[![smoke](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml/badge.svg)](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml)
[![test matrix](https://img.shields.io/badge/test%20matrix-dashboard-blue)](https://openXC7.github.io/demo-projects/)

The [test matrix dashboard](https://openXC7.github.io/demo-projects/) shows
the pass/fail status of every demo project across recent CI runs; the table
below is the same matrix, embedded and updated by CI.

<!-- matrix-report:start -->
| project | [heavy #65](https://github.com/openXC7/demo-projects/actions/runs/37752862097) | [heavy #64](https://github.com/openXC7/demo-projects/actions/runs/37594733369) | [heavy #63](https://github.com/openXC7/demo-projects/actions/runs/37439351233) | [smoke #98](https://github.com/openXC7/demo-projects/actions/runs/37399939228) | [smoke #97](https://github.com/openXC7/demo-projects/actions/runs/37384521257) | [heavy #62](https://github.com/openXC7/demo-projects/actions/runs/37286670155) | [heavy #61](https://github.com/openXC7/demo-projects/actions/runs/37188769174) | [heavy #60](https://github.com/openXC7/demo-projects/actions/runs/37108327803) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154325) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720074) | · | · | · | 50% |
| `blinky-digilent-basys-3` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170153285) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022719997) | · | · | · | 50% |
| `blinky-digilent-zybo` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154303) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720111) | · | · | · | 50% |
| `blinky-genesys2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170153562) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720055) | · | · | · | 50% |
| `blinky-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154513) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720021) | · | · | · | 50% |
| `blinky-qmtech` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154355) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720054) | · | · | · | 50% |
| `blinky-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154394) | [✖](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720112) | · | · | · | 50% |
| `ddr3-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154326) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720049) | · | · | · | 100% |
| `dsp-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154146) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720068) | · | · | · | 100% |
| `litex-ddr-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154975) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720085) | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155225) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720050) | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155810) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720086) | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155466) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720289) | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/37752862097/job/113230668120) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37594733369/job/112704976453) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37439351233/job/112189433961) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37286670155/job/111687415964) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37188769174/job/111396546590) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37108327803/job/111161291687) | 100% |
| `litex-ddr-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155615) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720133) | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155937) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720091) | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155416) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720135) | · | · | · | 100% |
| `litex-ddr-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155399) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720075) | · | · | · | 100% |
| `litex-minimal-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170154885) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720070) | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155965) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720083) | · | · | · | 100% |
| `picosoc` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/37399939228/job/112170155320) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37384521257/job/112022720127) | · | · | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->

## Hardware checks

The matrix above is hardware-free: it proves a bitstream builds, not that it
behaves. Three demos ship a host-side console check to run against a real board.
These are manual checks by design — CI has no board attached, so nothing here
runs in a workflow; flash the design and run the script yourself.

- `dsp-test-arty-s7/verify.py` — captures the UART (115200 8N1) and checks
  `p == a*b` on every snapshot line, which is the signature of
  nextpnr-xilinx#159's missing DSP tile-constant bits.
- `lutram-test-arty-s7/verify.py` — checks a 64 x 8 distributed RAM, which
  yosys infers as 8 x `RAM64X1S` in 2 SLICEM sites (nextpnr-xilinx#195: those
  used to abort at packing). Four write/read passes (address-as-data,
  complement, and two mixed patterns) are re-derived host-side from the
  streamed `p<a> a=<addr> d=<data> e=<on-chip error count>` lines, so a packer
  that agrees with itself still fails. This demo cannot be built by the pinned
  toolchain until #195 is released, so it is not in the matrix yet.
- `ddr3-test-arty-s7/verify.py` — drives the controller's UART bridge
  (9600 8N1: write bytes `'a'..'z'`, read them back with `'A'..'Z'`) and
  checks the write/read-back pairs. A served read proves the controller
  reached DONE_CALIBRATE and that data survives the DDR3 round trip; the four
  debug LEDs only show the calibration state and cannot be scripted.
