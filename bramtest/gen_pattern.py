#!/usr/bin/env python3
"""Generate the memories for the bramtest design, and verify what the FPGA
reads back out of them over UART.

Two memories, one seed:

    mem0    8192 x 32 bits   first 8192 xorshift32 words
    mem36   4096 x 18 bits   next 4096 words, masked to 18 bits

xorshift32 (Marsaglia) is short enough to reimplement anywhere and carries no
hidden state, so one integer seed defines every bit the test checks.
"""

import argparse
import os
import select
import sys
import termios
import time

WORDS0 = 8192
BITS0 = 32
WORDS1 = 4096
BITS1 = 18

MARK0 = b"\xa5\x5a"
MARK1 = b"\xa5\x5b"

HEX0 = "bramtest.hex"
HEX1 = "bramtest36.hex"

DESCRIPTION = "Generate the bramtest memories, and verify the UART readback."

SPEEDS = {
    9600: termios.B9600,
    57600: termios.B57600,
    115200: termios.B115200,
    460800: termios.B460800,
    1000000: termios.B1000000,
}


def xorshift32(seed):
    state = seed & 0xFFFFFFFF
    if state == 0:
        state = 0x1D872B41
    while True:
        state ^= (state << 13) & 0xFFFFFFFF
        state ^= state >> 17
        state ^= (state << 5) & 0xFFFFFFFF
        state &= 0xFFFFFFFF
        yield state


def patterns(seed):
    """Both memories, taken from one stream so the seed describes the whole test."""
    generator = xorshift32(seed)
    words0 = [next(generator) for _ in range(WORDS0)]
    words1 = [next(generator) & ((1 << BITS1) - 1) for _ in range(WORDS1)]
    return words0, words1


def _read_text(path):
    try:
        with open(path, "r") as handle:
            return handle.read()
    except OSError:
        return None


def _write_if_changed(path, text):
    if _read_text(path) == text:
        return False
    try:
        with open(path, "w") as handle:
            handle.write(text)
    except OSError as error:
        raise SystemExit(f"cannot write {path}: {error}") from error
    return True


def write_hex(seed, path0=HEX0, path1=HEX1):
    """Write both hex files, touching a file only when its contents change.

    Make rebuilds follow modification times, so rewriting an identical file
    would trigger a pointless synthesis run.
    """
    words0, words1 = patterns(seed)
    changed0 = _write_if_changed(path0, "".join(f"{w:08x}\n" for w in words0))
    changed1 = _write_if_changed(path1, "".join(f"{w:05x}\n" for w in words1))
    return changed0 or changed1


def capture(device, baud, count0, count1, timeout):
    """Read both streams, splitting them up by their markers."""
    if baud not in SPEEDS:
        raise SystemExit(f"unsupported baud {baud}; known: {sorted(SPEEDS)}")
    speed = SPEEDS[baud]

    try:
        fd = os.open(device, os.O_RDONLY | os.O_NOCTTY)
    except OSError as error:
        raise SystemExit(f"cannot open {device}: {error}") from error

    try:
        attrs = termios.tcgetattr(fd)
        attrs[0] = 0
        attrs[1] = 0
        attrs[2] = termios.CS8 | termios.CREAD | termios.CLOCAL
        attrs[3] = 0
        attrs[4] = speed
        attrs[5] = speed
        termios.tcsetattr(fd, termios.TCSANOW, attrs)
        termios.tcflush(fd, termios.TCIFLUSH)

        buffer = bytearray()
        words0 = []
        words1 = []
        scan = 0
        deadline = time.time() + timeout

        while (len(words0) < count0 or len(words1) < count1) and time.time() < deadline:
            ready, _, _ = select.select([fd], [], [], 0.2)
            if not ready:
                continue
            try:
                chunk = os.read(fd, 8192)
            except OSError:
                break
            if not chunk:
                continue
            buffer.extend(chunk)

            # Once locked on a marker the stream stays frame aligned, so a
            # marker-looking byte inside a payload cannot desynchronise it.
            while scan < len(buffer):
                if buffer[scan] != 0xA5:
                    scan += 1
                    continue
                if len(buffer) - scan < 2:
                    break
                second = buffer[scan + 1]
                if second == 0x5A:
                    if len(buffer) - scan < 6:
                        break
                    b0, b1, b2, b3 = buffer[scan + 2:scan + 6]
                    words0.append(b0 | b1 << 8 | b2 << 16 | b3 << 24)
                    scan += 6
                elif second == 0x5B:
                    if len(buffer) - scan < 5:
                        break
                    b0, b1, b2 = buffer[scan + 2:scan + 5]
                    words1.append((b0 | b1 << 8 | b2 << 16) & ((1 << BITS1) - 1))
                    scan += 5
                else:
                    scan += 1
            del buffer[:scan]
            scan = 0
        return words0, words1
    finally:
        os.close(fd)


def _compare(name, expected, observed, seed):
    """Compare around the ring: the design streams continuously, so a capture
    starts at an arbitrary word."""
    if len(observed) < len(expected):
        print(f"FAIL seed {seed} {name}: got {len(observed)}/{len(expected)} words",
              file=sys.stderr)
        return False

    index_of = {word: position for position, word in enumerate(expected)}
    start = index_of.get(observed[0])
    if start is None:
        print(f"FAIL seed {seed} {name}: first word {observed[0]:x} is not in the pattern",
              file=sys.stderr)
        return False

    count = len(expected)
    for step, got in enumerate(observed[:count]):
        position = (start + step) % count
        if expected[position] != got:
            print(f"FAIL seed {seed} {name}: word {position} expected "
                  f"{expected[position]:x} got {got:x} (stream started at {start})",
                  file=sys.stderr)
            return False

    print(f"  {name}: {count} words match, stream started at index {start}")
    return True


def verify(device, baud, seed, timeout):
    expected0, expected1 = patterns(seed)
    observed0, observed1 = capture(device, baud, WORDS0, WORDS1, timeout)
    ok0 = _compare("mem0 ", expected0, observed0, seed)
    ok1 = _compare("mem36", expected1, observed1, seed)
    if ok0 and ok1:
        print(f"PASS seed {seed}: {WORDS0}x{BITS0} and {WORDS1}x{BITS1} verified")
        return 0
    return 1


def main(argv):
    parser = argparse.ArgumentParser(description=DESCRIPTION)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--verify", metavar="DEVICE",
                        help="read both streams back from DEVICE instead of writing hex")
    parser.add_argument("--baud", type=int, default=1000000)
    parser.add_argument("--timeout", type=float, default=20.0)
    args = parser.parse_args(argv)

    if args.verify:
        return verify(args.verify, args.baud, args.seed, args.timeout)

    changed = write_hex(args.seed)
    state = "updated" if changed else "unchanged"
    print(f"{HEX0} ({WORDS0}x{BITS0}), {HEX1} ({WORDS1}x{BITS1}): {state}, "
          f"seed {args.seed}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
