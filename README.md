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
| project | [heavy #35](https://github.com/openXC7/demo-projects/actions/runs/34198175859) | [smoke #55](https://github.com/openXC7/demo-projects/actions/runs/34174929706) | [smoke #54](https://github.com/openXC7/demo-projects/actions/runs/34174106448) | [heavy #34](https://github.com/openXC7/demo-projects/actions/runs/34094718658) | [heavy #33](https://github.com/openXC7/demo-projects/actions/runs/34018215700) | [heavy #32](https://github.com/openXC7/demo-projects/actions/runs/33951095240) | [heavy #31](https://github.com/openXC7/demo-projects/actions/runs/33847631903) | [heavy #30](https://github.com/openXC7/demo-projects/actions/runs/33726549229) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `blinky-digilent-arty` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342535) | · | · | · | · | · | · | 100% |
| `blinky-digilent-basys-3` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342529) | · | · | · | · | · | · | 100% |
| `blinky-digilent-zybo` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342497) | · | · | · | · | · | · | 100% |
| `blinky-genesys2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342485) | · | · | · | · | · | · | 100% |
| `blinky-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342505) | · | · | · | · | · | · | 100% |
| `blinky-qmtech` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342487) | · | · | · | · | · | · | 100% |
| `blinky-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342540) | · | · | · | · | · | · | 100% |
| `ddr3-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342657) | · | · | · | · | · | · | 100% |
| `dsp-test-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342514) | · | · | · | · | · | · | 100% |
| `litex-ddr-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342553) | · | · | · | · | · | · | 100% |
| `litex-ddr-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342508) | · | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-enclustra-kx2` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342555) | · | · | · | · | · | · | 100% |
| `litex-ddr-hdmi-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342583) | · | · | · | · | · | · | 100% |
| `litex-ddr-hpcstore-k420t` | [✔](https://github.com/openXC7/demo-projects/actions/runs/34198175859/job/101972454397) | · | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34094718658/job/101657614913) | [✔](https://github.com/openXC7/demo-projects/actions/runs/34018215700/job/101446736058) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33951095240/job/101266804117) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33847631903/job/100944849562) | [✔](https://github.com/openXC7/demo-projects/actions/runs/33726549229/job/100558749890) | 100% |
| `litex-ddr-kc705` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342515) | · | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-artix7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342644) | · | · | · | · | · | · | 100% |
| `litex-ddr-qmtech-kintex7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342499) | · | · | · | · | · | · | 100% |
| `litex-ddr-stlv7325` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342572) | · | · | · | · | · | · | 100% |
| `litex-minimal-arty-s7` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342550) | · | · | · | · | · | · | 100% |
| `litex-sata-alientek-davincipro` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342585) | · | · | · | · | · | · | 100% |
| `picosoc` | · | [✔](https://github.com/openXC7/demo-projects/actions/runs/34174929706/job/101907342604) | · | · | · | · | · | · | 100% |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
