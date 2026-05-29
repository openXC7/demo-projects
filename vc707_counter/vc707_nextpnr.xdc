# SPDX-License-Identifier: ISC
#
# VC707 constraints for the FIRST OPEN-FLOW (nextpnr-xilinx) smoke-test of the
# 8-bit counter on xc7vx485tffg1761-2.
#
# Differences from vc707.xdc (the Vivado reference build):
#   - clk is single-ended (the suite's frontend doesn't model IBUFDS yet).
#     For the smoke test we pin it to GPIO_SW_N (north pushbutton, AR40) so
#     nextpnr can place/route the design end-to-end; the design won't actually
#     oscillate at 200 MHz from a pushbutton, but routing is what we're verifying.
#   - LED port names use the suite's __N indexing instead of [N] brackets,
#     matching the JSON cell names.

# ---- "clock" (pushbutton stand-in for smoke test) ----
set_property PACKAGE_PIN AR40 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
create_clock -period 10.000 -name sysclk [get_ports clk]

# ---- CPU_RESET pushbutton ----
set_property PACKAGE_PIN AV40 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

# ---- 8 user LEDs (HP banks 16/17/18, LVCMOS18) ----
set_property PACKAGE_PIN AM39 [get_ports led__0]
set_property PACKAGE_PIN AN39 [get_ports led__1]
set_property PACKAGE_PIN AR37 [get_ports led__2]
set_property PACKAGE_PIN AT37 [get_ports led__3]
set_property PACKAGE_PIN AR35 [get_ports led__4]
set_property PACKAGE_PIN AP41 [get_ports led__5]
set_property PACKAGE_PIN AP42 [get_ports led__6]
set_property PACKAGE_PIN AU39 [get_ports led__7]
# nextpnr-xilinx XDC parser doesn't expand wildcards; list each port.
set_property IOSTANDARD LVCMOS18 [get_ports led__0]
set_property IOSTANDARD LVCMOS18 [get_ports led__1]
set_property IOSTANDARD LVCMOS18 [get_ports led__2]
set_property IOSTANDARD LVCMOS18 [get_ports led__3]
set_property IOSTANDARD LVCMOS18 [get_ports led__4]
set_property IOSTANDARD LVCMOS18 [get_ports led__5]
set_property IOSTANDARD LVCMOS18 [get_ports led__6]
set_property IOSTANDARD LVCMOS18 [get_ports led__7]
