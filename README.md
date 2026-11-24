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
| project | [heavy #112](https://github.com/openXC7/demo-projects/actions/runs/45392987259) | [smoke #149](https://github.com/openXC7/demo-projects/actions/runs/45349093651) | [smoke #147](https://github.com/openXC7/demo-projects/actions/runs/45274564555) | [heavy #111](https://github.com/openXC7/demo-projects/actions/runs/45158247438) | [heavy #110](https://github.com/openXC7/demo-projects/actions/runs/45008759458) | [heavy #109](https://github.com/openXC7/demo-projects/actions/runs/44890738547) | [smoke #145](https://github.com/openXC7/demo-projects/actions/runs/44883500802) | [heavy #108](https://github.com/openXC7/demo-projects/actions/runs/44715025053) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275986) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687222) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652334) | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275757) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687505) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652418) | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275719) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687570) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652306) | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275732) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687312) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652172) | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275739) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687365) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652198) | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275764) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687371) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652298) | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275745) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687310) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652291) | · | 100% |
| `bscan-user1-alinx-ax7035b` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275789) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687324) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652332) | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275650) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687431) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652256) | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275706) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687630) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652299) | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275684) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687425) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652317) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297276281) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687465) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652335) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275785) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687461) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652311) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275770) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687483) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652316) | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/45392987259/job/138441732997) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45158247438/job/137637111532) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45008759458/job/137166392897) | [✔](https://github.com/openXC7/demo-projects/actions/runs/44890738547/job/136806007374) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44715025053/job/136216413246) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275786) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687776) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652297) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275728) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687377) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652331) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275742) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687407) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652213) | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275700) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687408) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652315) | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275930) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687518) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652285) | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275921) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687482) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652349) | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275849) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45274564555/job/138052687406) | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/44883500802/job/136786652346) | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->

## Hardware checks

The matrix above is hardware-free: it proves a bitstream builds, not that it
behaves. Four demos ship a host-side check to run against a real board.
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
- `bscan-user1-alinx-ax7035b/user1-test.tcl` — an OpenOCD script (`make test`)
  for an 8-bit register behind the JTAG USER1 instruction (`BSCANE2`): it
  writes eight values to the board's LEDs through the JTAG cable and reads each
  one back from the register, so the write, UPDATE and capture paths are
  checked without a UART and without anyone looking at the LEDs.
