#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Env var
export EDITOR=nvim
## Uncomment if using X11
#export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
#export QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu --disable-software-rasterizer"

# Alias
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias cdcf='cd ~/.dotfiles'

# StartX on login at tty1
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx -- vt1 &> /dev/null
[ "$(tty)" = "/dev/tty1" ] && exec river

# Promt
PS1="\[\e[91m\][\[\e[0m\]\[\e[38;5;216m\]\u\[\e[38;5;220m\]@\[\e[38;5;222m\]\h \[\e[38;5;229m\]\W \[\033[0m\]\[\e[91m\]]\[\e[0m\]$ "
#. "$HOME/.cargo/env"

# Auto complete like zsh
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

