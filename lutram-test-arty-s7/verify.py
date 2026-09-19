#!/usr/bin/env python3
"""Host-side serial verifier for the 64-deep distributed RAM (RAM64X1S) test.

The design (top.v) writes and reads back a 64 x 8 distributed RAM, which
yosys infers as 8 x RAM64X1S -- a shape nextpnr-xilinx used to reject with
"Cannot pack unsupported primitive: RAM64X1S".  Every read is streamed as

    p<pass> a=<addr> d=<data> e=<on-chip mismatch count>\\r\\n

This script re-derives the expected data independently of the design:

    pass 1   d = address
    pass 2   d = ~address
    pass 3   d = 0xa5 ^ (address * 7)
    pass 4   d = 0x6d ^ (address * 0x1f)

PASS requires a whole cycle: all four passes present, all 64 addresses
covered in each, every value matching, and the on-chip counter e back at 0
(e is also checked to be monotonically non-decreasing, so a garbled line
cannot silently hide a mismatch the design saw).

Modes:
    verify.py [--port /dev/ttyUSB2] [--seconds 30] [--log capture.log]
        open the serial port live and capture for --seconds.

    verify.py --file capture.log
        parse a pre-captured raw byte log (offline).
"""
import argparse
import re
import sys
import time

LINE_RE = re.compile(r"p([1-4]) a=([0-9a-fA-F]{2}) d=([0-9a-fA-F]{2}) e=([0-9a-fA-F]{4})")
PASSES = (1, 2, 3, 4)


def expected(p, a):
    """The byte pass p writes to address a before reading it back."""
    if p == 1:
        return a & 0xFF
    if p == 2:
        return (~a) & 0xFF
    if p == 3:
        return (0xA5 ^ (a * 7)) & 0xFF
    if p == 4:
        return (0x6D ^ (a * 0x1F)) & 0xFF
    raise ValueError("pass %d does not exist" % p)


class Checker:
    def __init__(self):
        self.checked = 0
        self.failed = 0
        self.samples = []
        self.addrs = {p: set() for p in PASSES}
        self.last_err = None
        self.err_decreased = 0
        self.err_nonzero = 0

    def feed(self, line):
        m = LINE_RE.search(line)
        if not m:
            return
        p, a, d, e = (int(m.group(i), 16) for i in range(1, 5))
        want = expected(p, a)
        self.checked += 1
        self.addrs[p].add(a)
        if d != want:
            self.failed += 1
            if len(self.samples) < 20:
                self.samples.append((line, p, a, d, want))
        if self.last_err is not None and e < self.last_err:
            self.err_decreased += 1
        self.last_err = e
        if e != 0:
            self.err_nonzero += 1

    def summarize(self):
        print(
            "checked=%d mismatches=%d  distinct addresses: %s"
            % (
                self.checked,
                self.failed,
                " ".join("p%d=%d" % (p, len(self.addrs[p])) for p in PASSES),
            )
        )
        print("on-chip counter e: last=%s lines_with_e_nonzero=%d decreases=%d"
              % (self.last_err, self.err_nonzero, self.err_decreased))
        if self.samples:
            print("--- mismatch samples ---")
            for line, p, a, d, want in self.samples:
                print("[BAD] %s  (pass %d addr %02x: want %02x)" % (line, p, a, want))
        if self.checked == 0:
            print("RESULT: NO-DATA (no parseable lines received)")
            return 2
        if self.failed or self.err_nonzero or self.err_decreased:
            print("RESULT: FAIL (%d value mismatches, %d lines with e!=0, %d e decreases)"
                  % (self.failed, self.err_nonzero, self.err_decreased))
            return 1
        missing = [p for p in PASSES if len(self.addrs[p]) < 64]
        if missing:
            print("RESULT: INCOMPLETE (pass(es) %s did not cover all 64 addresses -- "
                  "capture longer)" % ",".join(str(p) for p in missing))
            return 2
        print("RESULT: PASS (%d reads: 4 passes x 64 addresses, all match, e==0)"
              % self.checked)
        return 0


def consume_bytes(buf, ck):
    """Split buf on newlines, feed complete lines, return the remainder."""
    while b"\n" in buf:
        raw, buf = buf.split(b"\n", 1)
        ck.feed(raw.decode("utf-8", "replace").rstrip("\r"))
    return buf


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", default="/dev/ttyUSB2")
    ap.add_argument("--baud", type=int, default=115200)
    ap.add_argument("--seconds", type=float, default=30.0)
    ap.add_argument("--log", default=None)
    ap.add_argument("--file", default=None)
    args = ap.parse_args()

    ck = Checker()

    if args.file:
        with open(args.file, "rb") as f:
            consume_bytes(f.read(), ck)
        return ck.summarize()

    try:
        import serial  # type: ignore
    except ImportError:
        sys.stderr.write(
            "pyserial not installed; fall back to:\n"
            "  stty -F %s %d raw -echo && cat %s > capture.log\n"
            "then run: verify.py --file capture.log\n"
            % (args.port, args.baud, args.port)
        )
        return 2

    try:
        ser = serial.Serial(args.port, args.baud, timeout=1.0)
    except Exception as e:
        sys.stderr.write("cannot open %s: %s\n" % (args.port, e))
        return 2

    logf = open(args.log, "wb") if args.log else None
    deadline = time.time() + args.seconds
    buf = b""
    try:
        while time.time() < deadline:
            chunk = ser.read(4096)
            if not chunk:
                continue
            if logf:
                logf.write(chunk)
                logf.flush()
            buf = consume_bytes(buf + chunk, ck)
    finally:
        ser.close()
        if logf:
            logf.close()

    return ck.summarize()


if __name__ == "__main__":
    sys.exit(main())
