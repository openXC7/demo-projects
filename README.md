# OpenXC7 FPGA toolchain demo projects

This repository contains demo projects for various Xilinx Series 7
development boards. They are intended to give you a quick
and easy template to use as a basis for your own projects,
and also to demonstrate the current capabilites of the toolchain.

[![smoke](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml/badge.svg)](https://github.com/openXC7/demo-projects/actions/workflows/smoke.yml)
[![test matrix](https://img.shields.io/badge/test%20matrix-dashboard-blue)](https://openXC7.github.io/demo-projects/)

The [test matrix dashboard](https://openXC7.github.io/demo-projects/) shows
the pass/fail status of every demo project across recent CI runs; the table
below is the same matrix, embedded and updated by CI.

<!-- matrix-report:start -->
| project | [heavy #6](https://github.com/openXC7/demo-projects/actions/runs/31354402270) | [smoke #20](https://github.com/openXC7/demo-projects/actions/runs/31342025218) | [smoke #19](https://github.com/openXC7/demo-projects/actions/runs/31341846297) | [smoke #18](https://github.com/openXC7/demo-projects/actions/runs/31341166077) | [smoke #17](https://github.com/openXC7/demo-projects/actions/runs/31340132017) | [smoke #16](https://github.com/openXC7/demo-projects/actions/runs/31339377395) | [heavy #5](https://github.com/openXC7/demo-projects/actions/runs/31339277464) | [smoke #15](https://github.com/openXC7/demo-projects/actions/runs/31339277763) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-allaboutfpga-edgez7-20` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125802) | · | · | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125829) | · | · | · | · | · | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125824) | · | · | · | · | · | · | 100% |
| `blinky-genesys2` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125811) | · | · | · | · | · | · | 0% |
| `blinky-kc705` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125820) | · | · | · | · | · | · | 0% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125808) | · | · | · | · | · | · | 100% |
| `blinky-stlv7325` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125818) | · | · | · | · | · | · | 0% |
| `blinky-ypcb003381p1` | · | · | · | · | · | · | · | · | — |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125832) | · | · | · | · | · | · | 100% |
| `hdmi-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-arty-s7` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125844) | · | · | · | · | · | · | 0% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125833) | · | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125836) | · | · | · | · | · | · | 0% |
| `litex-ddr-hdmi-stlv7325` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125862) | · | · | · | · | · | · | 0% |
| `litex-ddr-hpcstore-k420t` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-kc705` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125825) | · | · | · | · | · | · | 0% |
| `litex-ddr-qmtech-artix7` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125837) | · | · | · | · | · | · | 0% |
| `litex-ddr-qmtech-kintex7` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125846) | · | · | · | · | · | · | 0% |
| `litex-ddr-stlv7325` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125831) | · | · | · | · | · | · | 0% |
| `picosoc` | · | [✖](https://github.com/openXC7/demo-projects/actions/runs/31342025218/job/93330125838) | · | · | · | · | · | · | 0% |
| `ps7-blinky-digilent-pynqz1` | · | · | · | · | · | · | · | · | — |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
