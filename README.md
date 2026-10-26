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
| project | [smoke #125](https://github.com/openXC7/demo-projects/actions/runs/40382267475) | [heavy #83](https://github.com/openXC7/demo-projects/actions/runs/40287606285) | [heavy #82](https://github.com/openXC7/demo-projects/actions/runs/40173148323) | [heavy #81](https://github.com/openXC7/demo-projects/actions/runs/40073349531) | [heavy #80](https://github.com/openXC7/demo-projects/actions/runs/39917539169) | [smoke #123](https://github.com/openXC7/demo-projects/actions/runs/39796659210) | [smoke #120](https://github.com/openXC7/demo-projects/actions/runs/39754726483) | [heavy #79](https://github.com/openXC7/demo-projects/actions/runs/39740857857) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693307) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810159) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382945) | · | 100% |
| `blinky-digilent-basys-3` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693454) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810029) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382461) | · | 100% |
| `blinky-digilent-zybo` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693316) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810480) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382545) | · | 100% |
| `blinky-genesys2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693272) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810431) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382405) | · | 100% |
| `blinky-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693281) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810117) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382541) | · | 100% |
| `blinky-qmtech` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693399) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809913) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382673) | · | 100% |
| `blinky-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693443) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809983) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382440) | · | 100% |
| `ddr3-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693644) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809933) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382460) | · | 100% |
| `dsp-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693444) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810854) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382516) | · | 100% |
| `litex-ddr-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693489) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810066) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382496) | · | 100% |
| `litex-ddr-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693402) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810295) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382540) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693804) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810302) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382619) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693543) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810025) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382808) | · | 100% |
| `litex-ddr-hpcstore-k420t` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40287606285/job/121455263468) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40173148323/job/121108346346) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40073349531/job/120811550916) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39917539169/job/120294890363) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39740857857/job/119706397455) | 100% |
| `litex-ddr-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693497) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810189) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382689) | · | 100% |
| `litex-ddr-qmtech-artix7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693502) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810040) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382734) | · | 100% |
| `litex-ddr-qmtech-kintex7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693452) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810268) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382454) | · | 100% |
| `litex-ddr-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693501) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810345) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382632) | · | 100% |
| `litex-minimal-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693523) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809982) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382653) | · | 100% |
| `litex-sata-alientek-davincipro` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693514) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810213) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382675) | · | 100% |
| `picosoc` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693487) | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810096) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382745) | · | 100% |

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
