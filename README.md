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
| project | [heavy #70](https://github.com/openXC7/demo-projects/actions/runs/38375632716) | [heavy #69](https://github.com/openXC7/demo-projects/actions/runs/38227775446) | [heavy #68](https://github.com/openXC7/demo-projects/actions/runs/38125829504) | [heavy #67](https://github.com/openXC7/demo-projects/actions/runs/38037865203) | [heavy #66](https://github.com/openXC7/demo-projects/actions/runs/37908139649) | [heavy #65](https://github.com/openXC7/demo-projects/actions/runs/37752862097) | [heavy #64](https://github.com/openXC7/demo-projects/actions/runs/37594733369) | [heavy #63](https://github.com/openXC7/demo-projects/actions/runs/37439351233) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-basys-3` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-zybo` | · | · | · | · | · | · | · | · | — |
| `blinky-genesys2` | · | · | · | · | · | · | · | · | — |
| `blinky-kc705` | · | · | · | · | · | · | · | · | — |
| `blinky-qmtech` | · | · | · | · | · | · | · | · | — |
| `blinky-stlv7325` | · | · | · | · | · | · | · | · | — |
| `ddr3-test-arty-s7` | · | · | · | · | · | · | · | · | — |
| `dsp-test-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/38375632716/job/115223652479) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38227775446/job/114739848749) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38125829504/job/114430050758) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38037865203/job/114172159799) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37908139649/job/113746837385) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37752862097/job/113230668120) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37594733369/job/112704976453) | [✔](https://github.com/openXC7/demo-projects/actions/runs/37439351233/job/112189433961) | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-minimal-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | · | · | · | — |
| `picosoc` | · | · | · | · | · | · | · | · | — |

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
