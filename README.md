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
| project | [heavy #116](https://github.com/openXC7/demo-projects/actions/runs/46134430087) | [heavy #115](https://github.com/openXC7/demo-projects/actions/runs/45984958342) | [heavy #114](https://github.com/openXC7/demo-projects/actions/runs/45804592162) | [smoke #154](https://github.com/openXC7/demo-projects/actions/runs/45774259896) | [smoke #152](https://github.com/openXC7/demo-projects/actions/runs/45702251715) | [heavy #113](https://github.com/openXC7/demo-projects/actions/runs/45602084075) | [heavy #112](https://github.com/openXC7/demo-projects/actions/runs/45392987259) | [smoke #149](https://github.com/openXC7/demo-projects/actions/runs/45349093651) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736555) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915548) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275986) | 100% |
| `blinky-digilent-basys-3` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736550) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915565) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275757) | 100% |
| `blinky-digilent-zybo` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736562) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915557) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275719) | 100% |
| `blinky-genesys2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736540) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915556) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275732) | 100% |
| `blinky-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736584) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915708) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275739) | 100% |
| `blinky-qmtech` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736486) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523916048) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275764) | 100% |
| `blinky-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736537) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915667) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275745) | 100% |
| `bscan-user1-alinx-ax7035b` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736524) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915748) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275789) | 100% |
| `ddr3-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736549) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915690) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275650) | 100% |
| `dsp-test-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736554) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915697) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275706) | 100% |
| `litex-ddr-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736627) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915594) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275684) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736534) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915873) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297276281) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736508) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915616) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275785) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736496) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915771) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275770) | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/46134430087/job/140946659174) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45984958342/job/140458635972) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45804592162/job/139856785999) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45602084075/job/139163722616) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45392987259/job/138441732997) | · | 100% |
| `litex-ddr-kc705` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736522) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915572) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275786) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736560) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915912) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275728) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736564) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915631) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275742) | 100% |
| `litex-ddr-stlv7325` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736547) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915700) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275700) | 100% |
| `litex-minimal-arty-s7` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736600) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915682) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275930) | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736589) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915726) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275921) | 100% |
| `picosoc` | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45774259896/job/139759736539) | [✔](https://github.com/openXC7/demo-projects/actions/runs/45702251715/job/139523915784) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/45349093651/job/138297275849) | 100% |

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
