#!/bin/bash
# caps.sh - Ultimate version

notify_caps() {
    xdotool key Caps_Lock 2>/dev/null || true
    sleep 0.05
    
    if xset q 2>/dev/null | grep -iq "caps lock:\s*on"; then
        notify-send -e \
          -u low -t 1000 "󰌿  ON" "Caps-Lock" \
          -h int:value:1 \
          -h string:x-canonical-private-synchronous:osd
    else
        notify-send -e \
          -u low -t 1000 "󰍁  OFF" "Caps-Lock" \
          -h int:value:0 \
          -h string:x-canonical-private-synchronous:osd
    fi
}
notify_caps
