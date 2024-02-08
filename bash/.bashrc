#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Env var
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

# Alias
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias cdcf='cd ~/.dotfiles'

# StartX on login at tty1
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx -- vt1 &> /dev/null

# Promt
PS1="\[\e[91m\][\[\e[0m\]\[\e[38;5;216m\]\u\[\e[38;5;220m\]@\[\e[38;5;222m\]\h \[\e[38;5;229m\]\W \[\033[0m\]\[\e[91m\]]\[\e[0m\]$ "
. "$HOME/.cargo/env"

# Auto complete like zsh
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

