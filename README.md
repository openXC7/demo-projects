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
| project | [heavy #21](https://github.com/openXC7/demo-projects/actions/runs/32804160451) | [heavy #20](https://github.com/openXC7/demo-projects/actions/runs/32685761828) | [heavy #19](https://github.com/openXC7/demo-projects/actions/runs/32614802817) | [heavy #18](https://github.com/openXC7/demo-projects/actions/runs/32548005539) | [heavy #17](https://github.com/openXC7/demo-projects/actions/runs/32442624444) | [heavy #16](https://github.com/openXC7/demo-projects/actions/runs/32327139723) | [heavy #15](https://github.com/openXC7/demo-projects/actions/runs/32211097670) | [heavy #14](https://github.com/openXC7/demo-projects/actions/runs/32094271900) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-basys-3` | · | · | · | · | · | · | · | · | — |
| `blinky-digilent-zybo` | · | · | · | · | · | · | · | · | — |
| `blinky-genesys2` | · | · | · | · | · | · | · | · | — |
| `blinky-kc705` | · | · | · | · | · | · | · | · | — |
| `blinky-qmtech` | · | · | · | · | · | · | · | · | — |
| `blinky-stlv7325` | · | · | · | · | · | · | · | · | — |
| `ddr3-test-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/32804160451/job/97672141608) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32685761828/job/97311593327) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32614802817/job/97134500270) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32548005539/job/96970973433) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32442624444/job/96663004665) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32327139723/job/96307516432) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32211097670/job/95951152459) | [✔](https://github.com/openXC7/demo-projects/actions/runs/32094271900/job/95589707771) | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | · | · | · | — |
| `litex-ddr-stlv7325` | · | · | · | · | · | · | · | · | — |
| `litex-minimal-arty-s7` | · | · | · | · | · | · | · | · | — |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | · | · | · | — |
| `picosoc` | · | · | · | · | · | · | · | · | — |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
