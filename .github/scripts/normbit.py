#!/usr/bin/env python3
"""Print a comparison hash of a Xilinx .bit file with the embedded build
date/time blanked.

xc7frames2bit stamps the bitstream header with the build date ('c' TLV)
and time ('d' TLV), so byte-exact hashes of two builds never match even
when the bitstream is otherwise identical.  CI compares bitstreams by
blanking those two header sections first.
"""

import hashlib
import sys


def normalize(path):
    try:
        with open(path, "rb") as fh:
            data = bytearray(fh.read())
    except OSError as exc:
        sys.stderr.write(f"normbit: cannot read {path}: {exc}\n")
        raise SystemExit(1)
    # 13-byte sync header (00 09 0f f0 ... 00 00 01), then TLV sections
    # <tag><len:2 BE><payload incl. trailing NUL>; len == payload size.
    i = 13
    while i + 3 <= len(data):
        tag = data[i]
        if not (0x61 <= tag <= 0x7a):  # 'a'..'z'
            break
        length = (data[i + 1] << 8) | data[i + 2]
        if length == 0:
            i += 3
            continue
        if i + 3 + length > len(data):
            break
        if tag in (0x63, 0x64):  # 'c' = build date, 'd' = build time
            data[i + 3:i + 3 + length] = b"\x00" * length
        i += 3 + length
    return hashlib.sha256(bytes(data)).hexdigest()


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.stderr.write("usage: normbit.py <file.bit>\n")
        raise SystemExit(1)
    print(normalize(sys.argv[1]))
