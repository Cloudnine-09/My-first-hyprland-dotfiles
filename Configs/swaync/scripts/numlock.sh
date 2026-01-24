#!/bin/bash
# numlock.sh - Ultimate version

notify_numlock() {
    xdotool key Num_Lock 2>/dev/null || true
    sleep 0.05
    
    if xset q 2>/dev/null | grep -iq "num lock:\s*on"; then
        notify-send -e \
          -u low -t 1000 "󰔠  ON" "Num-Lock" \
          -h int:value:1 \
          -h string:x-canonical-private-synchronous:osd
    else
        notify-send -e \
          -u low -t 1000 "󰍁  OFF" "Num-Lock" \
          -h int:value:0 \
          -h string:x-canonical-private-synchronous:osd
    fi
}
notify_numlock
