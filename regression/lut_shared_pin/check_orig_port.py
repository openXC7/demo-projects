#!/usr/bin/env python3
"""Check that X_ORIG_PORT_* in a routed JSON is well formed.

X_ORIG_PORT_<phys> lists the logical cell ports that were merged onto one
physical pin, separated by " ".  Every reader splits on that separator, so a
value that does not survive a split is a silently wrong pin map -- and a wrong
pin map means a LUT is written into the bitstream with a permuted truth table
while the netlist and every simulation of it stay correct.

Usage:  check_orig_port.py <design>_routed.json
Exits non-zero, and names the cells, if any value is malformed.
"""
import json
import re
import sys

LOGICAL_INPUT = re.compile(r"^I\d+$")


def check(path):
    with open(path) as f:
        design = json.load(f)

    bad = []
    shared = 0
    for module in design.get("modules", {}).values():
        for cell_name, cell in module.get("cells", {}).items():
            for attr, value in cell.get("attributes", {}).items():
                if not attr.startswith("X_ORIG_PORT_"):
                    continue
                if not isinstance(value, str):
                    continue
                tokens = value.split(" ")
                if len(tokens) > 1:
                    shared += 1
                # A trailing or doubled separator leaves an empty token; a
                # missing one leaves two names stuck together.
                if any(t == "" for t in tokens):
                    bad.append((cell_name, attr, value, "empty token"))
                elif attr.startswith("X_ORIG_PORT_A") and not all(
                        LOGICAL_INPUT.match(t) for t in tokens):
                    bad.append((cell_name, attr, value, "not a logical input name"))

    print("%s: %d attributes list more than one logical port" % (path, shared))
    if shared == 0:
        print("  WARNING: nothing shared a pin, so this design tests nothing")
        return 1
    for cell_name, attr, value, why in bad[:20]:
        print("  MALFORMED %s %s = %r  (%s)" % (cell_name, attr, value, why))
    if bad:
        print("  %d malformed attribute(s) -- the pin map is wrong" % len(bad))
        return 1
    print("  all well formed")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    sys.exit(check(sys.argv[1]))
