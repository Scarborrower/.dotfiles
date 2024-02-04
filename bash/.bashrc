#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#env var
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

#alias
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias v='nvim'

#promt
PS1="\[\e[91m\][\[\e[0m\]\[\e[38;5;216m\]\u\[\e[38;5;220m\]@\[\e[38;5;222m\]\h \[\e[38;5;229m\]\W \[\033[0m\]\[\e[91m\]]\[\e[0m\]$ "
. "$HOME/.cargo/env"
