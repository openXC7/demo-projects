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
| project | [heavy #82](https://github.com/openXC7/demo-projects/actions/runs/40173148323) | [heavy #81](https://github.com/openXC7/demo-projects/actions/runs/40073349531) | [heavy #80](https://github.com/openXC7/demo-projects/actions/runs/39917539169) | [smoke #123](https://github.com/openXC7/demo-projects/actions/runs/39796659210) | [smoke #120](https://github.com/openXC7/demo-projects/actions/runs/39754726483) | [heavy #79](https://github.com/openXC7/demo-projects/actions/runs/39740857857) | [smoke #117](https://github.com/openXC7/demo-projects/actions/runs/39675473164) | [smoke #114](https://github.com/openXC7/demo-projects/actions/runs/39625350807) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810159) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382945) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435943) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805897) | 100% |
| `blinky-digilent-basys-3` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810029) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382461) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435915) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805847) | 100% |
| `blinky-digilent-zybo` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810480) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382545) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435941) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805839) | 100% |
| `blinky-genesys2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810431) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382405) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435854) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320806500) | 100% |
| `blinky-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810117) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382541) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436065) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805742) | 100% |
| `blinky-qmtech` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809913) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382673) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436075) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805737) | 100% |
| `blinky-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809983) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382440) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436097) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320806044) | 100% |
| `ddr3-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809933) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382460) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435896) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805905) | 100% |
| `dsp-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810854) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382516) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435819) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805993) | 100% |
| `litex-ddr-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810066) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382496) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436088) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805973) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810295) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382540) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436056) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805948) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810302) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382619) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435893) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320806418) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810025) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382808) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436027) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805873) | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40173148323/job/121108346346) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40073349531/job/120811550916) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39917539169/job/120294890363) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39740857857/job/119706397455) | · | · | 100% |
| `litex-ddr-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810189) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382689) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436049) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805967) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810040) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382734) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435972) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320806151) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810268) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382454) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435961) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805935) | 100% |
| `litex-ddr-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810345) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382632) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435847) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805947) | 100% |
| `litex-minimal-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891809982) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382653) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435951) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805853) | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810213) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382675) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493435953) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320806195) | 100% |
| `picosoc` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39796659210/job/119891810096) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39754726483/job/119749382745) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/39675473164/job/119493436017) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39625350807/job/119320805996) | 100% |

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
