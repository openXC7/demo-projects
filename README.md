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
| project | [heavy #45](https://github.com/openXC7/demo-projects/actions/runs/35319052127) | [heavy #44](https://github.com/openXC7/demo-projects/actions/runs/35195230900) | [heavy #43](https://github.com/openXC7/demo-projects/actions/runs/35069581628) | [heavy #42](https://github.com/openXC7/demo-projects/actions/runs/34942875200) | [heavy #41](https://github.com/openXC7/demo-projects/actions/runs/34819808512) | [smoke #74](https://github.com/openXC7/demo-projects/actions/runs/34786652699) | [smoke #73](https://github.com/openXC7/demo-projects/actions/runs/34786457697) | [smoke #72](https://github.com/openXC7/demo-projects/actions/runs/34782068034) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808508949) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382219) | 100% |
| `blinky-digilent-basys-3` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808508986) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382168) | 100% |
| `blinky-digilent-zybo` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509082) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382257) | 100% |
| `blinky-genesys2` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509022) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382172) | 100% |
| `blinky-kc705` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509007) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382156) | 100% |
| `blinky-qmtech` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509116) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382143) | 100% |
| `blinky-stlv7325` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509078) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382202) | 100% |
| `ddr3-test-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509045) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382151) | 100% |
| `dsp-test-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509080) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382241) | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509013) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382196) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509069) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382215) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509068) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382255) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509002) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382209) | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/35319052127/job/105519253948) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35195230900/job/105118968222) | [✔](https://github.com/openXC7/demo-projects/actions/runs/35069581628/job/104710328809) | [✔](https://github.com/openXC7/demo-projects/actions/runs/34942875200/job/104297422090) | [✔](https://github.com/openXC7/demo-projects/actions/runs/34819808512/job/103910886311) | · | · | · | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509072) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382181) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808508988) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382197) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509047) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382216) | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509006) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382249) | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509026) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382214) | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509063) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382190) | 100% |
| `picosoc` | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34786652699/job/103808509008) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34782068034/job/103796382183) | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->

## Hardware checks

The matrix above is hardware-free: it proves a bitstream builds, not that it
behaves. Two demos ship a host-side console check to run against a real board.
These are manual checks by design — CI has no board attached, so nothing here
runs in a workflow; flash the design and run the script yourself.

- `dsp-test-arty-s7/verify.py` — captures the UART (115200 8N1) and checks
  `p == a*b` on every snapshot line, which is the signature of
  nextpnr-xilinx#159's missing DSP tile-constant bits.
- `ddr3-test-arty-s7/verify.py` — drives the controller's UART bridge
  (9600 8N1: write bytes `'a'..'z'`, read them back with `'A'..'Z'`) and
  checks the write/read-back pairs. A served read proves the controller
  reached DONE_CALIBRATE and that data survives the DDR3 round trip; the four
  debug LEDs only show the calibration state and cannot be scripted.
