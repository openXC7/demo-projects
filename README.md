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
| project | [heavy #29](https://github.com/openXC7/demo-projects/actions/runs/33601737861) | [heavy #28](https://github.com/openXC7/demo-projects/actions/runs/33483679497) | [heavy #27](https://github.com/openXC7/demo-projects/actions/runs/33373670574) | [heavy #26](https://github.com/openXC7/demo-projects/actions/runs/33301160866) | [smoke #53](https://github.com/openXC7/demo-projects/actions/runs/33253088369) | [heavy #25](https://github.com/openXC7/demo-projects/actions/runs/33244398153) | [smoke #52](https://github.com/openXC7/demo-projects/actions/runs/33241913743) | [smoke #51](https://github.com/openXC7/demo-projects/actions/runs/33241804770) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296797) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949917) | · | 100% |
| `blinky-digilent-basys-3` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296798) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949890) | · | 100% |
| `blinky-digilent-zybo` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296813) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949966) | · | 100% |
| `blinky-genesys2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296829) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949886) | · | 100% |
| `blinky-kc705` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296835) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949892) | · | 100% |
| `blinky-qmtech` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296904) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949896) | · | 100% |
| `blinky-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296830) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949895) | · | 100% |
| `ddr3-test-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296808) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949918) | · | 100% |
| `dsp-test-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296821) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949952) | · | 100% |
| `litex-ddr-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296826) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949954) | · | 100% |
| `litex-ddr-enclustra-kx2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296832) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949923) | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296814) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949906) | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296853) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949909) | · | 100% |
| `litex-ddr-hpcstore-k420t` | … | [✔](https://github.com/openXC7/demo-projects/actions/runs/33483679497/job/99780784271) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33373670574/job/99432303687) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33301160866/job/99230418287) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33244398153/job/99083368567) | · | · | 100% |
| `litex-ddr-kc705` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296803) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949915) | · | 100% |
| `litex-ddr-qmtech-artix7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296854) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949941) | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296872) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949932) | · | 100% |
| `litex-ddr-stlv7325` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296849) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949933) | · | 100% |
| `litex-minimal-arty-s7` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296812) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949929) | · | 100% |
| `litex-sata-alientek-davincipro` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296811) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949940) | · | 100% |
| `picosoc` | · | · | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33253088369/job/99105296860) | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/33241913743/job/99076949942) | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
