#!/usr/bin/env python3
"""Host-side serial verifier for the DSP issue #159 reproducer.

Reads the UART console at 115200, parses "a=%x b=%x p=%x" lines and checks
p == a*b (32-bit unsigned).  Prints a PASS/FAIL summary with sample lines.

With the buggy nextpnr-xilinx, a and b count up while p stays 0  -> FAIL.
With the pr-159 fix, every line satisfies p == a*b                  -> PASS.

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

LINE_RE = re.compile(r"a=([0-9a-fA-F]+)\s+b=([0-9a-fA-F]+)\s+p=([0-9a-fA-F]+)")


def check_line(line):
    """Return (a, b, p, expected, ok) for a parsed line, or None."""
    m = LINE_RE.search(line)
    if not m:
        return None
    a = int(m.group(1), 16)
    b = int(m.group(2), 16)
    p = int(m.group(3), 16)
    expected = (a * b) & 0xFFFFFFFF
    return a, b, p, expected, (p == expected)


def summarize(samples, checked, passed, failed):
    print("checked=%d passed=%d failed=%d" % (checked, passed, failed))
    if samples:
        print("--- sample lines ---")
        for line, a, b, p, expected, ok in samples:
            print("[%s] %s  (a*b=%08x)" % ("OK " if ok else "BAD", line, expected))
    if checked == 0:
        print("RESULT: NO-DATA (no parseable lines received)")
        return 1
    if failed:
        print("RESULT: FAIL (%d of %d lines have p != a*b)" % (failed, checked))
        return 1
    print("RESULT: PASS (%d lines all satisfy p == a*b)" % checked)
    return 0
def consume_bytes(buf, samples, checked, passed, failed):
    """Split buf on newlines, parse lines, return (buf, checked, passed, failed)."""
    while b"\n" in buf:
        raw, buf = buf.split(b"\n", 1)
        line = raw.decode("utf-8", "replace").rstrip("\r")
        r = check_line(line)
        if r is None:
            continue
        a, b, p, expected, ok = r
        checked += 1
        if ok:
            passed += 1
        else:
            failed += 1
        if len(samples) < 20:
            samples.append((line, a, b, p, expected, ok))
    return buf, checked, passed, failed




def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", default="/dev/ttyUSB2")
    ap.add_argument("--baud", type=int, default=115200)
    ap.add_argument("--seconds", type=float, default=30.0)
    ap.add_argument("--log", default=None)
    ap.add_argument("--file", default=None)
    args = ap.parse_args()

    samples = []
    checked = passed = failed = 0

    if args.file:
        with open(args.file, "rb") as f:
            buf = f.read()
        buf, checked, passed, failed = consume_bytes(
            buf, samples, checked, passed, failed
        )
        return summarize(samples, checked, passed, failed)

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
            buf += chunk
            buf, checked, passed, failed = consume_bytes(
                buf, samples, checked, passed, failed
            )
    finally:
        ser.close()
        if logf:
            logf.close()

    return summarize(samples, checked, passed, failed)


if __name__ == "__main__":
    sys.exit(main())
