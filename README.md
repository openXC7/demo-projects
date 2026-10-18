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
| project | [smoke #104](https://github.com/openXC7/demo-projects/actions/runs/39157176684) | [heavy #75](https://github.com/openXC7/demo-projects/actions/runs/39106716072) | [smoke #102](https://github.com/openXC7/demo-projects/actions/runs/39042453270) | [heavy #74](https://github.com/openXC7/demo-projects/actions/runs/39011512146) | [heavy #73](https://github.com/openXC7/demo-projects/actions/runs/38865001203) | [heavy #72](https://github.com/openXC7/demo-projects/actions/runs/38698258340) | [heavy #71](https://github.com/openXC7/demo-projects/actions/runs/38528857344) | [heavy #70](https://github.com/openXC7/demo-projects/actions/runs/38375632716) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349728) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666446) | · | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349754) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666388) | · | · | · | · | · | 100% |
| `blinky-digilent-zybo` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349746) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666370) | · | · | · | · | · | 100% |
| `blinky-genesys2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349682) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666376) | · | · | · | · | · | 100% |
| `blinky-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349671) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666338) | · | · | · | · | · | 100% |
| `blinky-qmtech` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349662) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666400) | · | · | · | · | · | 100% |
| `blinky-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349706) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666421) | · | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349720) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666351) | · | · | · | · | · | 100% |
| `dsp-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349677) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666380) | · | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349693) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666342) | · | · | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349749) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666413) | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349755) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666445) | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349807) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666444) | · | · | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39106716072/job/117614226371) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39011512146/job/117335019243) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38865001203/job/116856042337) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38698258340/job/116300276455) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38528857344/job/115736086954) | [✔](https://github.com/openXC7/demo-projects/actions/runs/38375632716/job/115223652479) | 100% |
| `litex-ddr-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349769) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666403) | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349815) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666473) | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349766) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666435) | · | · | · | · | · | 100% |
| `litex-ddr-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349710) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666451) | · | · | · | · | · | 100% |
| `litex-minimal-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349696) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666420) | · | · | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349881) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666478) | · | · | · | · | · | 100% |
| `picosoc` | [✔](https://github.com/openXC7/demo-projects/actions/runs/39157176684/job/117766349812) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39042453270/job/117427666493) | · | · | · | · | · | 100% |

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
