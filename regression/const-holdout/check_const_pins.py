#!/usr/bin/env python3
"""Check that every constant-tied LUTRAM address pin was actually routed.

Guards openXC7/nextpnr-xilinx#180 / PR #184: the post-router constant fill
(routeVcc) used to silently drop $PACKER_GND_NET sinks it could not reach
(GFAN wires held by signal nets), leaving the pin's IMUX unprogrammed.  An
unrouted xc7 input mux reads 1, so a dropped GND address bit makes a 16-deep
FIFO write at 16-31 while reading at 0-15 -- silent memory corruption with a
clean exit 0.

Reads the JSON written by ``nextpnr-xilinx --write``.  A RAM32M is split by
the packer into SLICE_LUTX cells with X_ORIG_TYPE RAMD32; their A<k> ports
(read address) and WA<k> ports (write address) that sit on the GND net must
be reached by that net's routing at the slice's site pin
(SITEWIRE/<slice>/<lane><k> for A<k>, SITEWIRE/<slice>/D<k> for WA<k>).
A pin is also accepted when it is driven by a constant-0 LUT (the
$PACKER_GND_NET$holdout$N drivers PR #184 adds) whose net reaches the site
pin.

Exit status 1 when any pin is missing or no LUTRAM was found at all.
"""
import collections
import json
import sys


def lut_const(cell):
    """Return 0/1 for a LUT whose output is that constant, else None."""
    if cell["type"] != "SLICE_LUTX":
        return None
    init = cell["parameters"].get("INIT", "")
    if not init or set(init) - {"0", "1"}:
        return None
    if any(cell["connections"].get(f"A{i}") for i in range(1, 7)):
        return None
    if set(init) == {"0"}:
        return 0
    if set(init) == {"1"}:
        return 1
    return None


def main(path):
    with open(path) as f:
        design = json.load(f)
    mod = next(iter(design["modules"].values()))
    cells, nets = mod["cells"], mod["netnames"]
    gnd = nets["$PACKER_GND_NET"]["bits"][0]
    vcc = nets["$PACKER_VCC_NET"]["bits"][0]

    const_bits = {gnd: 0, vcc: 1}
    for name, cell in cells.items():
        value = lut_const(cell)
        if value is None:
            continue
        for bit in cell["connections"].get("O6", []):
            const_bits[bit] = value

    def routed_pins(netname):
        routing = nets[netname]["attributes"].get("ROUTING", "")
        return set(w for w in routing.split(";") if w.startswith("SITEWIRE/"))

    gnd_pins = routed_pins("$PACKER_GND_NET")
    zero_pins = set(gnd_pins)
    for name, net in nets.items():
        if name == "$PACKER_GND_NET" or len(net["bits"]) != 1:
            continue
        if const_bits.get(net["bits"][0]) == 0:
            zero_pins |= routed_pins(name)

    # slice -> {site pin -> (memory name, cell port)} for every address pin on
    # a constant-0 net (the GND net itself or a constant-0 LUT driver)
    wanted = collections.defaultdict(dict)
    for name, cell in cells.items():
        if cell["attributes"].get("X_ORIG_TYPE") != "RAMD32":
            continue
        slice_, lut = cell["attributes"]["NEXTPNR_BEL"].split("/")
        lane = lut[0]
        mem = name.rpartition("/")[0] or name
        for port, bits in cell["connections"].items():
            if cell["port_directions"].get(port) != "input" or len(bits) != 1:
                continue
            if const_bits.get(bits[0]) != 0:
                continue
            if port.startswith("WA"):
                pin = "D" + port[2:]
            elif port.startswith("A"):
                pin = lane + port[1:]
            else:
                continue
            wanted[slice_][pin] = (mem, f"{name.rpartition('/')[2]}.{port}")

    if not wanted:
        print("no RAM32M with constant address pins found; nothing to check")
        return 1

    bad = 0
    print(f"== {path}: GND-tied LUTRAM address pins, per slice")
    for slice_, pins in sorted(wanted.items(), key=lambda kv: next(iter(kv[1].values()))[0]):
        mem = next(iter(pins.values()))[0]
        state = {}
        for pin in sorted(pins):
            wire = f"SITEWIRE/{slice_}/{pin}"
            state[pin] = "gnd" if wire in gnd_pins else ("lut" if wire in zero_pins else "NO")
        ok = "NO" not in state.values()
        bad += not ok
        pins_str = " ".join(f"{p}={s}" for p, s in state.items())
        print(f"  {mem:24s} {slice_:14s} {pins_str}   -> {'OK' if ok else 'BROKEN'}")
        if not ok:
            for pin, s in state.items():
                if s == "NO":
                    print(f"      unrouted: {pins[pin][1]} -> {slice_}/{pin}")
    print(f"{len(wanted)} RAM32M slices, {bad} broken")
    return 1 if bad else 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(f"usage: {sys.argv[0]} top_routed.json")
    sys.exit(main(sys.argv[1]))
