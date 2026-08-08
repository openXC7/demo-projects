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
| project | [smoke #10](https://github.com/openXC7/demo-projects/actions/runs/31263970790) | [smoke #9](https://github.com/openXC7/demo-projects/actions/runs/31263850143) | [smoke #8](https://github.com/openXC7/demo-projects/actions/runs/31263554216) | [smoke #7](https://github.com/openXC7/demo-projects/actions/runs/31263547825) | [smoke #6](https://github.com/openXC7/demo-projects/actions/runs/31263538282) | [smoke #5](https://github.com/openXC7/demo-projects/actions/runs/31250283089) | [smoke #4](https://github.com/openXC7/demo-projects/actions/runs/31248356376) | [smoke #3](https://github.com/openXC7/demo-projects/actions/runs/31242357046) | pass rate |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `heavy-artix7` | · | · | · | · | · | · | · | · | — |
| `heavy-kintex7` | · | · | · | · | · | · | · | · | — |
| `heavy-spartan7` | · | · | · | · | · | · | · | · | — |
| `matrix.project` | · | … | … | … | … | … | … | · | — |
| `projects-${{ matrix.family }}` | · | · | · | · | · | · | · | … | — |

✔ pass · ✖ fail · … running / cancelled · · not in run. Newest run left. Cells link to the workflow job.

<!-- matrix-report:end -->
