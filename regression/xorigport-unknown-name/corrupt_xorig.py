#!/usr/bin/env python3
# Corrupt the synthesised JSON so a LUT's X_ORIG_PORT_A1 names a physical pin
# ("A1") instead of a logical input ("I0").  Renaming the port to "A1" makes the
# packer's xform_cell keep that name (it is not in the LUT2 port_xform), so the
# cell ends up with X_ORIG_PORT_A1="A1", which is not one of the LUT2's logical
# inputs {I0, I1}.  That is exactly the unknown-name case the guard rejects.
import json
import sys

src, dst = sys.argv[1], sys.argv[2]
with open(src) as f:
    d = json.load(f)

for name, m in d["modules"].items():
    if not m.get("attributes", {}).get("top"):
        continue
    for cname, cell in m["cells"].items():
        if not cell["type"].startswith("LUT"):
            continue
        pd = cell["port_directions"]
        conn = cell["connections"]
        if "I0" not in pd:
            continue
        pd["A1"] = pd.pop("I0")
        conn["A1"] = conn.pop("I0")
        with open(dst, "w") as out:
            json.dump(d, out)
        print("renamed I0->A1 in %s (%s)" % (cname, cell["type"]))
        sys.exit(0)

print("no LUT cell with an I0 port found to corrupt", file=sys.stderr)
sys.exit(1)
