#!/usr/bin/env bash
# demo-projects regression contract: FASM holds the emitted LUT INIT values.
exec python3 "$(dirname "$0")/check_init.py" "${FASM:-top.fasm}"
