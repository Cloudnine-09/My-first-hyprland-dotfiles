#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x) - Modified for Hyprland
## Github : @adi1090x
#
## Rofi   : Power Menu for Hyprland
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options (icons)
shutdown='󰐥'
reboot=''
lock=''
suspend='󰤄'
logout='󰍃'
yes='Yes'
no='No'

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "Goodbye ${USER}" \
        -mesg "Uptime: $uptime" \
        -theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
    rofi -dmenu \
        -p 'Confirmation' \
        -mesg 'Are you Sure?' \
        -theme "${dir}/shared/confirm.rasi"
}

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        case $1 in
            --shutdown)
                systemctl poweroff
                ;;
            --reboot)
                systemctl reboot
                ;;
            --suspend)
                # Pause music and mute before suspend
                mpc -q pause 2>/dev/null || true
                amixer set Master mute 2>/dev/null || true
                systemctl suspend
                ;;
            --logout)
                # Hyprland specific logout
                hyprctl dispatch exit
                ;;
        esac
    fi
}

# Lock screen function
lock_screen() {
    if command -v hyprlock >/dev/null 2>&1; then
        hyprlock
    elif command -v swaylock >/dev/null 2>&1; then
        swaylock
    elif command -v i3lock >/dev/null 2>&1; then
        i3lock
    else
        echo "No lock screen found"
    fi
}

# Main Actions
chosen="$(run_rofi)"
case "${chosen}" in
    $shutdown)
        run_cmd --shutdown
        ;;
    $reboot)
        run_cmd --reboot
        ;;
    $lock)
        lock_screen
        ;;
    $suspend)
        run_cmd --suspend
        ;;
    $logout)
        run_cmd --logout
        ;;
esac
