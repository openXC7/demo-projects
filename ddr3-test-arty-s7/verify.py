#!/usr/bin/env python3
"""Host-side DDR3 check for the arty-s7 ddr3-test demo.

The bitstream is the Forencich DDR3 controller with a UART bridge onto its
Wishbone port (arty_ddr3.v): a received byte in 'a'..'z' writes that byte at
addr = ~byte, a received byte in 'A'..'Z' reads addr = ~(byte + 32), and every
acked transaction is transmitted back.  'a' and 'A' therefore address the same
location, so a write/read-back pair proves

  * the controller left reset and reached DONE_CALIBRATE -- o_wb_stall is only
    cleared in that state (ddr3_controller.v), so a served read is calibration
    success, and
  * data survives the DDR3 round trip at the addresses the bridge picks.

The design's only other indicator is led[3:0], which lights while
state_calibrate == DONE_CALIBRATE; this check is scriptable and exercises the
read datapath as well.

Link: 9600 8N1.  The controller runs at 83.333 MHz (100 MHz on R2 through the
MMCM: CLKFBOUT_MULT 10 / CLKOUT0_DIVIDE 12) and the AXI-Stream UART holds each
bit for prescale x 8 clocks = 1085 x 8, i.e. 83.333e6 / 8680 = 9600 baud --
not the 115200 of the LiteX demos, so do not capture this design with their
settings.

Modes:
    verify.py [--port /dev/ttyUSB2] [--baud 9600] [--window 2.0]
              [--tries 3] [--log FILE]
        drive the board and print a PASS/FAIL summary.  Reads are retried
        (the bridge's UART drops some write acks, so a single silent read is
        a link flake, not a data error); a byte that arrives is compared
        as-is.

    verify.py --file FILE
        re-check a transcript written by --log (no hardware needed).

This is a manual check: it needs an Arty S7 attached to the host, which CI
does not have, so it is deliberately not wired into any workflow.  Run it by
hand after flashing, or re-check a saved transcript offline.

Exit status: 0 pass, 1 fail, 2 no response / cannot open the port.
"""
import argparse
import re
import sys
import time

# (write byte, read byte, expected read value).  'a' and 'A' map to the same
# address (~0x61); the pairs are on distinct addresses so a single-byte latch
# cannot pass.
CASES = [("a", "A", 0x61), ("m", "M", 0x6D), ("z", "Z", 0x7A)]
PROBE = "A"                     # read of a location nothing has written yet

LINE_RE = re.compile(r"^([WR]) ([0-9a-f]{2}) ([0-9a-f]{2}|--)")


def xfer(ser, byte, window):
    """Send one command byte, return everything the design sent back."""
    ser.reset_input_buffer()
    ser.write(bytes([byte]))
    ser.flush()
    out = b""
    deadline = time.monotonic() + window
    while time.monotonic() < deadline:
        chunk = ser.read(1)
        if chunk:
            out += chunk
            deadline = min(deadline, time.monotonic() + 0.4)
    return out


def read_addr(ser, byte, window, tries):
    """Send a read command, return (value or None, attempts).

    The bridge is best-effort: the controller pulses o_wb_ack for a single
    cycle and the AXI-Stream UART drops it when its transmitter is not ready,
    so a missing byte is a link flake rather than a data error -- hence the
    retries.  A byte that does arrive is never retried, it is compared as-is."""
    for attempt in range(1, tries + 1):
        resp = xfer(ser, byte, window)
        if resp:
            return resp[0], attempt
    return None, tries


def record(lines, kind, cmd, resp, tries=None):
    """Append one exchange to the transcript and echo it."""
    hexresp = resp.hex() if resp else "--"
    note = {"probe": "probe", "write": f"write {chr(cmd)!r}",
            "read": f"read {chr(cmd)!r}"}[kind]
    if tries and tries > 1:
        note += f" (try {tries})"
    lines.append(f"{'W' if kind == 'write' else 'R'} {cmd:02x} {hexresp} {note}")
    print(f"  {lines[-1]}")


