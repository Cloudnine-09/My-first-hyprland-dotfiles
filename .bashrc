#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export COLORTERM=truecolor

eval "$(starship init bash)"
eval "$(zoxide init bash)"

export EZA_ICONS_AUTO=always

alias ls="eza --icons=always"
alias ba="upower -i /org/freedesktop/UPower/devices/battery_BAT1"

alias In="sudo reflector --verbose --country 'India' -l 10 --sort rate --save /etc/pacman.d/mirrorlist"

alias cd="z"

export PATH="$HOME/.local/bin:$PATH"

alias ff="fastfetch"

alias fs="sudo fstrim -av"

alias flr="flatpak uninstall --unused --delete-data"
