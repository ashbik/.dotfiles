#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd'
alias pms='sudo pacman -S r'
PS1='[\u@\h \W]\$ '

pfetch

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /home/at/.config/broot/launcher/bash/br
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
