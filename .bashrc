#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ssh="kitty +kitten ssh"
alias vim="nvim"
alias ls="exa -laF --icons --sort type"

PS1='[\u@\h \W]\$ '

# Increase history size because 500 is not enough
export HISTSIZE=5000
export HISTFILESIZE=-1

export EDITOR="vim"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
