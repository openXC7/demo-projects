#!/usr/bin/env python3

#
# This file is part of LiteX-Boards.
#
# Copyright (c) 2023 Gabriel Somlo <gsomlo@gmail.com>
# Copyright (c) 2022 Andrew Gillham <gillham@roadsign.com>
# Copyright (c) 2014-2015 Sebastien Bourdeauducq <sb@m-labs.hk>
# Copyright (c) 2014-2020 Florent Kermarrec <florent@enjoy-digital.fr>
# Copyright (c) 2014-2015 Yann Sionneau <ys@m-labs.hk>
# SPDX-License-Identifier: BSD-2-Clause

import os

from migen import *

from litex.gen import *

from litex_boards.platforms import sitlinv_stlv7325_v2

from litex.soc.cores.clock import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.led import LedChaser
from litex.soc.cores.video   import VideoS6HDMIPHY

# CRG ----------------------------------------------------------------------------------------------

class _CRG(LiteXModule):
    def __init__(self, platform, sys_clk_freq):
        self.rst       = Signal()
        self.cd_sys    = ClockDomain()
        self.cd_hdmi   = ClockDomain()
        self.cd_hdmi5x = ClockDomain()

        # # #

        # Clk/Rst.
        clk200 = platform.request("clk200")
        clk50  = platform.request("clk50")
        rst_n  = platform.request("cpu_reset_n")

        # PLL.
        self.pll = pll = S7PLL(speedgrade=-2)
        self.comb += pll.reset.eq(~rst_n | self.rst)
        pll.register_clkin(clk200, 200e6)
        pll.create_clkout(self.cd_sys,    sys_clk_freq)
        platform.add_false_path_constraints(self.cd_sys.clk, pll.clkin) # Ignore sys_clk to pll.clkin path created by SoC's rst.

        self.submodules.pll2 = pll2 = S7PLL(speedgrade=-2)
        self.comb += pll2.reset.eq(~rst_n | self.rst)
        pll2.register_clkin(clk50, 50e6)
        pll2.create_clkout(self.cd_hdmi,   25e6,  margin=0)
        pll2.create_clkout(self.cd_hdmi5x, 125e6, margin=0)

# BaseSoC ------------------------------------------------------------------------------------------

class BaseSoC(SoCCore):
    def __init__(self, sys_clk_freq=100e6,
        vccio                  = "3.3V",
        with_led_chaser        = True,
        with_video_colorbars   = True,
        with_video_framebuffer = False,
        **kwargs):
        platform = sitlinv_stlv7325_v2.Platform(vccio)

        # CRG --------------------------------------------------------------------------------------
        self.crg = _CRG(platform, sys_clk_freq)

        kwargs['cpu_type'] = None
        kwargs["uart_name"] = "crossover"
        kwargs['integrated_sram_size'] = 0

        # SoCCore ----------------------------------------------------------------------------------
        SoCCore.__init__(self, platform, sys_clk_freq, ident="LiteX SoC on Sitlinv STLV7325-v2", **kwargs)

        self.add_uartbone(name="serial", baudrate=kwargs["uart_baudrate"])

        # HDMI Options -----------------------------------------------------------------------------
        if (with_video_colorbars or with_video_framebuffer):
            self.submodules.videophy = VideoS6HDMIPHY(platform.request("hdmi_out"), clock_domain="hdmi")
            if with_video_colorbars:
                self.add_video_colorbars(phy=self.videophy, timings="640x480@60Hz", clock_domain="hdmi")
            if with_video_framebuffer:
                self.add_video_framebuffer(phy=self.videophy, timings="640x480@60Hz", clock_domain="hdmi")

        # Leds -------------------------------------------------------------------------------------
        if with_led_chaser:
            self.leds = LedChaser(
                pads         = platform.request_all("user_led_n"),
                sys_clk_freq = sys_clk_freq)

# Build --------------------------------------------------------------------------------------------

def main():
    from litex.build.parser import LiteXArgumentParser
    parser = LiteXArgumentParser(platform=sitlinv_stlv7325_v2.Platform, description="LiteX SoC on AliExpress STLV7325-v2.")
    parser.add_target_argument("--sys-clk-freq",  default=100e6, type=float, help="System clock frequency.")
    parser.add_target_argument("--vccio",         default="3.3V", type=str, help="IO Voltage (set by J4), can be 2.5V or 3.3V")
    viopts = parser.target_group.add_mutually_exclusive_group()
    viopts.add_argument("--with-video-framebuffer", action="store_true", help="Enable Video Framebuffer (HDMI).")
    args = parser.parse_args()

    soc = BaseSoC(
        sys_clk_freq           = args.sys_clk_freq,
        vccio                  = args.vccio,
        with_video_colorbars   = not args.with_video_framebuffer,
        with_video_framebuffer = args.with_video_framebuffer,
        **parser.soc_argdict
    )
    builder = Builder(soc, **parser.builder_argdict)
    if args.build:
        builder.build(**parser.toolchain_argdict)

    if args.load:
        prog = soc.platform.create_programmer()
        prog.load_bitstream(builder.get_bitstream_filename(mode="sram"))

if __name__ == "__main__":
    main()
