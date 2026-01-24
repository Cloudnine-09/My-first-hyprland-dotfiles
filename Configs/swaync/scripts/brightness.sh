#!/bin/bash
iDIR="$HOME/.config/swaync/icons"
notification_timeout=1000
#step=5  # INCREASE/DECREASE BY THIS VALUE

# Get brightness
get_backlight() {
  brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

# Get icons
get_icon() {
  current=$(get_backlight)
  if   [ "$current" -le "20" ]; then
    icon="$iDIR/brightness-20.png"
  elif [ "$current" -le "40" ]; then
    icon="$iDIR/brightness-40.png"
  elif [ "$current" -le "60" ]; then
    icon="$iDIR/brightness-60.png"
  elif [ "$current" -le "80" ]; then
    icon="$iDIR/brightness-80.png"
  else
    icon="$iDIR/brightness-100.png"
  fi    
}

# Notify
notify_user() {
  notify-send -e -h string:x-canonical-private-synchronous:osd -h int:value:$current -u low -i $icon "Brightness" "$current%"
}

# Change brightness
change_backlight() {
  if [[ "$1" == "--inc" ]]; then
    brightnessctl set "+${step}%"
  elif [[ "$1" == "--dec" ]]; then
    brightnessctl set "${step}%-"
  fi
  
  # Always get fresh value AFTER change (works for both inc/dec)
  current=$(get_backlight)
  get_icon
  notify_user
}

# Execute accordingly
case "$1" in
  "--get")
    get_backlight
    ;;
  "--inc")
    change_backlight "+${step}%"
    ;;
  "--dec")
    change_backlight "${step}%-"
    ;;
  *)
    get_backlight
    ;;
esac
      
