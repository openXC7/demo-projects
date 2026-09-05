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
| project | [heavy #32](https://github.com/openXC7/demo-projects/actions/runs/33951095240) | [heavy #31](https://github.com/openXC7/demo-projects/actions/runs/33847631903) | [heavy #30](https://github.com/openXC7/demo-projects/actions/runs/33726549229) | [heavy #29](https://github.com/openXC7/demo-projects/actions/runs/33601737861) | [heavy #28](https://github.com/openXC7/demo-projects/actions/runs/33483679497) | [heavy #27](https://github.com/openXC7/demo-projects/actions/runs/33373670574) | [heavy #26](https://github.com/openXC7/demo-projects/actions/runs/33301160866) | [smoke #53](https://github.com/openXC7/demo-projects/actions/runs/33253088369) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296797) | 100% |
| `blinky-digilent-basys-3` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296798) | 100% |
| `blinky-digilent-zybo` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296813) | 100% |
| `blinky-genesys2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296829) | 100% |
| `blinky-kc705` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296835) | 100% |
| `blinky-qmtech` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296904) | 100% |
| `blinky-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296830) | 100% |
| `ddr3-test-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296808) | 100% |
| `dsp-test-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296821) | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296826) | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296832) | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296814) | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296853) | 100% |
| `litex-ddr-hpcstore-k420t` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/33847631903/job/100944849562) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33726549229/job/100558749890) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33601737861/job/100159379078) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33483679497/job/99780784271) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33373670574/job/99432303687) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33301160866/job/99230418287) | · | 100% |
| `litex-ddr-kc705` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296803) | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296854) | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296872) | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296849) | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296812) | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296811) | 100% |
| `picosoc` | · | · | · | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296860) | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
