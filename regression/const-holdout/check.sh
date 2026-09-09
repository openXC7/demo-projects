#!/usr/bin/env bash
# demo-projects regression contract: CASE_DIR holds the routed outputs.
exec python3 "$(dirname "$0")/check_const_pins.py" "${CASE_DIR:-$(dirname "$0")}/top_routed.json"
