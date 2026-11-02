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
| project | [heavy #90](https://github.com/openXC7/demo-projects/actions/runs/41420282685) | [heavy #89](https://github.com/openXC7/demo-projects/actions/runs/41291870069) | [heavy #88](https://github.com/openXC7/demo-projects/actions/runs/41184286569) | [heavy #87](https://github.com/openXC7/demo-projects/actions/runs/41027184156) | [heavy #86](https://github.com/openXC7/demo-projects/actions/runs/40841828009) | [heavy #85](https://github.com/openXC7/demo-projects/actions/runs/40656353389) | [heavy #84](https://github.com/openXC7/demo-projects/actions/runs/40469022284) | [smoke #129](https://github.com/openXC7/demo-projects/actions/runs/40463847493) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767648) | 100% |
| `blinky-digilent-basys-3` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767560) | 100% |
| `blinky-digilent-zybo` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767556) | 100% |
| `blinky-genesys2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767628) | 100% |
| `blinky-kc705` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767526) | 100% |
| `blinky-qmtech` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767471) | 100% |
| `blinky-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767466) | 100% |
| `ddr3-test-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767567) | 100% |
| `dsp-test-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767497) | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767692) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767639) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767546) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767702) | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/41420282685/job/125194455311) | [✔](https://github.com/openXC7/demo-projects/actions/runs/41291870069/job/124804842256) | [✔](https://github.com/openXC7/demo-projects/actions/runs/41184286569/job/124488104741) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40841828009/job/123340232852) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40656353389/job/122708713957) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40469022284/job/122078790783) | · | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767572) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767574) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767662) | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767644) | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767678) | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767659) | 100% |
| `picosoc` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40463847493/job/122061767638) | 100% |

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
