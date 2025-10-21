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

export EZA_ICONS_AUTO=always

alias es="eza --icons=always"
alias el="eza -l --icons=always"
alias ela="eza -la --icons=always"
alias elah="eza -lah --icons=always"

