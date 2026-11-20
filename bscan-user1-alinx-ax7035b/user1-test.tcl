# Write the four LEDs through USER1 and read them back.
#
# Each scan shifts 8 bits through the register: it returns
# {LEDs before the scan, keys} and writes its low nibble to the LEDs.
# Exits with an error if a value does not come back.

proc user1 {value} {
    irscan xc7.tap 0x02
    return [expr {"0x[drscan xc7.tap 8 $value]" + 0}]
}

init
set errors 0
foreach value {0x1 0x2 0x4 0x8 0xf 0x5 0xa 0x0} {
    user1 $value
    set read [user1 $value]
    set leds [expr {$read >> 4}]
    set keys [expr {$read & 0xf}]
    echo [format "USER1 wrote 0x%x, read back 0x%x, keys 0x%x" $value $leds $keys]
    if {$leds != $value} {
        incr errors
    }
    sleep 500
}

if {$errors > 0} {
    echo "FAIL: $errors of 8 values did not come back"
    shutdown error
}
echo "PASS: 8 values written and read back"
shutdown
