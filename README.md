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
| project | [smoke #128](https://github.com/openXC7/demo-projects/actions/runs/40452437915) | [smoke #127](https://github.com/openXC7/demo-projects/actions/runs/40432497425) | [smoke #126](https://github.com/openXC7/demo-projects/actions/runs/40426618200) | [smoke #125](https://github.com/openXC7/demo-projects/actions/runs/40382267475) | [heavy #83](https://github.com/openXC7/demo-projects/actions/runs/40287606285) | [heavy #82](https://github.com/openXC7/demo-projects/actions/runs/40173148323) | [heavy #81](https://github.com/openXC7/demo-projects/actions/runs/40073349531) | [heavy #80](https://github.com/openXC7/demo-projects/actions/runs/39917539169) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586661) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320122) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088198) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693307) | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586589) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319430) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088276) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693454) | · | · | · | · | 100% |
| `blinky-digilent-zybo` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586569) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319805) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088295) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693316) | · | · | · | · | 100% |
| `blinky-genesys2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586553) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319895) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088267) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693272) | · | · | · | · | 100% |
| `blinky-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586627) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320298) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088186) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693281) | · | · | · | · | 100% |
| `blinky-qmtech` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586663) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319908) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088308) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693399) | · | · | · | · | 100% |
| `blinky-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586657) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319979) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088159) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693443) | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586697) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319824) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088248) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693644) | · | · | · | · | 100% |
| `dsp-test-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586586) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320485) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088165) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693444) | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586655) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320368) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088328) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693489) | · | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586640) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001319788) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088312) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693402) | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586648) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320922) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088490) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693804) | · | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586602) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320461) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088341) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693543) | · | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/40287606285/job/121455263468) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40173148323/job/121108346346) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40073349531/job/120811550916) | [✔](https://github.com/openXC7/demo-projects/actions/runs/39917539169/job/120294890363) | 100% |
| `litex-ddr-kc705` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586688) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320818) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088331) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693497) | · | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586583) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001321201) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088452) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693502) | · | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586566) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320127) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088313) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693452) | · | · | · | · | 100% |
| `litex-ddr-stlv7325` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586660) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320703) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088376) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693501) | · | · | · | · | 100% |
| `litex-minimal-arty-s7` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586664) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320523) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088231) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693523) | · | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586625) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001320989) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088399) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693514) | · | · | · | · | 100% |
| `picosoc` | [✔](https://github.com/openXC7/demo-projects/actions/runs/40452437915/job/122024586616) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40432497425/job/122001321407) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40426618200/job/121942088273) | [✔](https://github.com/openXC7/demo-projects/actions/runs/40382267475/job/121788693487) | · | · | · | · | 100% |

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