def summarize(probe, checks):
    """Return (exit status, verdict text).

    checks is a list of (read byte, value read back or None, expected value).
    Nothing is asserted about write-ack bytes: the design does not always
    transmit one."""
    if probe is None:
        return 2, ("NO-RESPONSE -- the design never acked a read: it is either "
                   "held in reset (i_rst on G15 high) or calibration did not "
                   "finish (led[3:0] would be off)")
    bad = [(c, got, want) for c, got, want in checks if got != want]
    if bad:
        detail = ", ".join(f"{c}: got {g if g is None else hex(g)} want {hex(w)}"
                           for c, g, w in bad)
        return 1, f"FAIL ({len(bad)} of {len(checks)} checks wrong: {detail})"
    return 0, (f"PASS ({len(checks)} read-back checks matched -- DDR3 "
               "calibrated and holding data)")


def parse_transcript(text):
    """Replay a --log transcript into (probe, checks)."""
    lines = [l for l in text.splitlines() if LINE_RE.match(l)]
    want = 1 + 2 * len(CASES) + len(CASES)      # probe + pairs + re-reads
    if len(lines) != want:
        return None, None
    it = iter(lines)
    kind, cmd, resp = LINE_RE.match(next(it)).groups()
    if kind != "R" or int(cmd, 16) != ord(PROBE):
        return None, None
    probe = None if resp == "--" else int(resp, 16)
    checks = []
    for wch, rch, want_val in CASES:
        _, wcmd, _ = LINE_RE.match(next(it)).groups()
        _, rcmd, rresp = LINE_RE.match(next(it)).groups()
        if int(wcmd, 16) != ord(wch) or int(rcmd, 16) != ord(rch):
            return None, None
        checks.append((rch, None if rresp == "--" else int(rresp, 16), want_val))
    for _, rch, want_val in CASES:
        _, rcmd, rresp = LINE_RE.match(next(it)).groups()
        if int(rcmd, 16) != ord(rch):
            return None, None
        checks.append((rch, None if rresp == "--" else int(rresp, 16), want_val))
    return probe, checks


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", default="/dev/ttyUSB2")
    ap.add_argument("--baud", type=int, default=9600)
    ap.add_argument("--window", type=float, default=2.0,
                    help="seconds to wait for the ack of each command")
    ap.add_argument("--tries", type=int, default=3,
                    help="read attempts per address; the bridge's UART is "
                         "best-effort, so a dropped ack byte is retried")
    ap.add_argument("--log", default=None,
                    help="write the exchange transcript to this file")
    ap.add_argument("--file", default=None,
                    help="re-check a transcript instead of driving a board")
    args = ap.parse_args()

    if args.file:
        with open(args.file) as f:
            probe, checks = parse_transcript(f.read())
        if probe is None and checks is None:
            print("RESULT: NO-DATA (transcript is not a complete run)")
            return 2
        status, text = summarize(probe, checks)
        print(f"RESULT: {text}")
        return status

    try:
        import serial
    except ImportError:
        sys.stderr.write("pyserial not installed; pip install pyserial\n")
        return 2

    try:
        ser = serial.Serial(args.port, args.baud, timeout=0.1)
    except Exception as e:
        sys.stderr.write(f"cannot open {args.port}: {e}\n")
        return 2

    lines = []
    try:
        probe_val, probe_tries = read_addr(ser, ord(PROBE), args.window, args.tries)
        record(lines, "probe", ord(PROBE),
               b"" if probe_val is None else bytes([probe_val]), probe_tries)
        if probe_val is None:
            if args.log:
                with open(args.log, "w") as f:
                    f.write("\n".join(lines) + "\n")
            status, text = summarize(None, [])
            print(f"RESULT: {text}")
            return status

        checks = []
        for wch, rch, want_val in CASES:
            record(lines, "write", ord(wch), xfer(ser, ord(wch), args.window)[:1])
            val, tries = read_addr(ser, ord(rch), args.window, args.tries)
            record(lines, "read", ord(rch),
                   b"" if val is None else bytes([val]), tries)
            checks.append((rch, val, want_val))

        for _, rch, want_val in CASES:
            val, tries = read_addr(ser, ord(rch), args.window, args.tries)
            record(lines, "read", ord(rch),
                   b"" if val is None else bytes([val]), tries)
            checks.append((rch, val, want_val))
    finally:
        ser.close()
        if args.log:
            with open(args.log, "w") as f:
                f.write("\n".join(lines) + "\n")

    status, text = summarize(probe_val, checks)
    print(f"RESULT: {text}")
    return status


if __name__ == "__main__":
    sys.exit(main())
